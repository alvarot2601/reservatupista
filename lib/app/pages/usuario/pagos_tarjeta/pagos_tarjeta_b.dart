import 'package:get/get.dart';
import './pagos_tarjeta_c.dart';

class PagosTarjetaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PagosTarjetaController>(() => PagosTarjetaController());
  }
}
