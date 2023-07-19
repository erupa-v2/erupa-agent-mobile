import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Value listenable for two values
class DualValueListenableBuilder<A, B> extends StatelessWidget {
  /// Constructor
  const DualValueListenableBuilder(
      {super.key,
        required this.initialValueListenable,
        required this.lastValueListenable,
        required this.builder,
        this.child});

  /// First value provided
  final ValueListenable<A> initialValueListenable;

  /// Second value provided
  final ValueListenable<B> lastValueListenable;

  /// Widget or null child instance
  final Widget? child;

  /// Builder function
  final Widget Function(BuildContext context, A a, B b, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<A>(
        valueListenable: initialValueListenable,
        builder: (_, a, __) {
          return ValueListenableBuilder<B>(
              valueListenable: lastValueListenable,
              builder: (context, b, __) {
                return builder(context, a, b, child);
              });
        });
  }
}
