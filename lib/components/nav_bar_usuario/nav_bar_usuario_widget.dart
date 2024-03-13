import 'package:get/route_manager.dart';
import '../../app/routes/app_pages.dart';
import '../../utils/btn_icon.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'nav_bar_usuario_model.dart';
export 'nav_bar_usuario_model.dart';

class NavBarUsuarioWidget extends StatefulWidget {
  const NavBarUsuarioWidget({
    Key? key,
    required this.tipoDePagina,
  }) : super(key: key);

  final TypePage? tipoDePagina;

  @override
  _NavBarUsuarioWidgetState createState() => _NavBarUsuarioWidgetState();
}

class _NavBarUsuarioWidgetState extends State<NavBarUsuarioWidget>
    with TickerProviderStateMixin {
  late NavBarUsuarioModel _model;

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
          begin: Offset(0.0, -17.0),
          end: Offset(0.0, 0.0),
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
    _model = createModel(context, () => NavBarUsuarioModel());

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
    return Container(
      width: double.infinity,
      height: 65.0,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
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
                  Get.toNamed(Routes.INICIO);
                },
                isPage: widget.tipoDePagina == TypePage.Inicio,
                icon: Icons.home_rounded,
                title: FFLocalizations.of(context).getText(
                  'x6w02hml' /* Inicio */,
                ),
              ),
              buildIconButtonMin(
                onPressed: () async {
                  Get.offNamed(Routes.MISRESERVAS);
                },
                isPage: widget.tipoDePagina == TypePage.MisReservas,
                icon: Icons.calendar_month,
                title: 'Mis Reservas',
              ),
              buildIconCenter(
                onPressed: () async {
                  Get.offNamed(Routes.RESERVAR_PISTA);
                },
                isPage: widget.tipoDePagina == TypePage.ReservarPista,
                icon: Icons.add,
                title: 'Reservar Pista',
              ),
              buildIconButtonMin(
                onPressed: () async {
                  Get.offNamed(Routes.MONEDEROVIRTUAL);
                },
                isPage: widget.tipoDePagina == TypePage.MonederoVirtual,
                icon: Icons.credit_card,
                title: 'Monedero Virtual',
              ),
              buildIconButtonMin(
                onPressed: () async {
                  Get.offNamed(Routes.PERFIL);
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
      padding: EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          isPage
              ? FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 25.0,
                  borderWidth: 1.0,
                  buttonSize: 45.0,
                  fillColor: FlutterFlowTheme.of(context).primary,
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: onPressed,
                ).animateOnPageLoad(
                  animationsMap['iconButtonOnPageLoadAnimation1']!)
              : FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 25.0,
                  borderWidth: 1.0,
                  buttonSize: 45.0,
                  fillColor: Color(0xFF9299A1),
                  icon: Icon(
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
                      ? FlutterFlowTheme.of(context).primary
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
      padding: EdgeInsetsDirectional.only(top: 10),
      child: BtnIcon(
        onPressed: onPressed,
        hoverColor: Color.fromARGB(69, 43, 120, 220),
        borderRadius: 12,
        icon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            isPage
                ? Icon(
                    icon,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 24.0,
                  ).animateOnPageLoad(
                    animationsMap['iconButtonOnPageLoadAnimation1']!)
                : Icon(
                    icon,
                    color: Color(0xFF9299A1),
                    size: 24.0,
                  ),
            Text(
              title,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: isPage
                        ? FlutterFlowTheme.of(context).primary
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
