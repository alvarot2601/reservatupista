import '/backend/schema/enums/enums.dart';
import '/components/app_bar_profesional/app_bar_profesional_widget.dart';
import '/components/nav_bar_profesional/nav_bar_profesional_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'mis_pistas_widget.dart' show MisPistasWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MisPistasModel extends FlutterFlowModel<MisPistasWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AppBarProfesional component.
  late AppBarProfesionalModel appBarProfesionalModel;
  // Model for NavBarProfesional component.
  late NavBarProfesionalModel navBarProfesionalModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appBarProfesionalModel =
        createModel(context, () => AppBarProfesionalModel());
    navBarProfesionalModel =
        createModel(context, () => NavBarProfesionalModel());
  }

  void dispose() {
    unfocusNode.dispose();
    appBarProfesionalModel.dispose();
    navBarProfesionalModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
