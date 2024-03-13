import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../app_state.dart';
import '../../../../backend/server_node.dart/anadir_pista_node.dart';

extension SioNo on String {
  bool get sn => this == 'Si' ? true : false;
  String get de => substring(3);
  int get dp => this == '60 Minutos' ? 60 : 90;
  String get tm => '$this:00';
  int get trOtc => int.parse(split(' ')[0]);
  double get pc => double.parse(split(' ')[0]);
}

class AnadirPistaController extends GetxController
    with SingleGetTickerProviderMixin {
  RxBool isValidBtnTarifas = false.obs;

  // State field(s) for Deporte widget.
  FocusNode? deporteFocusNode;
  TextEditingController? deporteController;
  // State field(s) for nPista widget.
  FocusNode? nPistaFocusNode;
  TextEditingController? nPistaController;
// State field(s) for techada widget.
  FocusNode? techadaFocusNode;
  TextEditingController? techadaController;
  // State field(s) for iluminacion widget.
  FocusNode? iluminacionFocusNode;
  TextEditingController? iluminacionController;
  // State field(s) for tipo widget.
  FocusNode? tipoFocusNode;
  TextEditingController? tipoController;
  // State field(s) for cesped widget.
  FocusNode? cespedFocusNode;
  TextEditingController? cespedController;
  // State field(s) for automatizada widget.
  FocusNode? automatizadaFocusNode;
  TextEditingController? automatizadaController;
  // State field(s) for duracionPartida widget.
  FocusNode? duracionPartidaFocusNode;
  TextEditingController? duracionPartidaController;
  // State field(s) for horaInicio widget.
  FocusNode? horaInicioFocusNode;
  TextEditingController? horaInicioController;
  // State field(s) for horaFin widget.
  FocusNode? horaFinFocusNode;
  TextEditingController? horaFinController;
  // State field(s) for tiempoReservaSocio widget.
  FocusNode? tiempoReservaSocioFocusNode;
  TextEditingController? tiempoReservaSocioController;
  // State field(s) for tiempoCancelacionSocio widget.
  FocusNode? tiempoCancelacionSocioFocusNode;
  TextEditingController? tiempoCancelacionSocioController;
  // State field(s) for precioConLuzSocio widget.
  FocusNode? precioConLuzSocioFocusNode;
  TextEditingController? precioConLuzSocioController;
  // State field(s) for precioSinLuzSocio widget.
  FocusNode? precioSinLuzSocioFocusNode;
  TextEditingController? precioSinLuzSocioController;
  // State field(s) for tiempoReservaNoSocio widget.
  FocusNode? tiempoReservaNoSocioFocusNode;
  TextEditingController? tiempoReservaNoSocioController;
  // State field(s) for tiempoCancelacionNoSocio widget.
  FocusNode? tiempoCancelacionNoSocioFocusNode;
  TextEditingController? tiempoCancelacionNoSocioController;
  // State field(s) for precioConLuzNoSocio widget.
  FocusNode? precioConLuzNoSocioFocusNode;
  TextEditingController? precioConLuzNoSocioController;
  // State field(s) for precioSinLuzNoSocio widget.
  FocusNode? precioSinLuzNoSocioFocusNode;
  TextEditingController? precioSinLuzNoSocioController;
  // State field(s) for descripcion widget.
  FocusNode? descripcionFocusNode;
  TextEditingController? descripcionController;
  // State field(s) for nombrePatrocinador widget.
  FocusNode? nombrePatrocinadorFocusNode;
  TextEditingController? nombrePatrocinadorController;
  // State field(s) for imagePatrocinador widget.
  FocusNode? imagePatrocinadorFocusNode;
  TextEditingController? imagePatrocinadorController;
  // State field(s) for vestuario widget.
  FocusNode? vestuarioFocusNode;
  TextEditingController? vestuarioController;
  // State field(s) for duchas widget.
  FocusNode? duchasFocusNode;
  TextEditingController? duchasController;
  RxBool checkboxTerminos = false.obs;
  @override
  void onInit() {
    super.onInit();
    ever(isValidBtnTarifas, (callback) {
      if (!callback) {
        final listValidators = [
          duracionPartidaController!.text,
          horaInicioController!.text,
          horaFinController!.text,
          precioConLuzSocioController!.text,
          precioSinLuzSocioController!.text,
          precioConLuzNoSocioController!.text,
          precioSinLuzNoSocioController!.text
        ];
        bool btnTarifas = true;
        for (String element in listValidators) {
          if (element.isEmpty) {
            btnTarifas = false;
            break;
          }
        }
        if (btnTarifas) {
          isValidBtnTarifas.value = true;
        }
      }
    });

    deporteController = TextEditingController();
    deporteFocusNode = FocusNode();
    nPistaController = TextEditingController();
    nPistaFocusNode = FocusNode();
    techadaController = TextEditingController();
    techadaFocusNode = FocusNode();
    iluminacionController = TextEditingController();
    iluminacionFocusNode = FocusNode();
    tipoController = TextEditingController();
    tipoFocusNode = FocusNode();
    cespedController = TextEditingController();
    cespedFocusNode = FocusNode();
    automatizadaController = TextEditingController();
    automatizadaFocusNode = FocusNode();
    duracionPartidaController = TextEditingController();
    duracionPartidaFocusNode = FocusNode();
    horaInicioController = TextEditingController();
    horaInicioFocusNode = FocusNode();
    horaFinController = TextEditingController();
    horaFinFocusNode = FocusNode();
    tiempoReservaSocioController = TextEditingController();
    tiempoReservaSocioFocusNode = FocusNode();
    tiempoCancelacionSocioController = TextEditingController();
    tiempoCancelacionSocioFocusNode = FocusNode();
    precioConLuzSocioController = TextEditingController();
    precioConLuzSocioFocusNode = FocusNode();
    precioSinLuzSocioController = TextEditingController();
    precioSinLuzSocioFocusNode = FocusNode();
    tiempoReservaNoSocioController = TextEditingController();
    tiempoReservaNoSocioFocusNode = FocusNode();
    tiempoCancelacionNoSocioController = TextEditingController();
    tiempoCancelacionNoSocioFocusNode = FocusNode();
    precioConLuzNoSocioController = TextEditingController();
    precioConLuzNoSocioFocusNode = FocusNode();
    precioSinLuzNoSocioController = TextEditingController();
    precioSinLuzNoSocioFocusNode = FocusNode();
    descripcionController = TextEditingController();
    descripcionFocusNode = FocusNode();
    nombrePatrocinadorController = TextEditingController();
    nombrePatrocinadorFocusNode = FocusNode();
    imagePatrocinadorController = TextEditingController();
    imagePatrocinadorFocusNode = FocusNode();
    vestuarioController = TextEditingController();
    vestuarioFocusNode = FocusNode();
    duchasController = TextEditingController();
    duchasFocusNode = FocusNode();
  }

  guardarDatos() {
    final datosPista = [
      deporteController!.text.de,
      1,
      techadaController!.text.sn,
      iluminacionController!.text,
      tipoController!.text,
      cespedController!.text,
      automatizadaController!.text.sn,
      duracionPartidaController!.text.dp,
      horaInicioController!.text.tm,
      horaFinController!.text.tm,
      tiempoReservaSocioController!.text.trOtc,
      tiempoCancelacionSocioController!.text.trOtc,
      precioConLuzSocioController!.text.pc,
      precioSinLuzSocioController!.text.pc,
      tiempoReservaNoSocioController!.text.trOtc,
      tiempoCancelacionNoSocioController!.text.trOtc,
      precioConLuzNoSocioController!.text.pc,
      precioSinLuzNoSocioController!.text.pc,
      descripcionController!.text,
      nombrePatrocinadorController!.text,
      'patrocinador1.jpg',
      vestuarioController!.text.sn,
      duchasController!.text.sn,
      'imagen1.jpg,imagen2.jpg,imagen3.jpg'
    ];
    // Obtén la fecha actual
    DateTime now = DateTime.now();
    // Obtén el número del día de la semana (1-7)
    int dayOfWeek = now.weekday;
    now = now.subtract(Duration(days: dayOfWeek - 1));
    final datosTarifas = generateTarifasSemana(now, dayOfWeek);
    anadirPistaNode(datosPista, datosTarifas);
  }

  List generateTarifasSemana(DateTime lunesInicio, int dayOfWeek) {
    DateTime fechaWeek = lunesInicio;
    final trns = tiempoReservaNoSocioController!.text.trOtc;
    final trs = tiempoReservaSocioController!.text.trOtc;
    int maxTr = trs + dayOfWeek;
    maxTr = maxTr <= 6 ? 6 : maxTr;
    if (trns >= trs) {
      maxTr = trns;
    }

    int contDias = 0;
    List tarifasDate = [];
    for (var i = 0; i < maxTr; i++) {
      // Utiliza el formato deseado
      final formatoFecha = DateFormat('yyyy-MM-dd');
      // Formatea la fecha
      final fecha = formatoFecha.format(fechaWeek);
      tarifasDate.add(FFAppState()
          .listaTarifas[contDias]
          .map((e) => [
                e.disponible,
                e.clases,
                e.luz,
                e.horaInicio,
                e.fecha = fecha,
                e.precioConLuzSocio,
                e.precioSinLuzSocio,
                e.precioConLuzNoSocio,
                e.precioSinLuzNoSocio
              ])
          .toList());
      if (contDias == 6) {
        contDias = 0;
      } else {
        contDias++;
      }
      fechaWeek = fechaWeek.add(const Duration(days: 1));
    }
    return tarifasDate;
  }

  @override
  void dispose() {
    super.dispose();
    deporteController!.dispose();
    deporteFocusNode!.dispose();
    nPistaController!.dispose();
    nPistaFocusNode!.dispose();
    techadaController!.dispose();
    techadaFocusNode!.dispose();
    iluminacionController!.dispose();
    iluminacionFocusNode!.dispose();
    tipoController!.dispose();
    tipoFocusNode!.dispose();
    cespedController!.dispose();
    cespedFocusNode!.dispose();
    automatizadaController!.dispose();
    automatizadaFocusNode!.dispose();
    duracionPartidaController!.dispose();
    duracionPartidaFocusNode!.dispose();
    horaInicioController!.dispose();
    horaInicioFocusNode!.dispose();
    horaFinController!.dispose();
    horaFinFocusNode!.dispose();
    tiempoReservaSocioController!.dispose();
    tiempoReservaSocioFocusNode!.dispose();
    tiempoCancelacionSocioController!.dispose();
    tiempoCancelacionSocioFocusNode!.dispose();
    precioConLuzSocioController!.dispose();
    precioConLuzSocioFocusNode!.dispose();
    precioSinLuzSocioController!.dispose();
    precioSinLuzSocioFocusNode!.dispose();
    tiempoReservaNoSocioController!.dispose();
    tiempoReservaNoSocioFocusNode!.dispose();
    tiempoCancelacionNoSocioController!.dispose();
    tiempoCancelacionNoSocioFocusNode!.dispose();
    precioConLuzNoSocioController!.dispose();
    precioConLuzNoSocioFocusNode!.dispose();
    precioSinLuzNoSocioController!.dispose();
    precioSinLuzNoSocioFocusNode!.dispose();
    descripcionController!.dispose();
    descripcionFocusNode!.dispose();
    nombrePatrocinadorController!.dispose();
    nombrePatrocinadorFocusNode!.dispose();
    imagePatrocinadorController!.dispose();
    imagePatrocinadorFocusNode!.dispose();
    vestuarioController!.dispose();
    vestuarioFocusNode!.dispose();
    duchasController!.dispose();
    duchasFocusNode!.dispose();
  }
}
