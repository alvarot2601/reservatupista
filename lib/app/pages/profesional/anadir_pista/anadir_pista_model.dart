import '../../../../backend/server_node.dart/anadir_pista_node.dart';
import '/components/app_bar_profesional/app_bar_profesional_widget.dart';
import '/components/nav_bar_profesional/nav_bar_profesional_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'anadir_pista_widget.dart' show AnadirPistaWidget;
import 'package:flutter/material.dart';

class AnadirPistaModel extends FlutterFlowModel<AnadirPistaWidget> {
  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  String? Function(BuildContext, String?)? duchasControllerValidator;
  // Model for NavBarProfesional component.
  late NavBarProfesionalModel navBarProfesionalModel;
  // Model for AppBarProfesional component.
  late AppBarProfesionalModel appBarProfesionalModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    navBarProfesionalModel =
        createModel(context, () => NavBarProfesionalModel());
    appBarProfesionalModel =
        createModel(context, () => AppBarProfesionalModel());
  }

  void dispose() {
    unfocusNode.dispose();

    navBarProfesionalModel.dispose();
    appBarProfesionalModel.dispose();
  }

  List<String> deporte = [
    '🎾 Padel',
    '🎾 Tenis',
    '🏸 Badminton',
    '🏊‍♀️ P. climatizada',
    '🏊‍♀️ Piscina',
    '🏀 Baloncesto',
    '⚽ Futbol sala',
    '⚽ Futbol 7',
    '⚽ Futbol 11',
    '🥍 Pickleball',
    '🏸 Squash',
    '🏓 Tenis de mesa',
    '🏓 Fronton',
    '⚽ Balomano',
    '🏉 Rugby',
    '🥅 Multideporte',
  ];

  List<String> siONo = ['Si', 'No'];
}

class AnimationControllerInputs {
  AnimationController precioConLuzSocio;
  AnimationController precioSinLuzSocio;
  AnimationController precioConLuzNoSocio;
  AnimationController precioSinLuzNoSocio;
  AnimationController duracionPartida;
  AnimationController horaInicio;
  AnimationController horaFin;
  AnimationControllerInputs(
      {required this.precioConLuzSocio,
      required this.precioSinLuzSocio,
      required this.precioConLuzNoSocio,
      required this.precioSinLuzNoSocio,
      required this.duracionPartida,
      required this.horaInicio,
      required this.horaFin});
}
