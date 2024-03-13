import '/backend/schema/enums/enums.dart';
import '/components/nav_bar_usuario/nav_bar_usuario_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'reservar_pista_widget.dart' show ReservarPistaWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ReservarPistaModel extends FlutterFlowModel<ReservarPistaWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // State field(s) for Deporte widget.
  FocusNode? deporteFocusNode;
  TextEditingController? deporteController;
  // State field(s) for nPista widget.
  FocusNode? nPistaFocusNode;
  TextEditingController? nPistaController;
// State field(s) for localidad widget.
  FocusNode? localidadFocusNode;
  TextEditingController? localidadController;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay1;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay2;
  // Model for NavBarUsuario component.
  late NavBarUsuarioModel navBarUsuarioModel;

  /// Initialization and disposal methods.
  void initState(BuildContext context) {
    calendarSelectedDay1 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    calendarSelectedDay2 = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
    navBarUsuarioModel = createModel(context, () => NavBarUsuarioModel());
  }

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    navBarUsuarioModel.dispose();
    localidadFocusNode?.dispose();
    localidadController?.dispose();
    deporteFocusNode?.dispose();
    deporteController?.dispose();
    nPistaFocusNode?.dispose();
    nPistaController?.dispose();
  }

  /// Action blocks are added here.
  /// GetX
  ///
  DateTime fechaAnterior() {
    // Obtén la fecha y hora actual
    DateTime fechaActual = DateTime.now();
    return fechaActual;
  }

  /// Additional helper methods are added here.
}
