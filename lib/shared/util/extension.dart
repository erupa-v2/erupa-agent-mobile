import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'listenable.dart';

/// Extension for [ElevatedButton] to add loading state
extension ElevatedButtonLoadingExtension on ElevatedButton {
  Widget withLoadingState({
    ValueNotifier<bool>? loading,
    ValueNotifier<bool>? disabled,
    VoidCallback? onPressed,
  }) {
    final initialListener = loading ?? ValueNotifier<bool>(false);
    final lastListener = disabled ?? ValueNotifier<bool>(false);
    return DualValueListenableBuilder<bool, bool>(
        initialValueListenable: initialListener,
        lastValueListenable: lastListener,
        builder: (context, loadingValue, disabledValue, _) {
          return SlideInUp(
            from: 10,
            child: ElevatedButton(
              onPressed: (loadingValue && disabledValue) ||
                      (disabledValue && !loadingValue) ||
                      (!disabledValue && loadingValue)
                  ? null
                  : onPressed,
              child: (loadingValue && (disabledValue || !disabledValue))
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: FadeInUp(
                        from: 5,
                        delay: const Duration(microseconds: 500),
                        child: const CircularProgressIndicator(
                          strokeWidth: 1.5,
                          color: Colors.black,
                        ),
                      ),
                    )
                  : AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: child!,
                    ),
            ),
          );
        });
  }
}

/// Extension for [Text] to capitalize the first letter
extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}

/// Method to compare two maps
bool compareMaps(Map<dynamic, dynamic> map1, Map<dynamic, dynamic> map2) {
  if (map1.length != map2.length) {
    return false;
  }

  for (final key in map1.keys) {
    if (!map2.containsKey(key) || map1[key] != map2[key]) {
      return false;
    }
  }

  return true;
}
