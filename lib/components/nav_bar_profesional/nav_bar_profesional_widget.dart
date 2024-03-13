import 'package:get/route_manager.dart';

import '../../app/routes/app_pages.dart';
import '../../utils/btn_icon.dart';
import '../../utils/colores.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'nav_bar_profesional_model.dart';
export 'nav_bar_profesional_model.dart';

class NavBarProfesionalWidget extends StatefulWidget {
  const NavBarProfesionalWidget({
    super.key,
    required this.tipoDePagina,
  });

  final TypePage tipoDePagina;

  @override
  // ignore: library_private_types_in_public_api
  _NavBarProfesionalWidgetState createState() =>
      _NavBarProfesionalWidgetState();
}

class _NavBarProfesionalWidgetState extends State<NavBarProfesionalWidget>
    with TickerProviderStateMixin {
  late NavBarProfesionalModel _model;

  final animationsMap = {
    'iconButtonOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 1.ms),
        FadeEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 550.ms,
          begin: 0.155,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 0.ms,
          duration: 550.ms,
          begin: const Offset(0.0, -17.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarProfesionalModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return SizedBox(
      width: double.infinity,
      height: 65.0,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Material(
                color: Colors.transparent,
                elevation: 0.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  width: double.infinity,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10.0,
                        color: Color(0x1A57636C),
                        offset: Offset(0.0, -10.0),
                        spreadRadius: 0.1,
                      )
                    ],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              buildIconButtonMin(
                onPressed: () async {
                  Get.toNamed(Routes.INICIOPROFESIONAL);
                },
                isPage: widget.tipoDePagina == TypePage.Inicio,
                icon: Icons.home_rounded,
                title: FFLocalizations.of(context).getText(
                  'x6w02hml' /* Inicio */,
                ),
              ),
              buildIconButtonMin(
                onPressed: () async {
                  Get.offNamed(Routes.MIS_PISTAS);
                },
                isPage: widget.tipoDePagina == TypePage.MisReservas,
                icon: Icons.calendar_month,
                title: 'Mis Pistas',
              ),
              buildIconCenter(
                onPressed: () async {
                  Get.offNamed(Routes.ANADIRPISTA);
                },
                isPage: widget.tipoDePagina == TypePage.ReservarPista,
                icon: Icons.add,
                title: 'Añadir Pista',
              ),
              buildIconButtonMin(
                onPressed: () async {
                  Get.offNamed(Routes.MIS_SOCIOS);
                },
                isPage: widget.tipoDePagina == TypePage.MonederoVirtual,
                icon: Icons.safety_divider,
                title: 'Mis Socios',
              ),
              buildIconButtonMin(
                onPressed: () async {
                  Get.offNamed(Routes.PERFILPROFESIONAL);
                },
                isPage: widget.tipoDePagina == TypePage.Perfil,
                icon: Icons.person,
                title: 'Perfil',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildIconCenter(
      {required String title,
      required IconData icon,
      required void Function() onPressed,
      isPage = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          isPage
              ? FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 25.0,
                  borderWidth: 1.0,
                  buttonSize: 45.0,
                  fillColor: Colores().proveedor.primary,
                  hoverColor: Colores().proveedor.primary69,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: onPressed,
                ).animateOnPageLoad(
                  animationsMap['iconButtonOnPageLoadAnimation1']!)
              : BtnIcon(
                  borderColor: Colors.transparent,
                  borderRadius: 25.0,
                  hoverColor: Colores().proveedor.primary69,
                  borderWidth: 1.0,
                  buttonSize: 45.0,
                  fillColor: const Color(0xFF9299A1),
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: onPressed,
                ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Readex Pro',
                  color: isPage
                      ? Colores().proveedor.primary
                      : FlutterFlowTheme.of(context).primaryText,
                  fontSize: 10.0,
                ),
          ),
        ],
      ),
    );
  }

  Widget buildIconButtonMin(
      {required String title,
      required IconData icon,
      required void Function() onPressed,
      isPage = false}) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 10),
      child: BtnIcon(
        onPressed: onPressed,
        hoverColor: Colores().proveedor.primary69,
        borderRadius: 12,
        icon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            isPage
                ? Icon(
                    icon,
                    color: Colores().proveedor.primary,
                    size: 24.0,
                  ).animateOnPageLoad(
                    animationsMap['iconButtonOnPageLoadAnimation1']!)
                : Icon(
                    icon,
                    color: const Color(0xFF9299A1),
                    size: 24.0,
                  ),
            Text(
              title,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: isPage
                        ? Colores().proveedor.primary
                        : FlutterFlowTheme.of(context).primaryText,
                    fontSize: 10.0,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
