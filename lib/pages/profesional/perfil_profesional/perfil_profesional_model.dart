import '../../../app/routes/app_pages.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'perfil_profesional_widget.dart' show PerfilProfesionalWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PerfilProfesionalModel extends FlutterFlowModel<PerfilProfesionalWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.
  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  Color hoverColor = const Color.fromARGB(69, 43, 120, 220);

  String fotoName = 'assets/images/logo_reservatupista.png';
  String subtitle = 'Club Padel';
  String btn1Name = 'Banco Virtual';
  String btn1PushNamed = Routes.BANCOVIRTUAL;
  String btn2Name = 'Datos';
  String btn2PushNamed = Routes.DATOS_PROVEEDOR;
  String btn3Name = 'Notificaciones';
  String btn3PushNamed = Routes.NOTIFICACIONESPROFESIONAL;
  String socio = Routes.MIS_SOCIOS;
  String btn4Name = 'Términos de servicio';
  String btnCerrar = Routes.LOGIN_USUARIO;
}
