
import 'package:get/get.dart';
import './olvide_contrasena_c.dart';


class OlvideContrasenaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OlvideContrasenaController>(() => OlvideContrasenaController());
  }
}