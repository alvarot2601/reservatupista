import 'package:flutter/material.dart';
import 'dart:math';

import './dot_type.dart';

// ignore: public_member_api_docs
class ColorLoader extends StatefulWidget {
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

  // Padding entre las pelotas
  final EdgeInsets? padding;
  // El radio de las pelotas
  final double? radius;

  // ignore: public_member_api_docs
  ColorLoader(
      {this.dotOneColor = Colors.redAccent,
      this.dotTwoColor = Colors.green,
      this.dotThreeColor = Colors.blueAccent,
      this.duration = const Duration(milliseconds: 1000),
      this.dotType = DotType.circle,
      this.dotIcon = const Icon(Icons.blur_on),
      this.padding,
      this.radius});

  @override
  _ColorLoaderState createState() => _ColorLoaderState();
}

class _ColorLoaderState extends State<ColorLoader>
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
        curve: const Interval(0.0, 0.80, curve: Curves.ease),
      ),
    );

    animation_2 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.1, 0.9, curve: Curves.ease),
      ),
    );

    animation_3 = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.2, 1.0, curve: Curves.ease),
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
        Transform.translate(
          offset: Offset(
            0.0,
            -30 *
                (animation_1.value <= 0.50
                    ? animation_1.value
                    : 1.0 - animation_1.value),
          ),
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
        Transform.translate(
          offset: Offset(
            0.0,
            -30 *
                (animation_2.value <= 0.50
                    ? animation_2.value
                    : 1.0 - animation_2.value),
          ),
          child: Padding(
            padding: widget.padding ?? const EdgeInsets.only(right: 8.0),
            child: Dot(
              radius: widget.radius ?? 15.0,
              color: Color.fromARGB(255, 147, 147, 147),
              type: widget.dotType,
              icon: widget.dotIcon,
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(
            0.0,
            -30 *
                (animation_3.value <= 0.50
                    ? animation_3.value
                    : 1.0 - animation_3.value),
          ),
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
    return Center(
      child: type == DotType.icon
          ? Icon(
              icon.icon,
              color: color,
              size: 1.3 * radius,
            )
          : Transform.rotate(
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
