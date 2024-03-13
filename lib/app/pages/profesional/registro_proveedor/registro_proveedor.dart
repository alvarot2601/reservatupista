import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/utils/colores.dart';
import './registro_proveedor_c.dart';
import '../../../../flutter_flow/flutter_flow_animations.dart';
import '../../../../utils/animations/get_image.dart';
import '../../../../utils/btn_icon.dart';
import '../../../widgets/appbar_general.dart';
import '../../../widgets/seleccionar_imagen/seleccionar_imagen_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'widgets/codigo_iban.dart';
import 'widgets/input_registrar.dart';

class RegistroProveedorPage extends GetView<RegistroProveedorController> {
  RegistroProveedorController get self => controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final focusedColor = const Color(0xFF46EF98);
  final lineColor = const Color.fromARGB(160, 70, 239, 152);
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
    final datosFacturacion = self.datosFacturacion().listProperty();
    final datosPago = self.datosPago().listProperty();
    final datosContacto = self.datosContacto();
    final datosUbicacion = self.datosUbicacion();
    final datosContrasena = self.datosContrasena();
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
                  title: 'Registro Proveedor',
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
                            padding: const EdgeInsetsDirectional.fromSTEB(
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
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Selecciona tu foto de perfil',
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .copyWith(color: Colors.black),
                                      ),
                                      Stack(
                                        children: [
                                          SizedBox(
                                            width: 90,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                  errorStyle: const TextStyle(
                                                      fontSize: 0),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 3.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              width: 3,
                                                              color: Colores()
                                                                  .usuario
                                                                  .primary),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50)),
                                                  border: OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              width: 3),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                  contentPadding:
                                                      const EdgeInsets
                                                              .symmetric(
                                                          vertical: 34)),
                                              enableInteractiveSelection: false,
                                              readOnly: true,
                                              validator: (val) {
                                                if (self.imageFile.value ==
                                                    null) {
                                                  return '';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                          Container(
                                            width: 90.0,
                                            height: 90.0,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: BtnIcon(
                                              onPressed: () {
                                                Get.dialog(
                                                    SeleccionarImagenWidget(
                                                  camera: self.btns.camera,
                                                  galeria: self.btns.galeria,
                                                  imageLocal:
                                                      self.btns.imageLocal,
                                                  isProveedor: true,
                                                ));
                                              },
                                              borderRadius: 50,
                                              padding: const EdgeInsets.all(0),
                                              fillColor: Colors.transparent,
                                              hoverColor: const Color.fromARGB(
                                                  68, 255, 255, 255),
                                              icon: Obx(() => ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60),
                                                    child: getImage(
                                                        self.imageFile.value,
                                                        isRegristro: true),
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 0.0, 0.0),
                            child: Text(
                              'Datos de facturación',
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                          ...List<Widget>.generate(
                              datosFacturacion.length,
                              (index) => buildInput(
                                  context: context,
                                  propertiesTextField:
                                      datosFacturacion[index])),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 0.0, 0.0),
                            child: Text(
                              'Datos de pago/cobro',
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                          ...List<Widget>.generate(
                              datosPago.length,
                              (index) => buildInput(
                                  context: context,
                                  propertiesTextField: datosPago[index])),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 0.0, 0.0),
                            child: Text(
                              'Datos de contacto',
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                          ...List<Widget>.generate(
                              datosContacto.listProperty().length,
                              (index) => buildInput(
                                  context: context,
                                  propertiesTextField:
                                      datosContacto.listProperty()[index])),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                5.0, 12.0, 5.0, 0.0),
                            child: Row(
                              children: [
                                SizedBox(
                                    width: 80,
                                    child: buildInput(
                                        context: context,
                                        padding: const EdgeInsets.all(0),
                                        propertiesTextField:
                                            datosContacto.lada)),
                                Flexible(
                                    child: buildInput(
                                        context: context,
                                        padding: const EdgeInsets.all(0),
                                        propertiesTextField:
                                            datosContacto.movil))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 0.0, 0.0),
                            child: Text(
                              'Datos ubicación',
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                          ...List<Widget>.generate(
                              datosUbicacion.length,
                              (index) => buildInput(
                                  context: context,
                                  propertiesTextField: datosUbicacion[index])),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 16.0, 0.0, 0.0),
                            child: Text(
                              'Datos de contraseña',
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                          buildInputContrasena(
                              context: context,
                              propertiesTextField: datosContrasena.contrasena,
                              visibility: self.contrasenaVisibility,
                              validator: (val) =>
                                  self.validateTextFieldContrasena(
                                      datosContrasena.contrasena.anim,
                                      datosContrasena.contrasena.focusNode,
                                      datosContrasena.contrasena.labelText)),
                          buildInputContrasena(
                              context: context,
                              propertiesTextField:
                                  datosContrasena.comprobarContrasena,
                              isComprobarContrasena: true,
                              visibility: self.comprobarContrasenaVisibility,
                              validator: (val) =>
                                  self.validateTextFieldContrasenaComprobar(
                                      datosContrasena.comprobarContrasena.anim,
                                      datosContrasena
                                          .comprobarContrasena.focusNode,
                                      datosContrasena
                                          .comprobarContrasena.labelText)),
                          VibratingWidget(
                            controller: self.animTerminos,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                    ),
                                    child: Obx(() => Checkbox(
                                          value: self.checkboxTerminos.value,
                                          onChanged: (newValue) async {
                                            self.checkboxTerminos.value =
                                                newValue!;
                                          },
                                          activeColor: focusedColor,
                                          checkColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          side: self.validateCheckbox.value
                                              ? const BorderSide(
                                                  color: Colors.red)
                                              : null,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: BtnIcon(
                                      onPressed: ButtonsPage.termsAndConditions,
                                      borderRadius: 12,
                                      padding: const EdgeInsets.all(0),
                                      icon: AutoSizeText(
                                        'He leído y acepto los\nTérminos y Condiciones de Servicio.',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: FFButtonWidget(
                              onPressed: self.onPressedRegistrar,
                              text: 'Registrate',
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 0.4,
                                height: 40,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 0),
                                iconPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 0),
                                color: FlutterFlowTheme.of(context).primary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                    ),
                                elevation: 2,
                                borderSide: const BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ),
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
    EdgeInsetsGeometry? padding,
    required PropertiesTextField propertiesTextField,
  }) {
    if (propertiesTextField.labelText == 'Número de cuenta') {
      return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
        child: CodigoIban(),
      );
    }
    return VibratingWidget(
        controller: propertiesTextField.anim,
        child: Padding(
            padding: padding ??
                const EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
            child: propertiesTextField.isSelect
                ? LayoutBuilder(builder: (context, boxContrains) {
                    return TextFormField(
                      controller: propertiesTextField.controller,
                      focusNode: propertiesTextField.focusNode,
                      maxLength: propertiesTextField.maxLength,
                      keyboardType: propertiesTextField.keyboardType,
                      decoration: InputDecoration(
                        counterText: '',
                        errorStyle: const TextStyle(fontSize: 0),
                        labelText: propertiesTextField.labelText,
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Readex Pro',
                                  color: const Color(0xFF95A1AC),
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: lineColor,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: focusedColor,
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
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 12.0),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                      validator: propertiesTextField.validateTextField,
                      cursorColor: FlutterFlowTheme.of(context).primary,
                      readOnly: true,
                      onTap: () => SelectInputRegistrar(
                        context: context,
                        itemsDD: propertiesTextField.listSelect,
                        paddingDialogLeft: 5,
                        paddingSelect:
                            const EdgeInsets.only(left: 10.0, top: 0),
                        onChanged: (val) =>
                            propertiesTextField.controller.text = val,
                      ).handleTap(),
                      enableInteractiveSelection: propertiesTextField.isSelect,
                    );
                  })
                : (propertiesTextField.labelText == 'Certificado de cuenta'
                    ? buildUploadImage(
                        context: context,
                        propertiesTextField: propertiesTextField)
                    : TextFormField(
                        controller: propertiesTextField.controller,
                        focusNode: propertiesTextField.focusNode,
                        maxLength: propertiesTextField.maxLength,
                        keyboardType: propertiesTextField.keyboardType,
                        decoration: InputDecoration(
                          counterText: '',
                          errorStyle: const TextStyle(fontSize: 0),
                          labelText: propertiesTextField.labelText,
                          hintStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: const Color(0xFF95A1AC),
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: lineColor,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: focusedColor,
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
                          suffixIcon: propertiesTextField.suffixIcon,
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 12.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                        inputFormatters: propertiesTextField.inputFormatters,
                        onChanged: propertiesTextField.onChange,
                        validator: propertiesTextField.validateTextField))));
  }

  TextFormField buildUploadImage({
    required BuildContext context,
    required PropertiesTextField propertiesTextField,
  }) {
    return TextFormField(
      controller: propertiesTextField.controller,
      focusNode: propertiesTextField.focusNode,
      maxLength: propertiesTextField.maxLength,
      keyboardType: propertiesTextField.keyboardType,
      decoration: InputDecoration(
        counterText: '',
        errorStyle: const TextStyle(fontSize: 0),
        labelText: propertiesTextField.labelText,
        hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Readex Pro',
              color: const Color(0xFF95A1AC),
            ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: lineColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: focusedColor,
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
        prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Icon(Icons.edit_square, color: focusedColor, size: 40)),
        suffixIcon: Obx(() => self.imageFileCertificado.value != null
            ? BtnIcon(
                onPressed: () {
                  Get.dialog(
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Image.file(
                          File(self.imageFileCertificado.value!),
                          width: 250.0,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  );
                },
                borderRadius: 30,
                padding: const EdgeInsets.all(0),
                fillColor: Colors.transparent,
                hoverColor: const Color.fromARGB(68, 255, 255, 255),
                icon: CircleAvatar(
                  radius: 20,
                  backgroundImage: FileImage(
                    File(self.imageFileCertificado.value!),
                  ),
                ))
            : const SizedBox.shrink()),
        filled: true,
        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        contentPadding:
            const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
      ),
      style: FlutterFlowTheme.of(context).bodyMedium,
      readOnly: true,
      onTap: () {
        Get.dialog(SeleccionarImagenWidget(
          camera: self.btns.cameraCertificado,
          galeria: self.btns.galeriaCertificado,
          imageLocal: self.btns.imageLocalCertificado,
          isProveedor: true,
        ));
      },
      enableInteractiveSelection: false,
      validator: self.imageFileCertificado.value == null
          ? propertiesTextField.validateTextField
          : (val) => null,
    );
  }

  Widget buildInputContrasena(
      {required BuildContext context,
      required PropertiesTextField propertiesTextField,
      String? Function(String?)? validator,
      required RxBool visibility,
      bool isComprobarContrasena = false,
      EdgeInsetsGeometry? padding}) {
    return Obx(() => VibratingWidget(
        controller: propertiesTextField.anim,
        child: Padding(
            padding: padding ??
                const EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
            child: TextFormField(
              controller: propertiesTextField.controller,
              focusNode: propertiesTextField.focusNode,
              maxLength: propertiesTextField.maxLength,
              obscureText: !visibility.value,
              keyboardType: propertiesTextField.keyboardType,
              decoration: InputDecoration(
                counterText: '',
                errorStyle: isComprobarContrasena
                    ? const TextStyle(fontSize: 12)
                    : const TextStyle(fontSize: 0),
                labelText: propertiesTextField.labelText,
                hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: const Color(0xFF95A1AC),
                    ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
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
                prefixIcon: Icon(
                  visibility.value ? Icons.lock_open : Icons.lock,
                ),
                prefixIconColor: FlutterFlowTheme.of(context).primary,
                suffixIcon: InkWell(
                  onTap: () => visibility.value = !visibility.value,
                  focusNode: FocusNode(skipTraversal: true),
                  child: Icon(
                    visibility.value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colores().usuario.primary,
                    size: 22,
                  ),
                ),
                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                contentPadding: const EdgeInsetsDirectional.fromSTEB(
                    16.0, 12.0, 16.0, 12.0),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
              validator: validator,
            ))));
  }
}
