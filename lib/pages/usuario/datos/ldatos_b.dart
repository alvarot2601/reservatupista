import 'package:get/get.dart';
import './datos_c.dart';

class DatosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DatosController>(() => DatosController());
  }
}
