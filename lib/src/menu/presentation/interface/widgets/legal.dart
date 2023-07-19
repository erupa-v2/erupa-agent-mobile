import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../../../../shared/presentation/divider.dart';
import '../../../../../shared/presentation/i18n/localization.dart';


class LegalPanel extends StatelessWidget {
  const LegalPanel({super.key});

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
            localization.legal,
            style: theme.textTheme.bodyLarge!.apply(
              fontWeightDelta: 3,
              fontSizeDelta: 2,
            ),
          ),
        ),
        ListTile(
          title: Text(localization.privacyPolicy),
          trailing: const Icon(IconlyBold.document),
        ),
        const CustomDivider(),
        ListTile(
          title: Text(
            localization.terms,
          ),
          trailing: const Icon(IconlyBold.document),
        ),
        const CustomDivider(),
      ],
    );
  }
}
