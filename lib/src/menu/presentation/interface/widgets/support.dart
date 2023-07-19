import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../../shared/presentation/divider.dart';
import '../../../../../shared/presentation/i18n/localization.dart';

class SupportPanel extends StatelessWidget {
  const SupportPanel({super.key});

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
            localization.support,
            style: theme.textTheme.bodyLarge!.apply(
              fontWeightDelta: 3,
              fontSizeDelta: 2,
            ),
          ),
        ),
        ListTile(
          title: Text(
            localization.visitOurWebsite,
          ),
          trailing: const Icon(IconlyBold.info_circle),
        ),
        const CustomDivider(),
        ListTile(
          title: Text(
            localization.giveUsFeedback,
          ),
          trailing: const Icon(IconlyBold.edit),
        ),
        const CustomDivider(),
        ListTile(
          title: Text(
            localization.howToUse,
          ),
          trailing: const Icon(IconlyBold.discovery),
        ),
        const CustomDivider(),
      ],
    );
  }
}
