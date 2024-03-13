import 'package:reservatu_pista/utils/animations/get_image.dart';
import '../../../components/navbar_y_appbar_usuario.dart';
import '../../../utils/server/image_server.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'mis_reservas_model.dart';
export 'mis_reservas_model.dart';

class MisReservasWidget extends StatefulWidget {
  const MisReservasWidget({Key? key}) : super(key: key);

  @override
  _MisReservasWidgetState createState() => _MisReservasWidgetState();
}

class _MisReservasWidgetState extends State<MisReservasWidget>
    with TickerProviderStateMixin {
  late MisReservasModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: Offset(50.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MisReservasModel());

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
      title: 'Mis Reservas',
      page: TypePage.MisReservas,
      child: Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  buildCard(TypeReserva.abierta),
                  buildCard(TypeReserva.cerrada),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(TypeReserva type) {
    Color color;
    String fecha = '';
    List<Widget> listaImagenes = [];

    switch (type) {
      case TypeReserva.cerrada:
        color = Colors.green;
        fecha = '30/01/2024 19:30 - 21:00';
        listaImagenes = List.generate(
            4,
            (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(35.0),
                        child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .secondary)),
                            child: ImageServer(
                              tipo: Tipo.usuario,
                              height: 32,
                              width: 32,
                            )),
                      ),
                      Text(
                        '4.00 €',
                        style: FlutterFlowTheme.of(context)
                            .bodySmall
                            .copyWith(fontSize: 10),
                      )
                    ],
                  ),
                ));
        break;
      case TypeReserva.abierta:
        color = const Color(0xFFFF8000);
        fecha = '30/01/2024 18:00 - 19:30';
        final listaDeImagenesPath = [
          ImageServer(
            tipo: Tipo.usuario,
            height: 32,
            width: 32,
          ),
          const CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 32,
          ),
          const CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 32,
          ),
          const CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 32,
          )
        ];
        listaImagenes = List.generate(
          4,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(35.0),
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: FlutterFlowTheme.of(context).secondary)),
                    width: 32.0,
                    height: 32.0,
                    child: listaDeImagenesPath[index],
                  ),
                ),
                Text(
                  '4.00 €',
                  style: FlutterFlowTheme.of(context)
                      .bodySmall
                      .copyWith(fontSize: 10),
                )
              ],
            ),
          ),
        );
        break;
      default:
        color = Colors.green;
        fecha = '30/01/2024 15:00 - 16:30';
        break;
    }
    return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(7.0, 5.0, 7.0, 5.0),
        child: Container(
          height: 110.0,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x230E151B),
                  offset: Offset(0.0, 2.0),
                )
              ],
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(color: color, width: 2)),
          child: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(10.0, 2.0, 0.0, 0.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(0.0),
                  ),
                  child: Image.asset(
                    'assets/images/logo_reservatupista.png',
                    width: 45.0,
                    height: 45.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 12.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Padel Bel',
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFF14181B),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'wv5tlwap' /* # 1 */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyLarge.override(
                                      fontFamily: 'Readex Pro',
                                      color: Color(0xFF14181B),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 4.0),
                            child: Text(
                              fecha,
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF57636C),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 4.0),
                            child: Text(
                              '16.00 €',
                              style: FlutterFlowTheme.of(context)
                                  .labelSmall
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: Color(0xFF57636C),
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(children: listaImagenes),
                          ),
                          Text(
                            'Tarjeta',
                            style: FlutterFlowTheme.of(context)
                                .labelSmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: Color(0xFF57636C),
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!));
  }
}

enum TypeReserva {
  cerrada,
  abierta,
}
