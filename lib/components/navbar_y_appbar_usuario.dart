import 'package:reservatu_pista/components/nav_bar_usuario/nav_bar_usuario_widget.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'appbar_usuario.dart';

class NavbarYAppbarUsuario extends StatelessWidget {
  const NavbarYAppbarUsuario({
    super.key,
    required this.child,
    required this.title,
    this.page,
    this.isTitle = false,
    this.isTitleBack = false,
    this.isNavBar = true,
  });
  final String title;
  final bool isTitle;
  final bool isTitleBack;
  final Widget child;
  final TypePage? page;
  final bool isNavBar;
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
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              AppbarUsuario(
                  title: title, isTitle: isTitle, isTitleBack: isTitleBack),
              child,
            ],
          ),
        ),
        bottomNavigationBar: isNavBar
            ? NavBarUsuarioWidget(
                tipoDePagina: page,
              )
            : const SizedBox());
  }
}
