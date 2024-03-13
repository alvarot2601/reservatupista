
import 'package:get/get.dart';
import './prueba_proveedor_c.dart';


class PruebaProveedorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PruebaProveedorController>(() => PruebaProveedorController());
  }
}