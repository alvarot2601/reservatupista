import 'package:reservatu_pista/utils/sizer.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
export 'tarifas_model.dart';

class ClonarDias extends StatefulWidget {
  const ClonarDias({super.key, required this.indexDias});
  final int indexDias;

  @override
  State<ClonarDias> createState() => _ClonarDiasState();
}

class _ClonarDiasState extends State<ClonarDias> {
  List<bool> selectedDias = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
    final List<String> diasSelect = ['L', 'M', 'X', 'J', 'V', 'S', 'D'];
    context.watch<FFAppState>();
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => Navigator.pop(context),
        child: SizedBox(
            height: MediaQuery.sizeOf(context).height - 190,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(
              children: [
                Positioned(
                    bottom: 0,
                    child: InkWell(
                      onTap: () => {},
                      child: Container(
                        color: const Color.fromARGB(139, 255, 255, 255),
                        child: Column(
                          children: [
                            20.0.sh,
                            Row(
                              children: List.generate(
                                diasSelect.length,
                                (index) => widget.indexDias == index
                                    ? const SizedBox.shrink()
                                    : Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: FFButtonWidget(
                                          onPressed: () => setState(
                                            () {
                                              setState(() {
                                                selectedDias[index] =
                                                    !selectedDias[index];
                                              });
                                            },
                                          ),
                                          text: diasSelect[index],
                                          options: FFButtonOptions(
                                            width: 40.0,
                                            height: 40.0,
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: selectedDias[index]
                                                ? const Color(0xFF46EF98)
                                                : FlutterFlowTheme.of(context)
                                                    .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: Colors.white,
                                                      fontSize: 12.0,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                          ),
                                        ),
                                      ),
                              ),
                            ),
                            20.0.sh,
                            SizedBox(
                              width: 100.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FFButtonWidget(
                                      onPressed: () {
                                        final newLista = FFAppState()
                                            .listaTarifas[widget.indexDias];
                                        final List<Tarifa>
                                            reacomodarlosvalores = [];
                                        for (var element in newLista) {
                                          reacomodarlosvalores.add(Tarifa(
                                            clases: element.clases,
                                            disponible: element.disponible,
                                            fecha: element.fecha,
                                            horaInicio: element.horaInicio,
                                            precioConLuzNoSocio:
                                                element.precioConLuzNoSocio,
                                            precioConLuzSocio:
                                                element.precioConLuzSocio,
                                            precioSinLuzNoSocio:
                                                element.precioSinLuzNoSocio,
                                            precioSinLuzSocio:
                                                element.precioSinLuzSocio,
                                          ));
                                        }
                                        setState(() {
                                          for (var i = 0;
                                              i < selectedDias.length;
                                              i++) {
                                            if (selectedDias[i]) {
                                              FFAppState().listaTarifas[i] =
                                                  reacomodarlosvalores;
                                            }
                                          }
                                        });
                                        Navigator.pop(context);
                                      },
                                      text: '  Copiar  ',
                                      options: const FFButtonOptions(
                                          color: Colors.green)),
                                  FFButtonWidget(
                                      onPressed: () {
                                        setState(() {
                                          selectedDias = selectedDias
                                              .map((e) => false)
                                              .toList();
                                        });
                                      },
                                      text: '  Borrar  ',
                                      options: const FFButtonOptions(
                                          color: Colors.red)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                //   Positioned(
                //       bottom: 0,
                //       left: 50,
                //       child: Container(
                //           child: Row(
                //         children: List.generate(
                //           diasSelect.length,
                //           (index) => widget.indexDias == index
                //               ? SizedBox.shrink()
                //               : Padding(
                //                   padding: const EdgeInsets.all(2.0),
                //                   child: FFButtonWidget(
                //                     onPressed: () => setState(
                //                       () {
                //                         // FFAppState().listaTarifas[index] =
                //                         //     FFAppState()
                //                         //         .listaTarifas[widget.indexDias];
                //                         setState(() {
                //                           selectedDias[index] =
                //                               !selectedDias[index];
                //                         });
                //                         // Navigator.pop(context);
                //                       },
                //                     ),
                //                     text: diasSelect[index],
                //                     options: FFButtonOptions(
                //                       width: 40.0,
                //                       height: 40.0,
                //                       padding: EdgeInsetsDirectional.fromSTEB(
                //                           0.0, 0.0, 0.0, 0.0),
                //                       iconPadding: EdgeInsetsDirectional.fromSTEB(
                //                           0.0, 0.0, 0.0, 0.0),
                //                       color: selectedDias[index]
                //                           ? Color(0xFF46EF98)
                //                           : FlutterFlowTheme.of(context).primary,
                //                       textStyle: FlutterFlowTheme.of(context)
                //                           .titleSmall
                //                           .override(
                //                             fontFamily: 'Readex Pro',
                //                             color: Colors.white,
                //                             fontSize: 12.0,
                //                           ),
                //                       elevation: 3.0,
                //                       borderSide: BorderSide(
                //                         color: Colors.transparent,
                //                         width: 1.0,
                //                       ),
                //                       borderRadius: BorderRadius.circular(24.0),
                //                     ),
                //                   ),
                //                 ),
                //         ),
                //       )))
              ],
            )),
      ),
    );
  }
}
