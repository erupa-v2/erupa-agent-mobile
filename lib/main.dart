import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'core/user/data/database/user_local_database.dart';
import 'firebase_options.dart';
import 'injection_container.dart' as di;
import 'shared/data/hive_adapters.dart';
import 'shared/presentation/i18n/localization.dart';
import 'shared/presentation/route.dart';
import 'shared/presentation/theme.dart';
import 'src/home/presentation/interface/pages/home.dart';
import 'src/onboard/presentation/pages/onboard.dart';

Future<void> main() async {
  ///  keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await HiveAdapters.setUp();
  di.init();
  final authState = await di.sl<UserLocalDatabase>().authenticationStatus();
  await FirebaseMessaging.instance.requestPermission();
  await runZonedGuarded<Future<void>>(() async {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routes: Routes.routes,
      home: authState ? const HomePage() : const OnboardPage(),
      title: 'erupā',
      theme: lightTheme,
      darkTheme: lightTheme,
    ));
  }, (error, stack) {}
      // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true),
      );
}
