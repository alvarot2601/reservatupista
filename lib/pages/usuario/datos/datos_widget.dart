import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../flutter_flow/flutter_flow_animations.dart';
import '../../../../utils/btn_icon.dart';
import '../../../app/pages/usuario/registrar_usuario/widgets/input_registrar.dart';
import '../../../app/widgets/appbar_general.dart';
import '../../../app/widgets/seleccionar_imagen/seleccionar_imagen_widget.dart';
import '../../../flutter_flow/flutter_flow_widgets.dart';
import '../../../utils/animations/get_image.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'datos_c.dart';

class DatosWidget extends GetView<DatosController> {
  DatosController get self => controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      body: Builder(
        builder: (context) {
          return SafeArea(
            top: true,
            child: Column(
              children: [
                const AppbarGeneral(
                  isTitleBack: true,
                  title: 'Datos',
                ),
                Form(
                  key: self.formKey,
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 1.0, 0.0, 0.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    color: Color(0x33000000),
                                    offset: Offset(0.0, 1.0),
                                  )
                                ],
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: 90.0,
                                        height: 90.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .accent2,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: BtnIcon(
                                          onPressed: () => Get.dialog(
                                              SeleccionarImagenWidget(
                                            camera: self.btns.camera,
                                            galeria: self.btns.galeria,
                                            imageLocal: self.btns.imageLocal,
                                          )),
                                          borderRadius: 50,
                                          padding: EdgeInsets.all(0),
                                          borderWidth: 3,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                          fillColor: Color.fromARGB(
                                              255, 255, 255, 255),
                                          hoverColor: const Color.fromARGB(
                                              68, 255, 255, 255),
                                          icon: Obx(() => ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(60),
                                                child: getImage(
                                                    self.imageFile.value),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'jgqax4kd' /* Datos Personales */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                          ...List<Widget>.generate(
                              self.listTextFieldDatosPersonales.length,
                              (index) => buildInput(
                                  context: context,
                                  propertiesTextField: self
                                      .listTextFieldDatosPersonales[index])),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'azrws2b9' /* Datos Ubicacion */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                          ...List<Widget>.generate(
                              self.listTextFieldDatosUbicacion.length,
                              (index) => buildInput(
                                  context: context,
                                  propertiesTextField:
                                      self.listTextFieldDatosUbicacion[index])),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'h6ok3a23' /* Datos de Juego */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                          ...List<Widget>.generate(
                              self.listTextFieldDatosJuego.length,
                              (index) => buildInput(
                                  context: context,
                                  propertiesTextField:
                                      self.listTextFieldDatosJuego[index])),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                          //   child: FFButtonWidget(
                          //     onPressed: self.onPressedRegistrar,
                          //     text: 'Guardar',
                          //     options: FFButtonOptions(
                          //       width: MediaQuery.sizeOf(context).width * 0.4,
                          //       height: 40,
                          //       padding:
                          //           EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          //       iconPadding:
                          //           EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          //       color: FlutterFlowTheme.of(context).primary,
                          //       textStyle: FlutterFlowTheme.of(context)
                          //           .bodyMedium
                          //           .override(
                          //             fontFamily: 'Readex Pro',
                          //             color:
                          //                 FlutterFlowTheme.of(context).tertiary,
                          //           ),
                          //       elevation: 2,
                          //       borderSide: BorderSide(
                          //         color: Colors.transparent,
                          //         width: 1,
                          //       ),
                          //       borderRadius: BorderRadius.circular(12),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: FFButtonWidget(
                    onPressed: self.onPressedGuardar,
                    text: 'Guardar cambios',
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      height: 40,
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).tertiary,
                              ),
                      elevation: 2,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildInput({
    required BuildContext context,
    required PropertiesTextField propertiesTextField,
  }) {
    print(propertiesTextField.isSelect);
    return VibratingWidget(
      controller: propertiesTextField.anim,
      child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
          child: propertiesTextField.isSelect
              ? LayoutBuilder(builder: (context, boxContrains) {
                  return TextFormField(
                    controller: propertiesTextField.textEditingController,
                    focusNode: propertiesTextField.focusNode,
                    maxLength: propertiesTextField.maxLength,
                    keyboardType: propertiesTextField.keyboardType,
                    decoration: InputDecoration(
                      counterText: '',
                      errorStyle: const TextStyle(fontSize: 0),
                      labelText: propertiesTextField.labelText,
                      labelStyle: FlutterFlowTheme.of(context).titleSmall,
                      hintStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Readex Pro',
                                color: Color(0xFF95A1AC),
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).lineColor,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 24.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    validator: (val) => self.validateTextField(
                        val,
                        propertiesTextField.anim,
                        propertiesTextField.focusNode,
                        propertiesTextField.labelText),
                    cursorColor: FlutterFlowTheme.of(context).primary,
                    readOnly: true,
                    onTap: () => SelectInputRegistrar(
                      context: context,
                      itemsDD: propertiesTextField.listSelect,
                      onChanged: (val) =>
                          propertiesTextField.textEditingController.text = val,
                    ).handleTap(),
                    enableInteractiveSelection: false,
                    onChanged: (val) =>
                        propertiesTextField.textEditingController.text = val,
                  );
                })
              : TextFormField(
                  controller: propertiesTextField.textEditingController,
                  focusNode: propertiesTextField.focusNode,
                  maxLength: propertiesTextField.maxLength,
                  keyboardType: propertiesTextField.keyboardType,
                  decoration: InputDecoration(
                    counterText: '',
                    errorStyle: const TextStyle(fontSize: 0),
                    labelText: propertiesTextField.labelText,
                    labelStyle: FlutterFlowTheme.of(context).titleSmall,
                    hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: Color(0xFF95A1AC),
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).lineColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 24.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  validator: (val) => self.validateTextField(
                      val,
                      propertiesTextField.anim,
                      propertiesTextField.focusNode,
                      propertiesTextField.labelText),
                )),
    );
  }
}
