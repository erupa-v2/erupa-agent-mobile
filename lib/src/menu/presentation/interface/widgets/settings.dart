import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import '../../../../../shared/presentation/divider.dart';
import '../../../../../shared/presentation/i18n/localization.dart';
import '../../logic/menu_logic.dart';

class SettingsPanel extends StatelessWidget with MenuLogic {
  SettingsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text(
            localization.settings,
            style: theme.textTheme.bodyLarge!.apply(
              fontWeightDelta: 3,
              fontSizeDelta: 2,
            ),
          ),
        ),
        ListTile(
          title: Text(
            localization.personalInfo,
          ),
          trailing: const Icon(IconlyBold.profile),
          onTap: () async {
            await showUserDetailsSheet(context: context);
          },
        ),
        const CustomDivider(),
        ListTile(
          title: Text(localization.loginAndSecurity),
          trailing: const Icon(IconlyBold.lock),
          subtitle: Text(
            localization.comingSoon,
            style: theme.textTheme.labelSmall!.apply(
                color: Colors.black.withOpacity(0.3), fontWeightDelta: 3),
          ),
        ),
        const CustomDivider(),
        ListTile(
          title: Text(
            localization.priacyAndSharing,
          ),
          trailing: const Icon(IconlyBold.password),
        ),
        const CustomDivider(),
      ],
    );
  }
}
