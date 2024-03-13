import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../app/routes/database.dart';
import '../../../app/widgets/terminos_condiciones.dart';
import '../../../backend/schema/enums/enums.dart';
import '../../../components/navbar_y_appbar_profesional.dart';
import '../../../utils/animations/get_image.dart';
import '../../../utils/btn_icon.dart';
import '../../../utils/colores.dart';
import '../../../utils/sizer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'perfil_profesional_model.dart';
export 'perfil_profesional_model.dart';

class PerfilProfesionalWidget extends StatefulWidget {
  const PerfilProfesionalWidget({Key? key}) : super(key: key);

  @override
  _PerfilProfesionalWidgetState createState() =>
      _PerfilProfesionalWidgetState();
}

class _PerfilProfesionalWidgetState extends State<PerfilProfesionalWidget> {
  late PerfilProfesionalModel _model;
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  final btnSize = GlobalKey<ScaffoldState>();
  final keyLogo = GlobalKey<ScaffoldState>();
  late DatabaseController db;
  @override
  void initState() {
    super.initState();
    db = Get.find();
    _model = createModel(context, () => PerfilProfesionalModel());
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
    final nameFoto = getImage(db.imageProveedor, isProveedor: true);
    return NavbarYAppbarProfesional(
        title: 'Perfil Proveedor',
        page: TypePage.Perfil,
        isTitle: true,
        child: 100.h <= 745
            ? buildColumnResponsive(nameFoto)
            : buildColumn(nameFoto));
  }

  Widget buildColumn(Widget nameFoto) {
    const sizeLogo = 122;
    const sizeBtns = 72 * 6;
    const sizeAppbar = 55;
    const sizeBtnCerrar = 45;
    const sizeNavBar = 65;
    const paddingBottom = 10;
    final sizeTotal = 100.h -
        (sizeLogo +
            sizeBtns +
            sizeAppbar +
            sizeBtnCerrar +
            sizeNavBar +
            paddingBottom);
    final spaceBtnCerrar = sizeTotal.sh;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          key: keyLogo,
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 3,
                color: Color(0x33000000),
                offset: Offset(0, 1),
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).tertiary,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colores().proveedor.primary,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: nameFoto,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _model.subtitle,
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        ButtonPerfil(
          title: _model.btn1Name,
          icon: Icons.credit_card,
          onPressed: () async {
            Get.toNamed(_model.btn1PushNamed);
          },
        ),
        ButtonPerfil(
          title: _model.btn2Name,
          icon: Icons.dehaze,
          onPressed: () async {
            Get.toNamed(_model.btn2PushNamed);
          },
        ),
        ButtonPerfil(
          title: 'Socio',
          icon: Icons.safety_divider,
          onPressed: () async {
            Get.toNamed(_model.socio);
          },
        ),
        ButtonPerfil(
          title: _model.btn3Name,
          icon: Icons.notifications_none,
          onPressed: () async {
            Get.toNamed(_model.btn3PushNamed);
          },
        ),
        ButtonPerfil(
          key: btnSize,
          title: _model.btn4Name,
          icon: Icons.privacy_tip_rounded,
          onPressed: () async {
            // Get.dialog(TermConditions());
            print(btnSize.currentContext!.size!.height.toString());
            print(keyLogo.currentContext!.size!.height.toString());
          },
        ),
        ButtonPerfil(
          title: 'Invitar a amigos',
          icon: Icons.ios_share,
          onPressed: () async {
            await Share.share(
              'https://reservatupista.com/',
            );
          },
        ),
        spaceBtnCerrar,
        btnCerrar()
      ],
    );
  }

  Widget buildColumnResponsive(Widget nameFoto) {
    const EdgeInsetsGeometry padding =
        EdgeInsets.symmetric(horizontal: 8, vertical: 2);
    const sizeLogo = 86;
    const sizeBtns = 60 * 6;
    const sizeAppbar = 55;
    const sizeBtnCerrar = 45;
    const sizeNavBar = 65;
    const paddingBottom = 10;
    final sizeTotal = 100.h -
        (sizeLogo +
            sizeBtns +
            sizeAppbar +
            sizeBtnCerrar +
            sizeNavBar +
            paddingBottom);
    final spaceBtnCerrar = sizeTotal <= 0 ? const SizedBox() : sizeTotal.sh;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          key: keyLogo,
          width: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: const [
              BoxShadow(
                blurRadius: 3,
                color: Color(0x33000000),
                offset: Offset(0, 1),
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).accent2,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).secondary,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: nameFoto,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _model.subtitle,
                        style: FlutterFlowTheme.of(context).headlineSmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        ButtonPerfil(
          title: _model.btn1Name,
          icon: Icons.credit_card,
          top: 10,
          height: 50,
          padding: padding,
          onPressed: () async {
            Get.toNamed(_model.btn1PushNamed);
          },
        ),
        ButtonPerfil(
          title: _model.btn2Name,
          icon: Icons.dehaze,
          top: 10,
          height: 50,
          padding: padding,
          onPressed: () async {
            Get.toNamed(_model.btn2PushNamed);
          },
        ),
        ButtonPerfil(
          title: 'Socio',
          icon: Icons.safety_divider,
          top: 10,
          height: 50,
          padding: padding,
          onPressed: () async {
            Get.toNamed(_model.socio);
          },
        ),
        ButtonPerfil(
          title: _model.btn3Name,
          icon: Icons.notifications_none,
          top: 10,
          height: 50,
          padding: padding,
          onPressed: () async {
            Get.toNamed(_model.btn3PushNamed);
          },
        ),
        ButtonPerfil(
          key: btnSize,
          title: _model.btn4Name,
          icon: Icons.privacy_tip_rounded,
          top: 10,
          height: 50,
          padding: padding,
          onPressed: () async {
            // Get.dialog(TermConditions());
            print(btnSize.currentContext!.size!.height.toString());
            print(keyLogo.currentContext!.size!.height.toString());
          },
        ),
        ButtonPerfil(
          title: 'Invitar a amigos',
          icon: Icons.ios_share,
          top: 10,
          height: 50,
          padding: padding,
          onPressed: () async {
            await Share.share(
              'https://reservatupista.com/',
            );
          },
        ),
        spaceBtnCerrar,
        btnCerrar()
      ],
    );
  }

  Widget btnCerrar() {
    return Container(
      width: 200,
      height: 45,
      decoration: BoxDecoration(
        color: const Color(0xFFF77066),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            color: Color(0x3416202A),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(12),
        shape: BoxShape.rectangle,
      ),
      child: BtnIcon(
        onPressed: () async {
          Get.offAllNamed(_model.btnCerrar, arguments: 1);
        },
        hoverColor: _model.hoverColor,
        borderRadius: 12,
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
              child: Text(
                'Cerrar Sesión',
                style: FlutterFlowTheme.of(context).bodyLarge,
              ),
            ),
            const Align(
              alignment: AlignmentDirectional(0.9, 0),
              child: Icon(
                Icons.logout,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum TypeIcon { svg, image, icon }

class ButtonPerfil extends StatelessWidget {
  ButtonPerfil(
      {super.key,
      required this.onPressed,
      required this.title,
      this.padding,
      this.typeIcon,
      this.top,
      this.pathAsset,
      this.height,
      this.icon});
  final void Function() onPressed;
  final Color hoverColor = Colores().proveedor.primary69;
  final String title;
  final IconData? icon;
  final TypeIcon? typeIcon;
  final String? pathAsset;
  final double? top;
  final double? height;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    final iconColor = Colores().proveedor.primary;
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16, top ?? 12, 16, 0),
      child: Container(
        width: double.infinity,
        height: height ?? 60,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Color(0x3416202A),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(12),
          shape: BoxShape.rectangle,
        ),
        child: BtnIcon(
          onPressed: onPressed,
          hoverColor: hoverColor,
          borderRadius: 12,
          icon: Padding(
            padding: padding ?? EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                buildIcon(context, iconColor),
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: Text(
                      title,
                      style: FlutterFlowTheme.of(context).bodyLarge,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.9, 0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIcon(BuildContext context, Color iconColor) {
    switch (typeIcon) {
      case TypeIcon.svg:
        return SvgPicture.asset(
          'assets/images/${pathAsset!}.svg',
          height: 26,
          width: 26,
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        );
      case TypeIcon.image:
        return Image.asset('assets/images/${pathAsset!}');
      default:
        return Icon(
          icon,
          color: iconColor,
          size: 24,
        );
    }
  }
}
