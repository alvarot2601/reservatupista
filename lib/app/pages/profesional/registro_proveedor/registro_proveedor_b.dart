
import 'package:get/get.dart';
import './registro_proveedor_c.dart';


class RegistroProveedorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistroProveedorController>(() => RegistroProveedorController());
  }
}