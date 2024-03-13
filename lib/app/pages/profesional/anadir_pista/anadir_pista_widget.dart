import 'package:get/get.dart';
import 'package:reservatu_pista/utils/colores.dart';
import 'package:reservatu_pista/utils/sizer.dart';
import '../../../../components/navbar_y_appbar_profesional.dart';
import '../../../../utils/btn_icon.dart';
import '../../../widgets/terminos_condiciones.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import './widgets/list_inputs.dart';
import 'anadir_pista_c.dart';
import 'anadir_pista_model.dart';
export 'anadir_pista_model.dart';

class AnadirPistaWidget extends StatefulWidget {
  const AnadirPistaWidget({Key? key}) : super(key: key);

  @override
  _AnadirPistaWidgetState createState() => _AnadirPistaWidgetState();
}

class _AnadirPistaWidgetState extends State<AnadirPistaWidget>
    with TickerProviderStateMixin {
  AnadirPistaController self = Get.find();
  late AnadirPistaModel _model;
  late AnimationControllerInputs anims;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'textFieldOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 100.ms,
          begin: Offset(-5.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 110.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 110.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnadirPistaModel());
    anims = AnimationControllerInputs(
        precioConLuzSocio: AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 200),
        ),
        precioSinLuzSocio: AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 200),
        ),
        precioConLuzNoSocio: AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 200),
        ),
        precioSinLuzNoSocio: AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 200),
        ),
        duracionPartida: AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 200),
        ),
        horaInicio: AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 200),
        ),
        horaFin: AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 200),
        ));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

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

    return NavbarYAppbarProfesional(
      title: 'Añadir Pista',
      page: TypePage.ReservarPista,
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                      child: ListInputs(anims: anims, formKey: _model.formKey)),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      // _model.formKey.currentState!.validate();
                      // anims.horaInicio.forward();
                      self.guardarDatos();
                      // anadirPistaNode();
                    },
                    text: FFLocalizations.of(context).getText(
                      'qc6ozir1' /* Crear Pista */,
                    ),
                    options: FFButtonOptions(
                      height: 40.0,
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          24.0, 0.0, 24.0, 0.0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).btnGeneral,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                      elevation: 3.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
              10.0.sh,
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Theme(
                    data: ThemeData(
                      checkboxTheme: CheckboxThemeData(
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      unselectedWidgetColor:
                          FlutterFlowTheme.of(context).secondaryText,
                    ),
                    child: Obx(() => Checkbox(
                          value: self.checkboxTerminos.value,
                          onChanged: (newValue) async {
                            self.checkboxTerminos.value = newValue!;
                          },
                          activeColor: Colores().proveedor.primary,
                          //  side: validateTerminos.value
                          //      ? BorderSide(
                          //          color: FlutterFlowTheme.of(context).error)
                          //      : null,
                          checkColor: FlutterFlowTheme.of(context).primaryText,
                        )),
                  ),
                  BtnIcon(
                    onPressed: () => Get.dialog(const TermConditions()),
                    borderRadius: 12,
                    padding: const EdgeInsets.all(0),
                    icon: Text(
                      'He leído y acepto los\nTérminos y Condiciones de Servicio.',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).info,
                          ),
                    ),
                  ),
                ],
              ),
              15.0.sh,
            ],
          ),
        ),
      ),
    );
  }
}
