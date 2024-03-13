import '/flutter_flow/flutter_flow_util.dart';
import 'alert_recargar_widget.dart' show AlertRecargarWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AlertRecargarModel extends FlutterFlowModel<AlertRecargarWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  AudioPlayer? soundPlayer;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  double money = 0.0;

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
