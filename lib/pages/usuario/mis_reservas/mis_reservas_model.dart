import '/backend/schema/enums/enums.dart';
import '/components/nav_bar_usuario/nav_bar_usuario_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'mis_reservas_widget.dart' show MisReservasWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MisReservasModel extends FlutterFlowModel<MisReservasWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NavBarUsuario component.
  late NavBarUsuarioModel navBarUsuarioModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarUsuarioModel = createModel(context, () => NavBarUsuarioModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navBarUsuarioModel.dispose();
  }
}
