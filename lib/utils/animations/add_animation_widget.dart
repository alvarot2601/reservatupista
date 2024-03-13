import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../flutter_flow/flutter_flow_animations.dart';
import '../sizer.dart';

class AddAnimationWidget extends StatefulWidget {
  const AddAnimationWidget(
      {super.key, required this.child, required this.height});
  final Widget child;

  final double height;
  @override
  State<AddAnimationWidget> createState() => _AddAnimationWidgetState();
}

class _AddAnimationWidgetState extends State<AddAnimationWidget>
    with TickerProviderStateMixin {
late Map<String, AnimationInfo> animationsMap;
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();
     animationsMap = {
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.ms,
            duration: 600.ms,
            begin: Offset(0, widget.height),
            end: Offset(0, 0),
          ),
        ],
      ),
    };
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child
        .animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!);
  }
}
