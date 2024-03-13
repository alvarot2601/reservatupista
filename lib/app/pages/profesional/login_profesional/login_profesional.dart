import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './login_profesional_c.dart';
import '../../../../flutter_flow/flutter_flow_animations.dart';
import '../../../../utils/btn_icon.dart';
import '../../../../components/navbar_login.dart';
import '/components/app_bar_login_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginProfesionalPage extends GetView<LoginProfesionalController> {
  LoginProfesionalController get self => controller;
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
    final Color colorAll = FlutterFlowTheme.of(context).btnGeneral;
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryText,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height * 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).tertiary,
                FlutterFlowTheme.of(context).accent4
              ],
              stops: [0, 1],
              begin: AlignmentDirectional(0, -1),
              end: AlignmentDirectional(0, 1),
            ),
          ),
          child: Stack(
            children: [
              Form(
                key: self.formKey,
                child: Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: AppBarLoginWidget(),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width,
                        decoration: const BoxDecoration(
                          color: Color(0x00FFFFFF),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'jc2uhe2a' /* Profesional */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize:
                                        MediaQuery.sizeOf(context).width < 300.0
                                            ? 10.0
                                            : 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            AutoSizeText(
                              FFLocalizations.of(context).getText(
                                'rculx1wc' /* Clubs, Ayuntamiento, Comunidad... */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 10.0,
                                  ),
                              minFontSize: 10.0,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: VibratingWidget(
                                      controller: self.animUsuario,
                                      child: TextFormField(
                                        controller: self.emailAddressController,
                                        focusNode: self.emailAddressFocusNode,
                                        obscureText: false,
                                        maxLength: 15,
                                        decoration: InputDecoration(
                                          counterText: '',
                                          errorStyle: const TextStyle(
                                              fontSize: 0,
                                              decoration: TextDecoration.none),
                                          labelText: 'Usuario',
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .copyWith(color: colorAll),
                                          hintText:
                                              'Ingresa su usuario aquí...',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Color(0xFF95A1AC),
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: colorAll,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 24, 0, 24),
                                          prefixIcon: Icon(
                                            Icons.person,
                                            color: colorAll,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        onChanged: self.onChangeTextField,
                                        validator: (val) {
                                          return self.validateTextField(
                                              val, self.animUsuario);
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Obx(() => VibratingWidget(
                                          controller: self.animContrasena,
                                          child: TextFormField(
                                            controller: self.passwordController,
                                            focusNode: self.passwordFocusNode,
                                            maxLength: 15,
                                            obscureText:
                                                !self.passwordVisibility.value,
                                            decoration: InputDecoration(
                                              counterText: '',
                                              labelText: 'Contraseña',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .copyWith(
                                                          color: colorAll),
                                              hintText:
                                                  'Ingresa tu contraseña aqui...',
                                              hintStyle: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Readex Pro',
                                                    color: Color(0xFF95A1AC),
                                                  ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: colorAll,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(16, 24, 0, 24),
                                              prefixIcon: Icon(
                                                self.passwordVisibility.value
                                                    ? Icons.lock_open
                                                    : Icons.lock,
                                                color: colorAll,
                                              ),
                                              suffixIcon: InkWell(
                                                onTap: () => self
                                                        .passwordVisibility
                                                        .value =
                                                    !self.passwordVisibility
                                                        .value,
                                                focusNode: FocusNode(
                                                    skipTraversal: true),
                                                child: Icon(
                                                  self.passwordVisibility.value
                                                      ? Icons
                                                          .visibility_outlined
                                                      : Icons
                                                          .visibility_off_outlined,
                                                  color: Color(0xFF95A1AC),
                                                  size: 22,
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                            onChanged: self.onChangeTextField,
                                            validator: (val) =>
                                                self.validateTextField(
                                                    val, self.animContrasena),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20, 12, 20, 16),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Theme(
                                        data: ThemeData(
                                          checkboxTheme: CheckboxThemeData(
                                            visualDensity:
                                                VisualDensity.compact,
                                            materialTapTargetSize:
                                                MaterialTapTargetSize
                                                    .shrinkWrap,
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
                                              value: self.checkboxValue1.value,
                                              onChanged: (newValue) async {
                                                self.checkboxValue1.value =
                                                    newValue!;
                                              },
                                              activeColor: colorAll,
                                              checkColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                            )),
                                      ),
                                      Text(
                                        'Recordar\ncontraseña',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                  BtnIcon(
                                    onPressed: () async {},
                                    borderRadius: 12,
                                    padding: const EdgeInsets.all(0),
                                    icon: Text(
                                      '¿Has olvidado\nla contraseña?',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FFButtonWidget(
                                    onPressed: self.onPressedAcceder,
                                    text: 'Acceder',
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.4,
                                      height: 40,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                      color: colorAll,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                      elevation: 2,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      ButtonsPage.registrarte();
                                    },
                                    text: 'Registrarte',
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.4,
                                      height: 40,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                      color: colorAll,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                      elevation: 2,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Theme(
                                  data: ThemeData(
                                    checkboxTheme: CheckboxThemeData(
                                      visualDensity: VisualDensity.compact,
                                      materialTapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                    ),
                                    unselectedWidgetColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                  child: Obx(() => Checkbox(
                                        value: self.checkboxValue2.value,
                                        onChanged: (newValue) async {
                                          self.checkboxValue2.value = newValue!;
                                        },
                                        activeColor:
                                            FlutterFlowTheme.of(context)
                                                .btnGeneral,
                                        checkColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      )),
                                ),
                                BtnIcon(
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
                                              FlutterFlowTheme.of(context).info,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 2,
                              thickness: 2,
                              indent: 20,
                              endIndent: 20,
                              color: FlutterFlowTheme.of(context).lineColor,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: ButtonsPage.usuario,
                          text: FFLocalizations.of(context).getText(
                            'whz0gbcv' /* Usuario */,
                          ),
                          options: FFButtonOptions(
                            width: 150.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: colorAll,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                            elevation: 2.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const NavBarLogin()
            ],
          ),
        ),
      ),
    );
  }
}
