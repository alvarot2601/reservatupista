import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../../../../utils/colores.dart';
import '../../../../routes/app_pages.dart';
import '../../../../../backend/server_node.dart/subir_image_node.dart';
import '../../../../../utils/btn_icon.dart';
import '../anadir_pista_c.dart';
import '../anadir_pista_model.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'list_inputs.dart';
import 'input_pista.dart';

class ListInputs extends StatefulWidget {
  const ListInputs({super.key, required this.anims, required this.formKey});

  final AnimationControllerInputs anims;

  final GlobalKey<FormState> formKey;

  @override
  State<ListInputs> createState() => _ListInputsState();
}

class _ListInputsState extends State<ListInputs> {
  AnadirPistaController self = Get.find();
  List<String> listaHorarios = [];
  List<String> listHorariosFinal = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: InputPista(
                  controller: self.deporteController,
                  focusNode: self.deporteFocusNode,
                  context: context,
                  labelText: 'Deporte',
                  itemsDD: const [
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
                  ],
                  onChanged: (val) {
                    if (val.isNotEmpty) {
                      self.nPistaController!.text = '1';
                    }
                  },
                ),
              ),
              4.0.sw,
              Flexible(
                child: TextFormField(
                  controller: self.nPistaController,
                  focusNode: self.nPistaFocusNode,
                  enabled: false,
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: FFLocalizations.of(context).getText(
                      'y7pf20ni' /* Nº de pista */,
                    ),
                    labelStyle: GoogleFonts.getFont(
                      'Readex Pro',
                      color: const Color.fromARGB(165, 117, 117, 117),
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colores().proveedor.primary69,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    contentPadding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 12.0, 16.0, 12.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  cursorColor: FlutterFlowTheme.of(context).primary,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: InputPista(
                  controller: self.techadaController,
                  focusNode: self.techadaFocusNode,
                  context: context,
                  labelText: 'Techada',
                  itemsDD: const ['Si', 'No'],
                ),
              ),
              4.0.sw,
              Expanded(
                child: InputPista(
                  controller: self.iluminacionController,
                  focusNode: self.iluminacionFocusNode,
                  context: context,
                  labelText: 'Iluminación',
                  itemsDD: const ['Leds', 'Halogeno'],
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: InputPista(
                  controller: self.tipoController,
                  focusNode: self.tipoFocusNode,
                  context: context,
                  labelText: 'Tipo',
                  itemsDD: const ['Cristal', 'Hormigo'],
                ),
              ),
              4.0.sw,
              Expanded(
                child: InputPista(
                  controller: self.cespedController,
                  focusNode: self.cespedFocusNode,
                  context: context,
                  labelText: 'Cesped',
                  itemsDD: const ['Verde', 'Azul'],
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: InputPista(
                  controller: self.automatizadaController,
                  focusNode: self.automatizadaFocusNode,
                  context: context,
                  labelText: 'Automatizada',
                  itemsDD: const ['Si', 'No'],
                ),
              ),
              Container(
                width: 4.0,
                decoration: const BoxDecoration(),
              ),
              Expanded(
                child: InputPista(
                  controller: self.duracionPartidaController,
                  focusNode: self.duracionPartidaFocusNode,
                  context: context,
                  labelText: 'Duración partida',
                  onChanged: (val) =>
                      {setDuration(val), self.isValidBtnTarifas.refresh()},
                  itemsDD: const ['60 Minutos', '90 Minutos'],
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: Obx(
                () => InputPista(
                  controller: self.horaInicioController,
                  focusNode: self.horaInicioFocusNode,
                  context: context,
                  labelText: 'Hora de inicio',
                  onChanged: (val) {
                    setState(() {
                      self.horaFinController.text =
                          listaHorarios[listaHorarios.length - 1];
                    });
                    self.isValidBtnTarifas.refresh();
                  },
                  enableInput: self.isValidBtnTarifas.value ||
                      self.duracionPartidaController.text != '',
                  itemsDD: listaHorarios,
                ),
              )),
              4.0.sw,
              Expanded(
                child: Obx(
                  () => InputPista(
                      controller: self.horaFinController,
                      focusNode: self.horaFinFocusNode,
                      context: context,
                      labelText: 'Hora de fin',
                      onChanged: (val) => self.isValidBtnTarifas.refresh(),
                      enableInput: self.isValidBtnTarifas.value ||
                          self.duracionPartidaController.text != '',
                      itemsDD: generarHoraFinal(listaHorarios)),
                ),
              )
            ],
          ),
          buildContainerSocio(
            context: context,
            title: 'Socio',
            tiempoReservaController: self.tiempoReservaSocioController!,
            tiempoReservaFocusNode: self.tiempoReservaSocioFocusNode!,
            tiempoCancelacionController: self.tiempoCancelacionSocioController!,
            tiempoCancelacionFocusNode: self.tiempoCancelacionSocioFocusNode!,
            precioConLuzController: self.precioConLuzSocioController!,
            precioConLuzFocusNode: self.precioConLuzSocioFocusNode!,
            precioSinLuzController: self.precioSinLuzSocioController!,
            precioSinLuzFocusNode: self.precioSinLuzSocioFocusNode!,
          ),
          buildContainerSocio(
            context: context,
            title: 'No Socio',
            tiempoReservaController: self.tiempoReservaNoSocioController!,
            tiempoReservaFocusNode: self.tiempoReservaNoSocioFocusNode!,
            tiempoCancelacionController:
                self.tiempoCancelacionNoSocioController!,
            tiempoCancelacionFocusNode: self.tiempoCancelacionNoSocioFocusNode!,
            precioConLuzController: self.precioConLuzNoSocioController!,
            precioConLuzFocusNode: self.precioConLuzNoSocioFocusNode!,
            precioSinLuzController: self.precioSinLuzNoSocioController!,
            precioSinLuzFocusNode: self.precioSinLuzNoSocioFocusNode!,
          ),
          Obx(() => FFButtonWidget(
                onPressed: !self.isValidBtnTarifas.value
                    ? null
                    : () async {
                        generarListaTarifas();
                        // Get.toNamed(Routes.'Tarifas');
                      },
                text: FFLocalizations.of(context).getText(
                  '78hdleaa' /* Crear Tarifas */,
                ),
                options: FFButtonOptions(
                  height: 40.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      24.0, 0.0, 24.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: !self.isValidBtnTarifas.value
                      ? Colores().grisClaro
                      : FlutterFlowTheme.of(context).alternate,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Readex Pro',
                        color: !self.isValidBtnTarifas.value
                            ? Colors.black
                            : Colors.white,
                      ),
                  elevation: 3.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              )),
          TextFormField(
            controller: self.descripcionController,
            focusNode: self.descripcionFocusNode,
            obscureText: false,
            decoration: InputDecoration(
              counterText: '',
              labelText: FFLocalizations.of(context).getText(
                'wj02p7dq' /* Descripción */,
              ),
              labelStyle: FlutterFlowTheme.of(context).labelMedium,
              hintStyle: FlutterFlowTheme.of(context).labelMedium,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colores().proveedor.primary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colores().proveedor.primary,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: FlutterFlowTheme.of(context).error,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              contentPadding:
                  const EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 16.0, 12.0),
            ),
            style: FlutterFlowTheme.of(context).bodyMedium,
            cursorColor: FlutterFlowTheme.of(context).primary,
            maxLines: 4,
            inputFormatters: [MaxLinesTextInputFormatter(4)],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: InputPista(
                  typeInputPista: TypeInputPista.input,
                  controller: self.nombrePatrocinadorController,
                  focusNode: self.nombrePatrocinadorFocusNode,
                  context: context,
                  labelText: 'Nombre patrocinador',
                  itemsDD: [],
                  readOnly: false,
                ),
              ),
              const SizedBox(
                width: 4.0,
              ),
              Expanded(
                  child: BtnIcon(
                borderRadius: 12,
                borderColor: Colores().proveedor.primary,
                hoverColor: Colores().proveedor.primary69,
                buttonSize: 45,
                borderWidth: 2,
                padding: const EdgeInsets.all(8.0),
                onPressed: () async {
                  try {
                    File? filePick = await pickImage(ImageSource.camera);
                    if (filePick != null) {
                      subirImageNode(filePick);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                icon: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.add_a_photo_rounded,
                      color: Colores().proveedor.primary,
                      size: 25.0,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'dgg2lyy5' /* Patrocinador */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).labelMedium,
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: InputPista(
                  controller: self.vestuarioController,
                  focusNode: self.vestuarioFocusNode,
                  context: context,
                  labelText: 'Vestuario',
                  itemsDD: const ['Si', 'No'],
                ),
              ),
              Container(
                width: 4.0,
                decoration: BoxDecoration(),
              ),
              Expanded(
                child: InputPista(
                  controller: self.duchasController,
                  focusNode: self.duchasFocusNode,
                  context: context,
                  labelText: 'Duchas',
                  itemsDD: const ['Si', 'No'],
                ),
              ),
            ],
          ),
          BtnIcon(
            borderRadius: 12,
            borderColor: Colores().proveedor.primary,
            hoverColor: Colores().proveedor.primary69,
            borderWidth: 2,
            height: 45,
            padding: const EdgeInsets.all(8.0),
            onPressed: () async {
              try {
                List<File> fileImages = await pickImages();
                for (var element in fileImages) {
                  await subirImageNode(element);
                }
              } catch (e) {
                print(e);
              }
            },
            icon: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.add_a_photo_rounded,
                  color: Colores().proveedor.primary,
                  size: 25.0,
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: Text(
                    'Subir imagenes de la pista',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).labelMedium,
                  ),
                ),
              ],
            ),
          ),
        ].divide(const SizedBox(height: 10.0)),
      ),
    );
  }

  void generarListaTarifas() {
    final newListString = [];
    bool startList = false;
    for (var element in listaHorarios) {
      if (element == self.horaInicioController.text) {
        startList = true;
      }
      if (startList) {
        newListString.add(element);
        if (element == self.horaFinController.text) {
          break;
        }
      }
    }
    setState(() {
      FFAppState().listaTarifas = List<List<Tarifa>>.generate(
          7,
          (index) => List.generate(
              newListString.length,
              (index) => Tarifa(
                  horaInicio: newListString[index],
                  precioConLuzSocio: self.precioConLuzSocioController.text.pc,
                  precioSinLuzSocio: self.precioSinLuzSocioController.text.pc,
                  precioConLuzNoSocio:
                      self.precioConLuzNoSocioController.text.pc,
                  precioSinLuzNoSocio:
                      self.precioSinLuzNoSocioController.text.pc)));
      FFAppState().preciosinluzController = self.precioSinLuzSocioController!;
      FFAppState().precioconluzController = self.precioConLuzSocioController!;
      FFAppState().preciosinluzNoSocioController =
          self.precioSinLuzNoSocioController!;
      FFAppState().precioconluzNoSocioController =
          self.precioConLuzNoSocioController!;
    });
    Get.toNamed(Routes.TARIFAS);
  }

  void setDuration(String value) {
    if (value == '60 Minutos') {
      generarListaHorarios(true);
    } else {
      generarListaHorarios(false);
    }
  }

  void generarListaHorarios(isSesena) {
    List<String> newListHorarios = [];
    DateTime initialTime = DateTime(2023, 1, 1, 0, 0);
    DateTime endTime = DateTime(2023, 1, 2, 0, 0);
    DateTime currentTime = initialTime;
    Duration duration = const Duration();
    if (isSesena) {
      duration = const Duration(minutes: 60);
    } else {
      duration = const Duration(minutes: 90);
    }
    String horaDia = DateFormat('HH:mm').format(currentTime);
    newListHorarios.add(horaDia);
    while (currentTime.isBefore(endTime)) {
      currentTime = currentTime.add(duration);
      String horaDia = DateFormat('HH:mm').format(currentTime);
      newListHorarios.add(horaDia);
    }
    newListHorarios.removeLast();
    setState(() {
      listaHorarios = newListHorarios;
    });
  }

  List<String> generarHoraFinal(List<String> lista) {
    final List<String> horariosFinal = [];
    bool startList = false;
    for (var i = 0; i < lista.length; i++) {
      if (startList) {
        horariosFinal.add(lista[i]);
      } else {
        if (lista[i] == self.horaInicioController.text) {
          if (i == lista.length - 1) {
            horariosFinal.add(lista[i]);
          }
          startList = true;
        }
      }
    }
    return horariosFinal;
  }

  Widget buildContainerSocio({
    required BuildContext context,
    required String title,
    required TextEditingController tiempoReservaController,
    required FocusNode tiempoReservaFocusNode,
    required TextEditingController tiempoCancelacionController,
    required FocusNode tiempoCancelacionFocusNode,
    required TextEditingController precioConLuzController,
    required FocusNode precioConLuzFocusNode,
    required TextEditingController precioSinLuzController,
    required FocusNode precioSinLuzFocusNode,
  }) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          border: Border.all(
            color: const Color.fromRGBO(43, 120, 220, 1),
          ),
          boxShadow: const [
            BoxShadow(
                blurRadius: 1,
                offset: Offset(0, 1),
                blurStyle: BlurStyle.normal)
          ]),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 0.0),
                child: Text(
                  title,
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: InputPista(
                      controller: tiempoReservaController,
                      focusNode: tiempoReservaFocusNode,
                      context: context,
                      labelText: 'Tiempo reserva',
                      itemsDD: const [
                        '1 Día',
                        '2 Día',
                        '3 Día',
                        '4 Día',
                        '5 Día',
                        '6 Día',
                        '7 Día',
                        '8 Día',
                        '9 Día',
                        '10 Día',
                      ],
                    ),
                  ),
                  4.0.sw,
                  Expanded(
                    child: InputPista(
                      controller: tiempoCancelacionController,
                      focusNode: tiempoCancelacionFocusNode,
                      context: context,
                      labelText: 'Tiempo cancelación',
                      itemsDD: const [
                        '12 Horas',
                        '24 Horas',
                        '48 Horas',
                        '72 Horas'
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: InputPista(
                      typeInputPista: TypeInputPista.input,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      controller: precioConLuzController,
                      focusNode: precioConLuzFocusNode,
                      context: context,
                      labelText: 'Precio con luz',
                      maxLength: 7,
                      onChanged: (val) => self.isValidBtnTarifas.refresh(),
                      inputFormatters: [PrecioInputFormatter()],
                      readOnly: false,
                    ),
                  ),
                  4.0.sw,
                  Expanded(
                    child: InputPista(
                      typeInputPista: TypeInputPista.input,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      controller: precioSinLuzController,
                      focusNode: precioSinLuzFocusNode,
                      context: context,
                      maxLength: 7,
                      onChanged: (val) => self.isValidBtnTarifas.refresh(),
                      labelText: 'Precio sin luz',
                      inputFormatters: [PrecioInputFormatter()],
                      readOnly: false,
                    ),
                  ),
                ],
              ),
              4.0.sw,
            ].divide(10.0.sh)),
      ),
    );
  }
}

class MaxLinesTextInputFormatter extends TextInputFormatter {
  final int maxLines;

  MaxLinesTextInputFormatter(this.maxLines);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Contamos el número de saltos de línea en el nuevo valor
    int lineCount = '\n'.allMatches(newValue.text).length + 1;

    // Si el número de líneas supera el límite, mantenemos el valor anterior
    if (lineCount > maxLines) {
      return oldValue;
    }

    // Si no, permitimos la actualización
    return newValue;
  }
}

class PrecioInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text.replaceAll('.', ''); // Eliminar puntos
    int newTextLength = newText.length;

    if (newTextLength == 0) {
      // Si no hay ningún número ingresado, devolver un valor vacío
      return const TextEditingValue();
    }
    if (double.tryParse(newText) == null) {
      double amount = double.parse(newText.substring(0, newText.length - 2)) /
          100; // Convertir a número y dividir por 100
      String formattedText =
          amount.toStringAsFixed(2); // Formatear con dos decimales

      return TextEditingValue(
        text: '$formattedText €',
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    } else {
      double amount =
          double.parse(newText) / 100; // Convertir a número y dividir por 100
      String formattedText =
          amount.toStringAsFixed(2); // Formatear con dos decimales

      return TextEditingValue(
        text: '$formattedText €',
        selection: TextSelection.collapsed(offset: formattedText.length),
      );
    }
  }
}
