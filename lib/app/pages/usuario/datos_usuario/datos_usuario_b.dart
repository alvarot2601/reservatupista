
import 'package:get/get.dart';
import './datos_usuario_c.dart';


class DatosUsuarioBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DatosUsuarioController>(() => DatosUsuarioController());
  }
}