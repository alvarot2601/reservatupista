import 'package:reservatu_pista/utils/btn_icon.dart';

import '../../../utils/animations/add_animation_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/sizer.dart';
import 'seleccionar_imagen_model.dart';
export 'seleccionar_imagen_model.dart';

class SeleccionarImagenWidget extends StatelessWidget {
  SeleccionarImagenWidget(
      {Key? key,
      this.camera,
      this.galeria,
      this.imageLocal,
      this.isProveedor = false})
      : super(key: key);
  final void Function()? camera;
  final void Function()? galeria;
  final void Function(String)? imageLocal;
  final bool isProveedor;
  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    SeleccionarImagenModel _model =
        createModel(context, () => SeleccionarImagenModel());
    final listaIcons = [
      [
        'icon_sport_padel',
        'icon_sport_sports_women',
        'icon_sport_sports_men',
      ],
      [
        'icon_sport_baseball',
        'icon_sport_basketball',
        'icon_sport_football',
      ],
      [
        'icon_sport_rugby',
        'icon_sport_sports_bottle',
        'icon_sport_swimming',
      ],
      [
        'icon_sport_table_tennis',
        'icon_sport_tennis',
        'icon_sport_trophy',
      ],
      ['icon_sport_wistle', '', '']
    ];
    Widget buildListIcons() {
      return Expanded(
        child: SingleChildScrollView(
          child: Column(
              children: List.generate(
            listaIcons.length,
            (i) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (j) => listaIcons[i][j] == ''
                      ? SizedBox()
                      : BtnIcon(
                          onPressed: () => imageLocal!(listaIcons[i][j]),
                          padding: EdgeInsets.all(0),
                          borderColor: Color.fromARGB(255, 226, 6, 255),
                          borderWidth: 3,
                          borderRadius: 30,
                          hoverColor: Color.fromARGB(255, 226, 6, 255),
                          icon: Image.asset(
                              'assets/images/${listaIcons[i][j]}.png',
                              height: 30.w,
                              width: 30.w),
                        ),
                ).divide(5.0.sw)),
          ).divide(10.0.sh)),
        ),
      );
    }

    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: AddAnimationWidget(
              height: isProveedor ? 350 : 50.h,
              child: Container(
                width: 100.w,
                height: isProveedor ? 350 : 100.h,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      color: Color(0x3B1D2429),
                      offset: Offset(0, -3),
                    )
                  ],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Elige la foto',
                        style: FlutterFlowTheme.of(context)
                            .titleLarge
                            .copyWith(decoration: TextDecoration.none),
                      ),
                      5.0.sh,
                      isProveedor ? 0.0.sh : buildListIcons(),
                      buildBtnsImage(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBtnsImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
            child: FFButtonWidget(
              onPressed: camera,
              text: 'Camara',
              icon: const Icon(
                Icons.camera_alt,
                size: 25,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: FlutterFlowTheme.of(context).primaryBackground,
                textStyle: FlutterFlowTheme.of(context).bodyLarge,
                elevation: 2,
                splashColor: const Color.fromARGB(65, 0, 0, 0),
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
            child: FFButtonWidget(
              onPressed: galeria,
              text: 'Galería',
              icon: const Icon(
                Icons.collections,
                size: 25,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 60,
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: FlutterFlowTheme.of(context).primaryBackground,
                textStyle: FlutterFlowTheme.of(context).bodyLarge,
                elevation: 2,
                splashColor: const Color.fromARGB(65, 0, 0, 0),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
            child: FFButtonWidget(
              onPressed: () async {
                Navigator.pop(context);
              },
              text: 'Cancel',
              options: FFButtonOptions(
                width: double.infinity,
                height: 60,
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                color: FlutterFlowTheme.of(context).redAccend1,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Lexend Deca',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                elevation: 0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
