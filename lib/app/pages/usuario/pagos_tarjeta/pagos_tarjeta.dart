import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../../app_state.dart';
import '../../../../flutter_flow/flutter_flow_icon_button.dart';
import '../../../../utils/dialog/rich_alert_flutterflow.dart';
import '../../../../utils/format_number.dart';
import './pagos_tarjeta_c.dart';
import 'dart:async';
import 'dart:io';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_widgets.dart';

import 'package:flutter/cupertino.dart';
// import 'package:flutter_paystack/flutter_paystack.dart';

class MethodItem {
  final String text;
  final IconData icon;
  final Widget child;

  MethodItem({required this.text, required this.icon, required this.child});
}

class PagosTarjetaPage extends StatefulWidget {
  PagosTarjetaPage({
    Key? key,
    this.isTransferir = false,
    required this.precio,
  }) : super(key: key);
  bool isTransferir;
  double precio;

  @override
  _PagosTarjetaPageState createState() => _PagosTarjetaPageState();
}

class _PagosTarjetaPageState extends State<PagosTarjetaPage> {
  // PagosTarjetaController get self => controller;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String title = 'Recarga';

  FocusNode tarjetaFocusNode = FocusNode();
  TextEditingController tarjetaController = TextEditingController();
  FocusNode mesYanioFocusNode = FocusNode();
  TextEditingController mesYanioController = TextEditingController();
  FocusNode cvcFocusNode = FocusNode();
  TextEditingController cvcController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color.fromARGB(0, 244, 67, 54),
        body: Align(
          alignment: AlignmentDirectional(0, 1),
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).tertiary,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(0, -3),
                )
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Stack(
              children: [
                // Generated code for this IconButton Widget...
                Align(
                  alignment: AlignmentDirectional(0.88, -0.91),
                  child: FlutterFlowIconButton(
                    borderColor: FlutterFlowTheme.of(context).secondaryText,
                    borderRadius: 20,
                    borderWidth: 2,
                    buttonSize: 40,
                    fillColor: FlutterFlowTheme.of(context).tertiary,
                    icon: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pagar ${FormatNumber.formatNumberWithTwoDecimals(widget.precio)} €',
                        style: FlutterFlowTheme.of(context).headlineLarge,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TextFormField(
                            controller: tarjetaController,
                            focusNode: tarjetaFocusNode,
                            keyboardType: TextInputType.number,
                            maxLength: 19,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Número de Tarjeta de Crédito',
                              hintText: 'Número de Tarjeta de Crédito',
                              counterText: '',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF95A1AC),
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).lineColor,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
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
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              prefixIcon: Icon(
                                Icons.credit_card,
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            inputFormatters: [MaskedTextFormatter()],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 120,
                                  child: TextFormField(
                                    controller: mesYanioController,
                                    focusNode: mesYanioFocusNode,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'MM / YY',
                                      hintText: 'MM / YY',
                                      counterText: '',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF95A1AC),
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .lineColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    inputFormatters: [MaskedMesAndYear()],
                                  ),
                                ),
                                Container(
                                  width: 120,
                                  child: TextFormField(
                                    controller: cvcController,
                                    focusNode: cvcFocusNode,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'CVC',
                                      hintText: 'CVC',
                                      counterText: '',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            color: Color(0xFF95A1AC),
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .lineColor,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Flexible(
                        child: FFButtonWidget(
                          onPressed: () {
                            Get.dialog(RichAlertFlutterFlow(
                              alertType: RichAlertType.NONE,
                              alertTitle: title,
                              alertSubtitle: widget.isTransferir
                                  ? '¿Estas seguro de transferir del banco virtual?'
                                  : '¿Estas seguro de recargar el monedero virtual?',
                              textButton: title,
                              precio:
                                  '${FormatNumber.formatNumberWithTwoDecimals(widget.precio)} €',
                              onPressed: () {
                                if (widget.isTransferir) {
                                  setState(() {
                                    FFAppState().moneyBancoVirtual -=
                                        widget.precio;
                                  });
                                } else {
                                  setState(() {
                                    FFAppState().moneyMonederoVirtual +=
                                        widget.precio;
                                  });
                                }
                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                            ));
                          },
                          text:
                              'Pagar ${FormatNumber.formatNumberWithTwoDecimals(widget.precio)} €',
                          options: FFButtonOptions(
                            width: MediaQuery.sizeOf(context).width,
                            height: 55,
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            iconPadding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                            elevation: 2,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class MaskedTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    try {
      final notSpaces = newValue.text.removeAllWhitespace;
      int.parse(notSpaces);
      String spacesNumber = '';
      for (var i = 0; i < notSpaces.length; i++) {
        if (i % 4 == 0 && i > 0) {
          spacesNumber += ' ${notSpaces[i]}';
        } else {
          spacesNumber += notSpaces[i];
        }
      }
      return TextEditingValue(
        text: spacesNumber,
        selection: TextSelection.collapsed(offset: spacesNumber.length),
      );
    } catch (e) {
      return oldValue;
    }
  }
}

class MaskedMesAndYear extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    try {
      final notSpaces = newValue.text.removeAllWhitespace;
      int.parse(notSpaces);
      String spacesNumber = '';
      for (var i = 0; i < notSpaces.length; i++) {
        if (i % 2 == 0 && i > 0) {
          spacesNumber += ' ${notSpaces[i]}';
        } else {
          spacesNumber += notSpaces[i];
        }
      }
      return TextEditingValue(
        text: spacesNumber,
        selection: TextSelection.collapsed(offset: spacesNumber.length),
      );
    } catch (e) {
      return oldValue;
    }
  }
}
