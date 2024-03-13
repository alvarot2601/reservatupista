import 'package:get/get.dart';
import './reservar_pista_c.dart';

class ReservarPistaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReservarPistaController>(() => ReservarPistaController());
  }
}
