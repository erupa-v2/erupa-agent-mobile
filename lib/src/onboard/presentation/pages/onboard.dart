import 'package:animate_do/animate_do.dart';
import 'package:erupa_agent_v2/shared/util/extension.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/data/gif_assets.dart';
import '../../../../shared/presentation/i18n/localization.dart';
import '../../../../shared/presentation/route.dart';
import '../../../../shared/util/navigation.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(bottom: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Spacer(),
            FadeInUpBig(
              duration: const Duration(seconds: 1),
              from: 50,
              child: SizedBox(
                width: 350,
                height: 350,
                child: Image.asset(GifAssets.hero),
              ),
            ),
            FadeInUpBig(
              duration: const Duration(seconds: 1),
              from: 45,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4, top: 40),
                child: Text(
                  localization.welcome,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w800, fontSize: 30),
                ),
              ),
            ),
            FadeInUpBig(
              duration: const Duration(seconds: 2),
              from: 40,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Text(localization.easilyFindSearchAndHire,
                    textAlign: TextAlign.center,
                    style: textTheme.labelLarge!.apply(
                      fontSizeDelta: -1,
                    )),
              ),
            ),
            const Spacer(),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  NavigationHelper.navigatePushNamed(
                      context, Routes.phoneSignUp);
                },
                child: Text(
                  localization.proceed.capitalize(),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
