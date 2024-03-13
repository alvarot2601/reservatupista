import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/utils/sizer.dart';

import '../../../components/alert_recargar/alert_recargar_widget.dart';
import '../../../components/navbar_y_appbar_usuario.dart';
import '../../../utils/dialog/answer_d.dart';
import '../../../utils/dialog/rich_alert_flutterflow.dart';
import '../../../utils/format_number.dart';
import '/backend/schema/enums/enums.dart';
import '/components/nav_bar_usuario/nav_bar_usuario_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'monedero_virtual_model.dart';
export 'monedero_virtual_model.dart';

class MonederoVirtualWidget extends StatefulWidget {
  const MonederoVirtualWidget({Key? key}) : super(key: key);

  @override
  _MonederoVirtualWidgetState createState() => _MonederoVirtualWidgetState();
}

class _MonederoVirtualWidgetState extends State<MonederoVirtualWidget>
    with TickerProviderStateMixin {
  late MonederoVirtualModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
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
          begin: Offset(0.0, 50.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
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
          begin: Offset(40.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MonederoVirtualModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
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

    return NavbarYAppbarUsuario(
      title: 'Monedero Virtual',
      page: TypePage.MonederoVirtual,
      child: Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 5.0, 16.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 120.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondary,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2.0,
                      color: Color(0x33000000),
                      offset: Offset(0.0, 0.0),
                      spreadRadius: 1.0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, -1.0),
                      child: Container(
                        width: 250,
                        height: 65.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 28.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Text(
                              '${FormatNumber.formatNumberWithTwoDecimals(FFAppState().moneyMonederoVirtual).toString()} €',
                              style: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF14181B),
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              await showAlignedDialog(
                                context: context,
                                // isGlobal: true,
                                isGlobal: true,
                                avoidOverflow: false,
                                builder: (dialogContext) {
                                  return Material(
                                    color: Color.fromARGB(0, 163, 0, 0),
                                    child: (AlertRecargarWidget()),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            text: FFLocalizations.of(context).getText(
                              'etd8s02j' /* Recargar */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).btnGeneral,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ).animateOnPageLoad(
                          animationsMap['columnOnPageLoadAnimation']!),
                    ),
                  ],
                ),
              ).animateOnPageLoad(
                  animationsMap['containerOnPageLoadAnimation']!),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FFButtonWidget(
                    onPressed: () {
                      setState(() {
                        _model.isFiltrar = !_model.isFiltrar;
                      });
                    },
                    text: FFLocalizations.of(context).getText(
                      'wm531z5p' /* Filtrar */,
                    ),
                    icon: Icon(
                      Icons.line_weight_rounded,
                      size: 20.0,
                    ),
                    options: FFButtonOptions(
                      width: 106.0,
                      height: 25.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).btnGeneral,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 14.0,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  Builder(builder: (context) {
                    final tipoText = (_model.type == TypeHistorial.reserva)
                        ? 'Reservas'
                        : (_model.type == TypeHistorial.tranferencia
                            ? 'Recargas'
                            : 'Todo');
                    return Text(
                      tipoText,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: Color(0xFF808080),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                          ),
                    );
                  }),
                ],
              ),
            ),
            _model.isFiltrar
                ? Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      FFButtonWidget(
                          text: 'Reservas',
                          onPressed: () {
                            setState(() {
                              _model.type = TypeHistorial.reserva;
                            });
                          },
                          options: FFButtonOptions(
                              color: _model.type != TypeHistorial.reserva
                                  ? Color.fromARGB(255, 50, 50, 50)
                                  : Colors.green,
                              borderRadius: BorderRadius.circular(30))),
                      FFButtonWidget(
                          text: 'Recargas',
                          onPressed: () {
                            setState(() {
                              _model.type = TypeHistorial.tranferencia;
                            });
                          },
                          options: FFButtonOptions(
                              color: _model.type != TypeHistorial.tranferencia
                                  ? Color.fromARGB(255, 50, 50, 50)
                                  : Colors.green,
                              borderRadius: BorderRadius.circular(30))),
                      FFButtonWidget(
                          text: 'Todo',
                          onPressed: () {
                            setState(() {
                              _model.type = TypeHistorial.all;
                            });
                          },
                          options: FFButtonOptions(
                              color: _model.type != TypeHistorial.all
                                  ? Color.fromARGB(255, 50, 50, 50)
                                  : Colors.green,
                              borderRadius: BorderRadius.circular(30))),
                    ].divide(SizedBox(width: 5.0)),
                  )
                : SizedBox(),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 24.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _model.type != TypeHistorial.reserva
                          ? buildReserva(context)
                          : SizedBox(),
                      _model.type != TypeHistorial.tranferencia
                          ? buildTransferencia(context)
                          : SizedBox(),
                      // buildTransferencia(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildTransferencia(BuildContext context) {
  return Padding(
    padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
    child: Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: 570.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Color(0xFFE74C3C),
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 5.0, 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/icon_monedero_virtual.png',
                          width: 30.0,
                          height: 30.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      textScaleFactor: MediaQuery.of(context).textScaleFactor,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              '3vndv0eb' /* Reserva de pista */,
                            ),
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: '',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primary,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 18.0,
                            ),
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '088p3ttw' /* Pista Padel #1 */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'gz0qmisy' /* Lunes 3 Enero 2024 */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '3rydlm4r' /* Hora: 11:34 */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'tgp5papj' /* - 1,50 € */,
                  ),
                  textAlign: TextAlign.end,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Outfit',
                        color: Color(0xFFE74C3C),
                        fontSize: 18.0,
                      ),
                ),
                Container(
                  height: 15.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                ),
                Text(
                  FFLocalizations.of(context).getText(
                    'b8mc21qx' /* Monedero
                      Virtual */
                    ,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildReserva(BuildContext context) {
  return Padding(
    padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 0.0),
    child: Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: 570.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Color(0xFF00BC13),
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 5.0, 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/icon_recarga.png',
                          width: 38.0,
                          height: 38.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      textScaleFactor: MediaQuery.of(context).textScaleFactor,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'g0yapamj' /* Recarga */,
                            ),
                            style: TextStyle(),
                          ),
                          TextSpan(
                            text: '',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primary,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 18.0,
                            ),
                      ),
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        '3rs8cnun' /* Lunes 8 Enero 2024 */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                    Text(
                      FFLocalizations.of(context).getText(
                        'yhtwqot0' /* Hora: 11:34 */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '7fb17ptw' /* + 100,00 € */,
                    ),
                    textAlign: TextAlign.end,
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Outfit',
                          color: Color(0xFF00BC13),
                          fontSize: 18.0,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'ms78u1cd' /* Tarjeta */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
