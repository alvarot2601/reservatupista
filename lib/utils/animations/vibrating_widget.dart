import 'package:flutter/material.dart';

class VibratingWidget extends StatelessWidget {
  const VibratingWidget({required this.child, required this.controller});

  final Widget child;
  final AnimationController controller;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, widget) {
        if (controller.value == 1) {
          controller.reverse();
        }
        return Transform.translate(
          offset: Offset(controller.value * 5.0, 0.0),
          child: child,
        );
      },
    );
  }
}
