import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class DraggableIndicator extends StatelessWidget {
  const DraggableIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Ionicons.chevron_up,
          color: Colors.grey.shade500,
          size: 35,
        ),
      ],
    );
  }
}
