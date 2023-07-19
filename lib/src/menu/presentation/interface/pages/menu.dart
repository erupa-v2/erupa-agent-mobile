import 'package:erupa_agent_v2/shared/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/user/domain/entities/user.dart';
import '../../../../../shared/presentation/divider.dart';
import '../../../../../shared/presentation/i18n/localization.dart';
import '../../logic/menu_logic.dart';
import '../widgets/legal.dart';
import '../widgets/settings.dart';
import '../widgets/support.dart';

class MenuPage extends StatelessWidget with MenuLogic {
  MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Locale strings
    final localization = AppLocalizations.of(context)!;

    // Handles app theme
    final theme = Theme.of(context);

    // Main ui
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: false,
        title: Text(localization.menu.capitalize()),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              IconlyLight.info_circle,
              size: 24,
            ),
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
        minimum: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListTile(
                  onTap: () async {
                    await showUserDetailsSheet(context: context);
                  },
                  leading: const Icon(
                    IconlyBold.profile,
                    size: 30,
                  ),
                  title: FutureBuilder<User>(
                      future: retrieveUserDetails(context: context),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData && snapshot.hasError) {
                          return const CircularProgressIndicator.adaptive();
                        }
                        if (snapshot.hasData) {
                          return Text(
                            snapshot.requireData.username.capitalize(),
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          );
                        }
                        return const CircularProgressIndicator.adaptive();
                      }),
                  subtitle: Text(
                    localization.showProfile,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w300,
                      fontSize: 11,
                    ),
                  ),
                  trailing: const Icon(IconlyLight.arrow_right_2),
                ),
              ),
              const CustomDivider(),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(
                  top: 20,
                  bottom: 20,
                  left: 5,
                  right: 5,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(3, 1),
                        spreadRadius: -3,
                        blurRadius: 15,
                        color: Color.fromRGBO(217, 217, 217, 1),
                      )
                    ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          localization.becomeAnAgent,
                          style: theme.textTheme.bodyMedium!.apply(
                            fontWeightDelta: 3,
                            fontSizeDelta: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            localization.becomeAnAgentDescription,
                            maxLines: 2,
                            softWrap: true,
                            style: theme.textTheme.labelSmall,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      IconlyBold.work,
                      size: 40,
                      color: Colors.green,
                    )
                  ],
                ),
              ),
              const CustomDivider(),
              SettingsPanel(),
              const SupportPanel(),
              const LegalPanel(),
              const ListTile(
                title: Text(
                  'Logout',
                ),
              ),
              const CustomDivider(),
            ],
          ),
        ),
      ),
    );
  }
}
