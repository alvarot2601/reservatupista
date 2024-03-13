import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../../../backend/apis/direccion_nominatim.dart';
import '../../../../flutter_flow/flutter_flow_animations.dart';
import '../../../../utils/animations/get_image.dart';
import '../../../../utils/btn_icon.dart';
import '../../../../utils/colores.dart';
import '../../../../utils/loader/color_loader.dart';
import '../../../../utils/loader/color_loader_2.dart';
import '../../../../utils/loader/color_loader_3.dart';
import '../../../../utils/state_getx/state_mixin_demo.dart';
import '../../../widgets/appbar_general.dart';
import '../../../widgets/seleccionar_imagen/seleccionar_imagen_widget.dart';
import './registrar_usuario_c.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'widgets/input_registrar.dart';

class RegistrarUsuarioPage extends GetView<RegistrarUsuarioController> {
  RegistrarUsuarioController get self => controller;

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
    final datosPersonales = self.datosPersonales();
    final datosUbicacion = self.datosUbicacion();
    final datosJuego = self.datosJuego();
    final datosContrasena = self.datosContrasena();
    return Scaffold(
        key: scaffoldKey,
        body: SafeArea(
            top: true,
            child: Column(
              children: [
                // Generated code for this RiveAnimation Widget...

                const AppbarGeneral(
                  isTitleBack: true,
                  title: 'Registro Usuario',
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
                                              focusNode: self.fotoFocusNode,
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
                                                        camera:
                                                            self.btns.camera,
                                                        galeria:
                                                            self.btns.galeria,
                                                        imageLocal: self
                                                            .btns.imageLocal));
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
                              'Datos Personales',
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .copyWith(color: Colors.black),
                            ),
                          ),
                          Builder(builder: (BuildContext context) {
                            final listTopProperty = List.generate(
                                datosPersonales.listTopProperty().length,
                                (index) => buildInput(
                                    context: context,
                                    propertiesTextField: datosPersonales
                                        .listTopProperty()[index]));
                            return Column(
                              children: [
                                ...listTopProperty,
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 12.0, 5.0, 0.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: buildInput(
                                              context: context,
                                              padding: const EdgeInsets.all(0),
                                              propertiesTextField:
                                                  datosPersonales.sexo!)),
                                      4.0.sw,
                                      Flexible(
                                          child: buildInput(
                                              context: context,
                                              padding: const EdgeInsets.all(0),
                                              propertiesTextField:
                                                  datosPersonales.dni!))
                                    ],
                                  ),
                                ),
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
                                                  datosPersonales.lada!)),
                                      4.0.sw,
                                      Flexible(
                                          child: buildInput(
                                              context: context,
                                              padding: const EdgeInsets.all(0),
                                              propertiesTextField:
                                                  datosPersonales.telefono!))
                                    ],
                                  ),
                                ),
                                buildInput(
                                    context: context,
                                    propertiesTextField:
                                        datosPersonales.email!),
                              ],
                            );
                          }),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
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
                              datosUbicacion.length,
                              (index) => buildInput(
                                  context: context,
                                  propertiesTextField: datosUbicacion[index])),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
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
                          buildNick(
                              context: context,
                              propertiesTextField: datosJuego.nick!),
                          ...List<Widget>.generate(
                              datosJuego.listProperty().length,
                              (index) => buildInput(
                                  context: context,
                                  propertiesTextField:
                                      datosJuego.listProperty()[index])),
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
                                          activeColor:
                                              Colores().proveedor.primary,
                                          checkColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          side: !self.checkboxTerminos.value
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
                                      icon: Text(
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
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
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
            )));
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
              controller: propertiesTextField.textEditingController,
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

  Widget buildInput(
      {required BuildContext context,
      required PropertiesTextField propertiesTextField,
      String? Function(String?)? validator,
      EdgeInsetsGeometry? padding}) {
    final bool isRequired = propertiesTextField.isRequired;
    return VibratingWidget(
      controller: propertiesTextField.anim,
      child: Padding(
          padding: padding ??
              const EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
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
                      hintStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
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
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 12.0, 16.0, 12.0),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    cursorColor: FlutterFlowTheme.of(context).primary,
                    readOnly: true,
                    onTap: () => SelectInputRegistrar(
                      context: context,
                      itemsDD: propertiesTextField.listSelect,
                      paddingDialogLeft: 5,
                      paddingSelect: const EdgeInsets.only(left: 15),
                      onChanged: (val) =>
                          propertiesTextField.textEditingController.text = val,
                    ).handleTap(),
                    enableInteractiveSelection: false,
                    onChanged: (val) =>
                        propertiesTextField.textEditingController.text = val,
                    validator: isRequired
                        ? propertiesTextField.validateTextField
                        : null,
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
                    suffixIcon: propertiesTextField.labelText == 'Código Postal'
                        ? self.apiCodigoPostal.obx(
                            (state) => state!
                                ? const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                            onLoading: SizedBox(
                                width: 20,
                                child: ColorLoader(
                                  radius: 8,
                                  padding: const EdgeInsets.only(right: 1),
                                )),
                            onEmpty: const SizedBox.shrink())
                        : null,
                    filled: true,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    contentPadding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 12.0, 16.0, 12.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  inputFormatters: propertiesTextField.inputFormatters,
                  onChanged: (val) async {
                    if (propertiesTextField.labelText == 'Código Postal') {
                      self.existeCodigoPostal(val);
                    }
                  },
                  validator:
                      isRequired ? propertiesTextField.validateTextField : null,
                )),
    );
  }

  Widget buildNick(
      {required BuildContext context,
      required PropertiesTextField propertiesTextField,
      String? Function(String?)? validator,
      EdgeInsetsGeometry? padding}) {
    final bool isRequired = propertiesTextField.isRequired;
    return VibratingWidget(
      controller: propertiesTextField.anim,
      child: Padding(
          padding: padding ??
              const EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 0.0),
          child: TextFormField(
            controller: propertiesTextField.textEditingController,
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
              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
              contentPadding:
                  const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
              suffixIcon: self.obx(
                  (state) => state!
                      ? const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.cancel,
                          color: Colors.red,
                        ),
                  onLoading: SizedBox(
                      width: 20,
                      child: ColorLoader(
                        radius: 8,
                        padding: const EdgeInsets.only(right: 1),
                      )),
                  onEmpty: const SizedBox.shrink()),
            ),
            style: FlutterFlowTheme.of(context).bodyMedium,
            onChanged: self.loadingNick,
            validator:
                isRequired ? propertiesTextField.validateTextField : null,
          )),
    );
  }
}
