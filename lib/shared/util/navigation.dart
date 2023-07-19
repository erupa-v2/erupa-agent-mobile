import 'package:flutter/material.dart';

class NavigationHelper {
  static void navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static void navigateToReplacement(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static void navigateToAndRemoveUntil(BuildContext context, Widget page) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );
  }

  static void navigatePushReplacementNamed(BuildContext context, String page) {
    Navigator.pushReplacementNamed(context, page);
  }

  static void navigatePushNamed(BuildContext context, String page) {
    Navigator.pushNamed(context, page);
  }

  static void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }
}
