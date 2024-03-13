import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../components/app_bar_login_widget.dart';
import '../../../../components/navbar_login.dart';
import '../../../../flutter_flow/flutter_flow_animations.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import '../../../../flutter_flow/flutter_flow_util.dart';
import '../../../../flutter_flow/flutter_flow_widgets.dart';
import './olvide_contrasena_c.dart';

class OlvideContrasenaPage extends GetView<OlvideContrasenaController> {
  final Color colorProfesional = const Color(0xFF46EF98);
  final Color colorUsuario = const Color(0xFF2B78DC);
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
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryText,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                FlutterFlowTheme.of(context).tertiary,
                FlutterFlowTheme.of(context).accent4
              ],
              stops: [0, 1],
              begin: const AlignmentDirectional(0, -1),
              end: const AlignmentDirectional(0, 1),
            ),
          ),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: AppBarLoginWidget(),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          20.0.sh,
                          Form(
                              key: controller.formKey0,
                              child: _buildInput(context)),
                          20.0.sh,
                          mostrarText(),
                          20.0.sh,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              BtnAccederRegistrar(
                                  onPressed: controller.resendSendEmail,
                                  color: controller.lineColor,
                                  textButton: 'Recuperar'),
                              BtnAccederRegistrar(
                                  onPressed: Get.back,
                                  color: controller.lineColor,
                                  textButton: 'Regresar'),
                            ]
                                .map<Widget>(
                                  (e) => FFButtonWidget(
                                    onPressed: e.onPressed,
                                    text: e.textButton,
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.4,
                                      height: 40,
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                      color: e.color,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                          ),
                                      elevation: 2,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const NavBarLogin()
            ],
          ),
        ),
      ),
    );
  }

  Widget mostrarText() {
    return Obx(() => controller.stateEmail.value
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              '''Le enviaremos un email para restablecer la contraseña.
Por favor si pasado unos minutos no lo recibe,revise la carpeta de spam de su correo.
''',
              style: FlutterFlowTheme.of(Get.context!)
                  .bodyMedium
                  .copyWith(fontStyle: FontStyle.italic, fontSize: 20),
            ),
          )
        : const SizedBox.shrink());
  }

  Widget _buildInput(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0),
      child: TextFormField(
        controller: TextEditingController(),
        obscureText: false,
        maxLength: 15,
        decoration: InputDecoration(
          counterText: '',
          errorStyle:
              const TextStyle(fontSize: 0, decoration: TextDecoration.none),
          labelText: 'Email',
          hintText: 'Ingresa tu email aquí...',
          hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Readex Pro',
                color: const Color(0xFF95A1AC),
              ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: controller.lineColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: controller.focusedColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
          prefixIcon: const Icon(
            Icons.person,
          ),
          prefixIconColor: controller.lineColor,
        ),
        style: FlutterFlowTheme.of(context).bodyMedium,
        // onChanged: self.onChangeTextField,
        // validator: (val) {
        //   return self.validateTextField(val, self.animUsuario);
        // },
      ),
    );
  }
}

class BtnAccederRegistrar {
  final void Function()? onPressed;
  final String textButton;
  final Color color;
  BtnAccederRegistrar(
      {this.onPressed, required this.textButton, required this.color});
}
