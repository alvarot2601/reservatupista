import 'package:flutter/material.dart';
import 'dart:math';

import './dot_type.dart';

// ignore: public_member_api_docs
class ColorLoader2 extends StatefulWidget {
  // ignore: public_member_api_docs
  final Color dotOneColor;
  // ignore: public_member_api_docs
  final Color dotTwoColor;
  // ignore: public_member_api_docs
  final Color dotThreeColor;
  // ignore: public_member_api_docs
  final Duration duration;
  // ignore: public_member_api_docs
  final DotType dotType;
  // ignore: public_member_api_docs
  final Icon dotIcon;
  // ignore: public_member_api_docs
  static const Color rojoCaja = Color(0xffc22821);
  // ignore: public_member_api_docs
  static const Color azulCaja = Color(0xff043a63);
  // ignore: public_member_api_docs
  // Padding entre las pelotas
  final EdgeInsets? padding;
  // El radio de las pelotas
  final double? radius;

  // ignore: public_member_api_docs
  const ColorLoader2(
      {this.dotOneColor = Colors.red,
      this.dotTwoColor = Colors.green,
      this.dotThreeColor = Colors.blueAccent,
      this.duration = const Duration(milliseconds: 1000),
      this.dotType = DotType.circle,
      this.dotIcon = const Icon(Icons.blur_on),
      this.padding,
      this.radius});

  @override
  _ColorLoader5State createState() => _ColorLoader5State();
}

class _ColorLoader5State extends State<ColorLoader2>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation_1;
  late Animation<double> animation_2;
  late Animation<double> animation_3;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(duration: widget.duration, vsync: this);

    animation_1 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.70, curve: Curves.linear),
      ),
    );

    animation_2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.1, 0.80, curve: Curves.linear),
      ),
    );

    animation_3 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.2, 0.90, curve: Curves.linear),
      ),
    );

    controller.addListener(() {
      setState(() {
        //print(animation_1.value);
      });
    });
    // ignore: cascade_invocations
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Opacity(
          opacity: (animation_1.value <= 0.4
              ? 2.5 * animation_1.value
              : (animation_1.value > 0.40 && animation_1.value <= 0.60)
                  ? 1.0
                  : 2.5 - (2.5 * animation_1.value)),
          child: Padding(
            padding: widget.padding ?? const EdgeInsets.only(right: 8.0),
            child: Dot(
              radius: widget.radius ?? 15.0,
              color: const Color(0xffc22821),
              type: widget.dotType,
              icon: widget.dotIcon,
            ),
          ),
        ),
        Opacity(
          opacity: (animation_2.value <= 0.4
              ? 2.5 * animation_2.value
              : (animation_2.value > 0.40 && animation_2.value <= 0.60)
                  ? 1.0
                  : 2.5 - (2.5 * animation_2.value)),
          child: Padding(
            padding: widget.padding ?? const EdgeInsets.only(right: 8.0),
            child: Dot(
              radius: widget.radius ?? 15.0,
              color: Colors.white,
              type: widget.dotType,
              icon: widget.dotIcon,
            ),
          ),
        ),
        Opacity(
          opacity: (animation_3.value <= 0.4
              ? 2.5 * animation_3.value
              : (animation_3.value > 0.40 && animation_3.value <= 0.60)
                  ? 1.0
                  : 2.5 - (2.5 * animation_3.value)),
          child: Padding(
            padding: widget.padding ?? const EdgeInsets.only(right: 8.0),
            child: Dot(
              radius: widget.radius ?? 15.0,
              color: const Color(0xff043a63),
              type: widget.dotType,
              icon: widget.dotIcon,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

// ignore: public_member_api_docs
class Dot extends StatelessWidget {
  // ignore: public_member_api_docs
  final double radius;
  // ignore: public_member_api_docs
  final Color? color;
  // ignore: public_member_api_docs
  final DotType? type;
  // ignore: public_member_api_docs
  final Icon icon;

// ignore: public_member_api_docs
  Dot({required this.radius, this.color, this.type, required this.icon});

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: type == DotType.icon
          ? Icon(
              icon.icon,
              color: color,
              size: 1.3 * radius,
            )
          : new Transform.rotate(
              angle: type == DotType.diamond ? pi / 4 : 0.0,
              child: Container(
                width: radius,
                height: radius,
                decoration: BoxDecoration(
                    color: color,
                    shape: type == DotType.circle
                        ? BoxShape.circle
                        : BoxShape.rectangle),
              ),
            ),
    );
  }
}
