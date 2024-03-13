
import 'package:get/get.dart';
import './resultados_estadisticas_c.dart';


class ResultadosEstadisticasBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResultadosEstadisticasController>(() => ResultadosEstadisticasController());
  }
}