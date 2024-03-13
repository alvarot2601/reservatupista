import "package:flutter/material.dart";
import 'dart:math';

// ignore: public_member_api_docs
class ColorLoader3 extends StatefulWidget {
  // ignore: public_member_api_docs
  final double radius;
  // ignore: public_member_api_docs
  final double dotRadius;
  // Color del centro
  final Color? circuloCentro;

// ignore: public_member_api_docs
  ColorLoader3({this.radius = 30.0, this.dotRadius = 5.0, this.circuloCentro});

  @override
  _ColorLoader3State createState() => _ColorLoader3State();
}

class _ColorLoader3State extends State<ColorLoader3> with SingleTickerProviderStateMixin {
  late Animation<double> animationRotation;
  late Animation<double> animationRadiusIn;
  late Animation<double> animationRadiusOut;
  late AnimationController controller;
  Color rojoCaja = const Color(0xffc22821);
  Color azulCaja = const Color(0xff3a65a5);
  Color? circuloCentro;

  late double radius;
  late double dotRadius;

  @override
  void initState() {
    super.initState();

    radius = widget.radius;
    dotRadius = widget.dotRadius;
    circuloCentro = widget.circuloCentro;
    controller = AnimationController(
        lowerBound: 0.0, upperBound: 1.0, duration: const Duration(milliseconds: 2500), vsync: this);

    animationRotation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    animationRadiusIn = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75, 1.0, curve: Curves.elasticIn),
      ),
    );

    animationRadiusOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.25, curve: Curves.elasticOut),
      ),
    );

    controller.addListener(() {
      setState(() {
        if (controller.value >= 0.75 && controller.value <= 1.0)
          radius = widget.radius * animationRadiusIn.value;
        else if (controller.value >= 0.0 && controller.value <= 0.25) radius = widget.radius * animationRadiusOut.value;
      });
    });

    // ignore: cascade_invocations
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {}
    });

    // ignore: cascade_invocations
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      // color: Colors.white,
      child: new Center(
        child: new RotationTransition(
          turns: animationRotation,
          child: new Container(
            //color: Colors.limeAccent,
            child: new Center(
              child: Stack(
                children: <Widget>[
                  new Transform.translate(
                    offset: const Offset(0.0, 0.0),
                    child: Dot(
                      radius: radius,
                      color: circuloCentro ?? Colors.white54,
                    ),
                  ),
                  new Transform.translate(
                    child: Dot(
                      radius: dotRadius,
                      color: rojoCaja,
                    ),
                    offset: Offset(
                      radius * cos(0.0),
                      radius * sin(0.0),
                    ),
                  ),
                  new Transform.translate(
                    child: Dot(
                      radius: dotRadius,
                      color: Colors.white,
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 1 * pi / 4),
                      radius * sin(0.0 + 1 * pi / 4),
                    ),
                  ),
                  new Transform.translate(
                    child: Dot(
                      radius: dotRadius,
                      color: azulCaja,
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 2 * pi / 4),
                      radius * sin(0.0 + 2 * pi / 4),
                    ),
                  ),
                  new Transform.translate(
                    child: Dot(
                      radius: dotRadius,
                      color: Colors.white,
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 3 * pi / 4),
                      radius * sin(0.0 + 3 * pi / 4),
                    ),
                  ),
                  new Transform.translate(
                    child: Dot(
                      radius: dotRadius,
                      color: rojoCaja,
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 4 * pi / 4),
                      radius * sin(0.0 + 4 * pi / 4),
                    ),
                  ),
                  new Transform.translate(
                    child: Dot(
                      radius: dotRadius,
                      color: Colors.white,
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 5 * pi / 4),
                      radius * sin(0.0 + 5 * pi / 4),
                    ),
                  ),
                  new Transform.translate(
                    child: Dot(
                      radius: dotRadius,
                      color: azulCaja,
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 6 * pi / 4),
                      radius * sin(0.0 + 6 * pi / 4),
                    ),
                  ),
                  new Transform.translate(
                    child: Dot(
                      radius: dotRadius,
                      color: Colors.white,
                    ),
                    offset: Offset(
                      radius * cos(0.0 + 7 * pi / 4),
                      radius * sin(0.0 + 7 * pi / 4),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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
  Dot({required this.radius, this.color});

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: Container(
        width: radius,
        height: radius,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
