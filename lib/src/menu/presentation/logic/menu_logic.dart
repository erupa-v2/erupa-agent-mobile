import '../../../../core/user/data/database/user_local_database.dart';
import '../../../../injection_container.dart';
import '../../../../shared/util/navigation.dart';
import '../../../home/presentation/interface/pages/home.dart';
import '../bloc/menu_bloc.dart';
import '../interface/pages/menu.dart';
import 'package:flutter/material.dart';

import '../../../../core/user/domain/entities/user.dart';
import '../../../../shared/presentation/snackbar.dart';
import '../interface/widgets/edit_sheet.dart';

/// Contains logic for [MenuPage]
mixin MenuLogic {
  /// [MenuBloc] dependency
  final _bloc = sl<MenuBloc>();

  /// Method to toggle user details bottom sheet
  Future<void> showUserDetailsSheet({required BuildContext context}) async {
    final result = await _bloc.retrieveUserData();
    return result.fold((failure) {
      SnackBarHelper.showErrorSnackBar(context, failure.message);
    }, (data) {
      showModalBottomSheet(
        enableDrag: false,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return EditBottomSheet(user: data);
        },
      );
    });
  }

  /// Method to update user's remote and local details
  Future<void> updateUser({
    required BuildContext context,
    required User user,
  }) async {
    final result = await _bloc.updateUserData(user: user);
    return result.fold((failure) {
      SnackBarHelper.showErrorSnackBar(context, failure.message);
      Navigator.of(context).pop();
    }, (user) async {
      // To avoid async gap warning
      void showSnackbarAndPop() {
        SnackBarHelper.showSuccessSnackBar(
            context, 'User details updated successfully');
        NavigationHelper.navigateToAndRemoveUntil(context, const HomePage());
      }

      await sl<UserLocalDatabase>().cache(user);
      showSnackbarAndPop();
    });
  }

  /// Method to retrieve user's details
  Future<User> retrieveUserDetails({
    required BuildContext context,
  }) async {
    final result = await _bloc.retrieveUserData();
    return result.fold((failure) {
      SnackBarHelper.showErrorSnackBar(context, failure.message);
      return User.initial();
    }, (user) => user);
  }
}
