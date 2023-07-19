import 'package:flutter/material.dart';

import '../../src/authentication/presentation/interface/pages/authentication.dart';
import '../../src/home/presentation/interface/pages/home.dart';


class Routes {
  /// Open [AuthenticationPage]
  static const String phoneSignUp = '/phoneSignUp';

  /// Open [PhoneVerificationPage]
  static const String phoneVerification = '/phoneVerification';

  /// Open [HomePage]
  static const String home = '/home';

  /// ++++++++++++++++++++++++++++
  /// All routes for main.dart
  /// ++++++++++++++++++++++++++++
  static final Map<String, WidgetBuilder> routes = {
    Routes.phoneSignUp: (BuildContext context) => AuthenticationPage(),
    Routes.home: (BuildContext context) => const HomePage(),
  };
}
