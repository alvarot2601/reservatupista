import 'package:get/get.dart';
import './anadir_pista_c.dart';

class AnadirPistaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnadirPistaController>(() => AnadirPistaController());
  }
}
