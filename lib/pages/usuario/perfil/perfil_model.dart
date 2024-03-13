import '../../../app/routes/app_pages.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'perfil_widget.dart' show PerfilWidget;
import 'package:flutter/material.dart';

class PerfilModel extends FlutterFlowModel<PerfilWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  Color hoverColor = Color.fromARGB(69, 43, 120, 220);

  String fotoName = 'assets/images/foto_avatar.png';
  String subtitle = 'Julio Fresno Torrado';
  String btn1Name = 'Monedero Virtual';
  String btn1PushNamed = Routes.MONEDEROVIRTUAL;
  String btn2Name = 'Datos';
  String btn2PushNamed = Routes.DATOS_USUARIO;
  String btn3Name = 'Notificaciones';
  String btn3PushNamed = Routes.NOTIFICACIONES;
  String resultados = Routes.RESULTADOS_ESTADISTICAS;
  String btn4Name = 'Términos de servicio';
  // String btn4PushNamed = 'Notificaciones';
  String btnCerrar = Routes.LOGIN_USUARIO;

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
