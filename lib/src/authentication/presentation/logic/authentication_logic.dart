import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/cupertino.dart';

import '../../../../core/user/domain/entities/user.dart';
import '../../../../injection_container.dart';
import '../../../../shared/presentation/i18n/localization.dart';
import '../../../../shared/presentation/snackbar.dart';
import '../../../../shared/util/generators.dart';
import '../../../../shared/util/navigation.dart';
import '../../../home/presentation/interface/pages/home.dart';
import '../bloc/authentication_bloc.dart';
import '../interface/pages/otp.dart';

/// Contains logic for [PhoneVerificationPage]
mixin AuthLogicMixin {
  /// [FirebaseAuth] dependency
  final _auth = FirebaseAuth.instance;

  /// [AuthBloc] dependency
  final _bloc = sl<AuthenticationBloc>();

  /// Method to verify user's phone number
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required BuildContext context,
    required ValueNotifier<bool> submitButtonState,
    required ValueNotifier<bool> disabledButtonState,
  }) async {
    final localization = AppLocalizations.of(context)!;
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _handleAuthSuccess(credential, context);
      },
      verificationFailed: (FirebaseAuthException e) {
        SnackBarHelper.showErrorSnackBar(context, e.message!);
        print(e.message);
        // Persist state of CTA buttons
        submitButtonState.value = false;
        disabledButtonState.value = false;
      },
      codeSent: (String verificationId, int? resendToken) {
        SnackBarHelper.showSuccessSnackBar(context, localization.codeSent);
        NavigationHelper.navigateTo(
            context,
            PhoneVerificationPage(
                verificationId: verificationId,
                resendToken: resendToken,
                phoneNumber: phoneNumber));
        // Persist state of CTA buttons
        submitButtonState.value = false;
        disabledButtonState.value = false;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  /// Resend otp code
  Future<void> resendOtp({
    required String phoneNumber,
    required BuildContext context,
    required ValueNotifier<bool> otpValidState,
    required ValueNotifier<bool> disabledButtonState,
    required int? token,
  }) async {
    final localization = AppLocalizations.of(context)!;
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _handleAuthSuccess(credential, context);
          // Persist state of CTA buttons
          otpValidState.value = false;
          disabledButtonState.value = false;
        },
        verificationFailed: (FirebaseAuthException e) {
          SnackBarHelper.showErrorSnackBar(context, e.message!);
          // Persist state of CTA buttons
          otpValidState.value = false;
          disabledButtonState.value = false;
        },
        codeSent: (String verificationId, int? resendToken) {
          SnackBarHelper.showSuccessSnackBar(context, localization.codeSent);
          NavigationHelper.navigateToReplacement(
              context,
              PhoneVerificationPage(
                  verificationId: verificationId,
                  resendToken: token,
                  phoneNumber: phoneNumber));
          // Persist state of CTA buttons
          otpValidState.value = false;
          disabledButtonState.value = false;
        },
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  /// Go back and edit number
  Future<void> editNumber({
    required BuildContext context,
    required ValueNotifier<bool> disabledButtonState,
  }) async {
    NavigationHelper.navigateBack(context);
    // Persist state of CTA buttons
    disabledButtonState.value = false;
  }

  /// Method to handle otp verification
  Future<void> signInWithOTP({
    required String otp,
    required BuildContext context,
    required String verificationId,
    required ValueNotifier<bool> otpValidState,
    required ValueNotifier<bool> disabledButtonState,
  }) async {
    final localization = AppLocalizations.of(context)!;
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      // Persist state of CTA buttons
      disabledButtonState.value = false;
      await _handleAuthSuccess(credential, context);
    } catch (e) {
      final error = e as FirebaseAuthException;
      switch (error.code) {
        case "invalid-verification-code":
          {
            SnackBarHelper.showErrorSnackBar(
              context,
              localization.wrongOtp,
            );
            // Persist state of CTA buttons
            otpValidState.value = false;
            disabledButtonState.value = false;
            break;
          }
        case "internal-error":
          {
            SnackBarHelper.showErrorSnackBar(context, error.message!);
            // Persist state of CTA buttons
            otpValidState.value = false;
            disabledButtonState.value = false;
            break;
          }
        default:
          {
            SnackBarHelper.showErrorSnackBar(context, error.message!);
            // Persist state of CTA buttons
            otpValidState.value = false;
            disabledButtonState.value = false;
            break;
          }
      }
    }
  }

  /// Handle authentication success
  Future<void> _handleAuthSuccess(
      PhoneAuthCredential credential, BuildContext context) async {
    final localization = AppLocalizations.of(context)!;
    final user = await _auth.signInWithCredential(credential);
    final phone = user.user!.phoneNumber;
    final newUser = User.initial().copyWith(
        id: user.user!.uid, username: generateUsername(), phoneNumber: phone!);

    /// To prevent async gap warning
    showSnackbarAndNavigateHome({bool newUser = false}) {
      SnackBarHelper.showSuccessSnackBar(
          context,
          newUser
              ? localization.newUserWelcome
              : localization.authenticatedSuccess);
      NavigationHelper.navigateToAndRemoveUntil(context, const HomePage());
    }

    if (user.additionalUserInfo!.isNewUser) {
      final result = await _bloc.createNewUser(newUser);
      return result.fold((failure) {
        SnackBarHelper.showErrorSnackBar(context, failure.message);
        NavigationHelper.navigateBack(context);
      }, (success) async {
        showSnackbarAndNavigateHome(newUser: true);
      });
    }
    final result = await _bloc.retrieveExistingUser();
    // persist user data locally
    if (!result) {
      await _bloc.persistUserData(newUser);
    }
    showSnackbarAndNavigateHome();
  }
}
