
import 'package:get/get.dart';
import './mis_pistas_c.dart';


class MisPistasBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MisPistasController>(() => MisPistasController());
  }
}