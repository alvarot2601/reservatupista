import 'package:flutter/widgets.dart';

class SizerUtil {
  /// Device's BoxConstraints
  static late BoxConstraints boxConstraints;

  /// Device's Orientation
  static late Orientation orientation;

  /// Device's Height
  static late double height;

  /// Device's Width
  static late double width;

  /// Device's safeAreaTop
  static late double safeAreaTop;

  /// Device's SafeArea
  static late double safeAreaBottom;

  /// Sets the Screen's size and Device's Orientation,
  /// BoxConstraints, Height, and Width
  static void setScreenSize(
      BoxConstraints constraints,
      Orientation currentOrientation,
      double _safeAreaTop,
      double _safeAreaBottom) {
    // Sets boxconstraints and orientation
    boxConstraints = constraints;
    orientation = currentOrientation;
    safeAreaTop = _safeAreaTop;
    safeAreaBottom = _safeAreaBottom;

    // Sets screen width and height
    if (orientation == Orientation.portrait) {
      width = boxConstraints.maxWidth;
      height = boxConstraints.maxHeight;
    } else {
      width = boxConstraints.maxHeight;
      height = boxConstraints.maxWidth;
    }
  }

  //for responsive web
  static getWebResponsiveSize({smallSize, mediumSize, largeSize}) {
    return width < 600
        ? smallSize //'phone'
        : width >= 600 && width <= 1024
            ? mediumSize //'tablet'
            : largeSize; //'desktop';
  }
}

extension SizerExt on num {
  /// Calculates the height depending on the device's screen size
  ///
  /// Eg: 20.h -> will take 20% of the screen's height
  double get h => this * (SizerUtil.height - SizerUtil.safeAreaTop) / 100;

  /// Calculates the width depending on the device's screen size
  ///
  /// Eg: 20.w -> will take 20% of the screen's width
  double get w => this * SizerUtil.width / 100;

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  double get sp => this * (SizerUtil.width / 3) / 100;
}

extension SizedBoxExt on double {
  SizedBox get sh => SizedBox(height: this);
  SizedBox get sw => SizedBox(width: this);
  SizedBox get empty => SizedBox.shrink();
}

/// Provides `Context`, `Orientation`, and `DeviceType` parameters to the builder function
typedef ResponsiveBuild = Widget Function(
  BuildContext context,
  Orientation orientation,
);

/// A widget that gets the device's details like orientation and constraints
///
/// Usage: Wrap MaterialApp with this widget
class Sizer extends StatelessWidget {
  const Sizer({Key? key, required this.builder}) : super(key: key);

  /// Builds the widget whenever the orientation changes
  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizerUtil.setScreenSize(
            constraints,
            orientation,
            MediaQuery.of(context).padding.top,
            MediaQuery.of(context).padding.bottom);
        return builder(context, orientation);
      });
    });
  }
}
