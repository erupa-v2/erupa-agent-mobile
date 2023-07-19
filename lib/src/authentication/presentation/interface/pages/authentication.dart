import 'package:animate_do/animate_do.dart';
import 'package:erupa_agent_v2/shared/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../../../shared/presentation/i18n/localization.dart';
import '../../logic/authentication_logic.dart';

class AuthenticationPage extends StatelessWidget with AuthLogicMixin {
  AuthenticationPage({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  // Checks for valid phone number
  final phoneNumberValidState = ValueNotifier(false);

  // show the CTA button
  final showSubmitButton = ValueNotifier(false);

  // show the disabled CTA button
  final showDisabledButton = ValueNotifier(true);

  // Collects phone number from textfield
  final phoneNumber = ValueNotifier('');

  // form handler
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(localization.loginOrSignup.capitalize()),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                IconlyLight.info_circle,
                size: 24,
              ))
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
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: FadeInRightBig(
                  from: 5,
                  delay: const Duration(milliseconds: 150),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.black.withOpacity(0.5)),
                    ),
                    child: Stack(
                      children: [
                        ValueListenableBuilder<bool>(
                            valueListenable: showSubmitButton,
                            builder: (context, value, child) {
                              return Form(
                                key: formKey,
                                child: InternationalPhoneNumberInput(
                                  onInputChanged: (PhoneNumber value) {
                                    phoneNumber.value = value.phoneNumber!;
                                  },
                                  onInputValidated: (valid) async {
                                    phoneNumberValidState.value = valid;
                                    showDisabledButton.value = true;
                                    if (phoneNumberValidState.value) {
                                      showDisabledButton.value = false;
                                    }
                                  },
                                  selectorConfig: const SelectorConfig(
                                    selectorType: PhoneInputSelectorType.DIALOG,
                                  ),
                                  spaceBetweenSelectorAndTextField: 0,
                                  autoFocus: !phoneNumberValidState.value,
                                  ignoreBlank: false,
                                  isEnabled: !value,
                                  countries: const ['GH', 'NG'],
                                  autoValidateMode: AutovalidateMode.disabled,
                                  selectorTextStyle:
                                      const TextStyle(color: Colors.black),
                                  textFieldController: controller,
                                  formatInput: true,
                                  maxLength: 11,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                          signed: true, decimal: true),
                                  cursorColor: Colors.grey.shade600,
                                  inputDecoration: InputDecoration(
                                    contentPadding: const EdgeInsets.only(
                                        bottom: 13, left: 5),
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    hintText: '24 567 8901',
                                    hintStyle: TextStyle(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                ),
                              );
                            }),
                        Positioned(
                          left: 90,
                          top: 8,
                          bottom: 8,
                          child: Container(
                            height: 20,
                            width: 1,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              FadeInRightBig(
                from: 50,
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 25),
                  child: Text(
                    localization.weWillTextOrCallYou.capitalize(),
                    textAlign: TextAlign.start,
                    style: textTheme.labelLarge!
                        .apply(color: Colors.black, fontSizeDelta: -1),
                  ),
                ),
              ),
              const Spacer(),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    localization.confirmYourNumber.capitalize(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ).withLoadingState(
                  loading: showSubmitButton,
                  disabled: showDisabledButton,
                  onPressed: () async {
                    if (!formKey.currentState!.validate()) return;
                    if (phoneNumberValidState.value) {
                      showDisabledButton.value = true;
                      showSubmitButton.value = phoneNumberValidState.value;
                      await verifyPhoneNumber(
                        phoneNumber: phoneNumber.value,
                        context: context,
                        submitButtonState: showSubmitButton,
                        disabledButtonState: showDisabledButton,
                      );
                    }
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
