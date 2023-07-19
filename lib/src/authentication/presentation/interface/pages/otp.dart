import 'package:animate_do/animate_do.dart';
import 'package:erupa_agent_v2/shared/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pinput/pinput.dart';

import '../../../../../shared/presentation/i18n/localization.dart';
import '../../logic/authentication_logic.dart';

class PhoneVerificationPage extends StatelessWidget with AuthLogicMixin {
  PhoneVerificationPage({
    Key? key,
    required this.verificationId,
    required this.resendToken,
    required this.phoneNumber,
  }) : super(key: key);

  final String verificationId;
  final int? resendToken;
  final String phoneNumber;
  final formKey = GlobalKey<FormState>();

  // Checks for the state of the OTP code
  final otpValidState = ValueNotifier(false);

  // show the disabled button
  final showDisabledButton = ValueNotifier(true);

  // Collects otp code from textfield
  final otpCode = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle:
          const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(6),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.black, width: 4),
      borderRadius: BorderRadius.circular(6),
    );

    final submittedPinTheme = defaultPinTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(localization.confirmYourNumber.capitalize()),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(IconlyLight.info_circle, size: 24),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.5),
          child: Container(
            height: 1,
            color: Colors.grey.shade300,
          ),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(bottom: 25),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInRightBig(
                from: 50,
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 25),
                  child: Text(
                    localization.enterCode.capitalize(),
                    textAlign: TextAlign.start,
                    style: textTheme.labelLarge!.apply(color: Colors.black),
                  ),
                ),
              ),
              SlideInUp(
                from: 10,
                duration: const Duration(milliseconds: 300),
                child: Form(
                  key: formKey,
                  child: Pinput(
                      length: 6,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      onChanged: (String value) {
                        otpCode.value = value;
                        if (value.length < 6) {
                          showDisabledButton.value = true;
                        }
                      },
                      onCompleted: (String value) {
                        showDisabledButton.value = false;
                      },
                      androidSmsAutofillMethod:
                          AndroidSmsAutofillMethod.smsRetrieverApi),
                ),
              ),
              SlideInUp(
                from: 20,
                duration: const Duration(milliseconds: 200),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () async {
                        await editNumber(
                            context: context,
                            disabledButtonState: showDisabledButton);
                      },
                      child: Text(localization.editNumber),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      onPressed: () async {
                        await resendOtp(
                          phoneNumber: phoneNumber,
                          context: context,
                          otpValidState: otpValidState,
                          token: resendToken,
                          disabledButtonState: showDisabledButton,
                        );
                      },
                      child: Text(localization.resendCode),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: null,
                  child: Text(
                    localization.verification.capitalize(),
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ).withLoadingState(
                  loading: otpValidState,
                  disabled: showDisabledButton,
                  onPressed: () async {
                    if (!formKey.currentState!.validate()) return;
                    otpValidState.value = true;
                    showDisabledButton.value = false;
                    await signInWithOTP(
                      otp: otpCode.value,
                      context: context,
                      verificationId: verificationId,
                      otpValidState: otpValidState,
                      disabledButtonState: showDisabledButton,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
