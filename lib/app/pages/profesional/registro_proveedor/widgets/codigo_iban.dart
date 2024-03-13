import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../flutter_flow/flutter_flow_theme.dart';
import '../registro_proveedor_c.dart';

class CodigoIban extends GetView<RegistroProveedorController> {
  RegistroProveedorController get self => controller;

  @override
  Widget build(BuildContext context) {
    final controllersCodigo = [
      TextEditingController(text: 'ES'),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
      TextEditingController()
    ];
    final focusNodeCodigo = [
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode(),
      FocusNode()
    ];
    final lengthTextField = [2, 2, 4, 4, 2, 10];
    final nombres = [
      'Código\nPais',
      'Digito\nControl\n¨IBAN¨',
      'Entidad',
      'Oficina',
      'Digito\ncontrol',
      'N° de cuenta'
    ];
    final title = ['', '', '', '', '', 'N° cuenta corriente completo'];
    final Map<int, FlexColumnWidth> columnWidth = {
      0: const FlexColumnWidth(0.7),
      1: const FlexColumnWidth(0.7),
      2: const FlexColumnWidth(0.8),
      3: const FlexColumnWidth(0.8),
      4: const FlexColumnWidth(0.7),
      5: const FlexColumnWidth(1.7),
    };
    final Map<int, FlexColumnWidth> columnWidthTitle = {
      0: const FlexColumnWidth(0.65),
      1: const FlexColumnWidth(0.65),
      2: const FlexColumnWidth(0.1),
      3: const FlexColumnWidth(0.1),
      4: const FlexColumnWidth(0.1),
      5: const FlexColumnWidth(1.7 + (0.8 * 3)),
    };
    return Column(
      children: [
        Table(columnWidths: columnWidthTitle, children: [
          TableRow(
              children: List.generate(
                  6,
                  (index) => Text(
                        title[index],
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.copyWith(
                              color: FlutterFlowTheme.of(context).accent1,
                            ),
                      ))),
        ]),
        Table(
          columnWidths: columnWidth,
          children: [
            TableRow(children: [
              ...List<Widget>.generate(6, (index) {
                if (index == 0) {
                  return buildInputIban(
                      context: context,
                      maxLength: lengthTextField[index],
                      textController: controllersCodigo[index],
                      focusNode: focusNodeCodigo[index],
                      onChanged: (value) {
                        if (value.length >= 2) {
                          // Cuando el usuario ingresa dos dígitos, cambiamos el enfoque al campo del año
                          focusNodeCodigo[1].requestFocus();
                        }
                      },
                      keyboardType: index > 0 ? TextInputType.number : null,
                      index: index);
                }
                if (index == 5) {
                  return buildInputIban(
                      context: context,
                      maxLength: lengthTextField[index],
                      textController: controllersCodigo[index],
                      focusNode: focusNodeCodigo[index],
                      // backFocusNode: focusNodeCodigo[4],
                      keyboardType: index > 0 ? TextInputType.number : null,
                      onChanged: (value) {
                        if (value.isEmpty) {
                          // Cuando el usuario borra el campo del año, cambiamos el enfoque al campo del mes
                          focusNodeCodigo[4].requestFocus();
                        }
                      },
                      index: index);
                }
                return buildInputIban(
                    context: context,
                    maxLength: lengthTextField[index],
                    textController: controllersCodigo[index],
                    focusNode: focusNodeCodigo[index],
                    keyboardType: index > 0 ? TextInputType.number : null,
                    onChanged: (value) {
                      if (value.length >= lengthTextField[index]) {
                        // Cuando el usuario ingresa dos dígitos, cambiamos el enfoque al campo del año
                        focusNodeCodigo[index + 1].requestFocus();
                      }

                      if (value.isEmpty) {
                        // Cuando el usuario borra el campo del año, cambiamos el enfoque al campo del mes
                        focusNodeCodigo[index - 1].requestFocus();
                      }
                    },
                    index: index);
              })
            ]),
            TableRow(
                children: List.generate(
                    6,
                    (index) => Text(
                          nombres[index],
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context).accent1,
                                    fontSize: 9,
                                  ),
                        )))
          ],
        ),
      ],
    );
  }

  Widget buildInputIban(
      {required BuildContext context,
      required int maxLength,
      TextInputType? keyboardType,
      required FocusNode focusNode,
      required TextEditingController textController,
      void Function(String)? onChanged,
      required int index}) {
    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      keyboardType: keyboardType,
      maxLength: maxLength,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelStyle: FlutterFlowTheme.of(context).labelMedium,
        hintStyle: FlutterFlowTheme.of(context).labelMedium,
        counterText: '',
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(160, 70, 239, 152),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF46EF98),
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
        contentPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      ),
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Readex Pro',
            color: FlutterFlowTheme.of(context).primaryText,
          ),
      textAlign: TextAlign.center,
      validator: (val) {
        if (val!.length < maxLength) {
          return '';
        } else {
          self.listCodigoIban[index] = val;
          return null;
        }
      },
    );
  }
}
