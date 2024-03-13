import 'package:flutter/material.dart';

AnimationController animVibrate(
    {Duration? duration, required TickerProvider vsync}) {
  return AnimationController(
    vsync: vsync,
    duration: duration ?? const Duration(milliseconds: 200),
  );
}
