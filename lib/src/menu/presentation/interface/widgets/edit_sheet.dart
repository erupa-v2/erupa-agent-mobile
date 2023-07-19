import 'package:animate_do/animate_do.dart';
import '../../../../../shared/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/user/domain/entities/user.dart';
import '../../../../../shared/presentation/divider.dart';
import '../../../../../shared/presentation/i18n/localization.dart';
import '../../logic/menu_logic.dart';

class EditBottomSheet extends StatelessWidget with MenuLogic {
  EditBottomSheet({super.key, required this.user});

  // Get user details from previous page
  final User user;

  // Collects username from textfield
  final username = ValueNotifier<String>('');

  // Checks for valid username
  final usernameValidState = ValueNotifier(false);

  // show the CTA button
  final showSubmitButton = ValueNotifier(false);

  // show the disabled CTA button
  final showDisabledButton = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    IconlyBold.close_square,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Edit profile information',
                    style: theme.textTheme.bodyLarge!.apply(
                      fontWeightDelta: 5,
                    ),
                  ),
                )
              ],
            ),
            const CustomDivider(),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(localization.profileDetailsSharing),
            ),
            SlideInUp(
              from: 40,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  initialValue: user.username,
                  cursorColor: Colors.black,
                  onChanged: (value) {
                    username.value = value;
                    if (value.isEmpty) {
                      showDisabledButton.value = true;
                    }
                    if (value.length > 5) {
                      usernameValidState.value = true;
                      showDisabledButton.value = false;
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(IconlyBold.profile),
                    hintText: user.username,
                    hintStyle: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
                bottom: 60,
                top: 10,
              ),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  localization.editProfile,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ).withLoadingState(
                loading: showSubmitButton,
                disabled: showDisabledButton,
                onPressed: () async {
                  // Check if both username and phone number are valid
                  if (usernameValidState.value) {
                    showDisabledButton.value = true;
                    showSubmitButton.value = true;
                    await updateUser(
                      context: context,
                      user: user.copyWith(
                        username: username.value,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
