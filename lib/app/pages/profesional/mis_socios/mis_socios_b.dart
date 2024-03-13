
import 'package:get/get.dart';
import './mis_socios_c.dart';


class MisSociosBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MisSociosController>(() => MisSociosController());
  }
}