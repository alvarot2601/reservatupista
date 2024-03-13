import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../utils/btn_icon.dart';
import '/flutter_flow/flutter_flow_theme.dart';

/// A Page view sliding indicator.
class PageViewSlidingIndicator extends StatefulWidget {
  final PageController controller;
  final int? pageCount;
  final Color color;
  final double size;
  final double widthButtons;
  final double borderRadius;

  PageViewSlidingIndicator({
    required this.controller,
    required this.widthButtons,
    this.pageCount,
    this.color = const Color(0xff278fff),
    this.borderRadius = 2,
    this.size = 8,
  });

  @override
  _PageViewSlidingIndicatorState createState() =>
      _PageViewSlidingIndicatorState();
}

class _PageViewSlidingIndicatorState extends State<PageViewSlidingIndicator> {
  late double _leftPosition;
  late Color? _currentColor;
  late Color? _currentColorTextUsuario;
  late Color? _currentColorTextProveedor;
  final double sizeText = 24;
  late BorderRadius _getBorder;

  @override
  void initState() {
    super.initState();
    _leftPosition = 0;
    _currentColor = FlutterFlowTheme.of(context).primary;
    _currentColorTextUsuario = Colors.white;
    _currentColorTextProveedor = Colors.black;
    _getBorder = const BorderRadius.only(
        topLeft: Radius.circular(10), bottomLeft: Radius.circular(10));
    if (widget.controller.initialPage == 1) {
      _leftPosition = widget.widthButtons;
      _currentColor = FlutterFlowTheme.of(context).btnGeneral;
      _currentColorTextUsuario = Colors.black;
      _currentColorTextProveedor = Colors.white;
      _getBorder = const BorderRadius.only(
          topRight: Radius.circular(10), bottomRight: Radius.circular(10));
    }
    widget.controller.addListener(() {
      if (widget.controller.page != null) {
        setState(() {
          _leftPosition = (widget.controller.page! * (widget.widthButtons));
          // Utiliza un Tween para cambiar de azul a verde
          ColorTween colorTween = ColorTween(
              begin: FlutterFlowTheme.of(context).primary,
              end: FlutterFlowTheme.of(context).btnGeneral);
          ColorTween colorTextUsuario = ColorTween(
            begin: Colors.white,
            end: Colors.black,
          );
          ColorTween colorTextProfesional = ColorTween(
            begin: Colors.black,
            end: Colors.white,
          );
          _currentColor =
              colorTween.transform((widget.controller.page ?? 0) % 1);
          _currentColorTextUsuario =
              colorTextUsuario.transform((widget.controller.page ?? 0) % 1);
          _currentColorTextProveedor =
              colorTextProfesional.transform((widget.controller.page ?? 0) % 1);
          _getBorder = BorderRadius.circular(10);
          if (widget.controller.page! == 1) {
            _currentColor = FlutterFlowTheme.of(context).btnGeneral;
            _currentColorTextUsuario = Colors.black;
            _currentColorTextProveedor = Colors.white;
            _getBorder = const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10));
          }
          if (widget.controller.page! == 0) {
            _getBorder = const BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10));
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
      child: Container(
        width: widget.widthButtons * 2,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F4F8),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFFB2B4B7),
            width: 1,
          ),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              top: 0,
              bottom: 0,
              left: _leftPosition,
              duration: const Duration(milliseconds: 100),
              child: Container(
                width: widget.widthButtons - 2,
                decoration: BoxDecoration(
                  color: _currentColor,
                  borderRadius: _getBorder,
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: widget.widthButtons - 2,
                  height: 50,
                  child: BtnIcon(
                    borderRadius: 10,
                    onPressed: () async {
                      widget.controller.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    padding: const EdgeInsets.only(bottom: 2),
                    icon: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: _currentColorTextUsuario,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Usuario',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Outfit',
                                    color: _currentColorTextUsuario,
                                    fontSize: sizeText,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: 2,
                  color: const Color(0xFFB2B4B7),
                ),
                SizedBox(
                  width: widget.widthButtons - 2,
                  height: 80,
                  child: BtnIcon(
                    borderRadius: 10,
                    onPressed: () async {
                      widget.controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    padding: const EdgeInsets.only(bottom: 2),
                    icon: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.solidAddressCard,
                          color: _currentColorTextProveedor,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Proveedor',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Outfit',
                                    color: _currentColorTextProveedor,
                                    fontSize: sizeText,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
