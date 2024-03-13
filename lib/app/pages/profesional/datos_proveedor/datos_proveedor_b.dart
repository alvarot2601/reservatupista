
import 'package:get/get.dart';
import './datos_proveedor_c.dart';


class DatosProveedorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DatosProveedorController>(() => DatosProveedorController());
  }
}