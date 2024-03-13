import '/backend/schema/enums/enums.dart';
import '/components/nav_bar_usuario/nav_bar_usuario_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'monedero_virtual_widget.dart' show MonederoVirtualWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

enum TypeHistorial { reserva, tranferencia, all }

class MonederoVirtualModel extends FlutterFlowModel<MonederoVirtualWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NavBarUsuario component.
  late NavBarUsuarioModel navBarUsuarioModel;
  bool isFiltrar = false;
  late TypeHistorial type;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    type = TypeHistorial.all;
    navBarUsuarioModel = createModel(context, () => NavBarUsuarioModel());
  }

  void dispose() {
    unfocusNode.dispose();
    navBarUsuarioModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
