import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './resultados_estadisticas_c.dart';
import '../../../../components/navbar_y_appbar_usuario.dart';

class ResultadosEstadisticasPage
    extends GetView<ResultadosEstadisticasController> {
  ResultadosEstadisticasController get self => controller;
  @override
  Widget build(BuildContext context) {
    return const NavbarYAppbarUsuario(
      title: 'Resultados/Estadísticas',
      isTitleBack: true,
      child: SizedBox(),
      isNavBar: false,
    );
  }
}
