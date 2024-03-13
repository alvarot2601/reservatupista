import 'package:get/get.dart';
import './registrar_usuario_c.dart';

class RegistrarUsuarioBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrarUsuarioController>(() => RegistrarUsuarioController());
  }
}
