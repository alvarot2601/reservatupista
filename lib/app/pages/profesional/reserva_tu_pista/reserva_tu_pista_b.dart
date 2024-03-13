
import 'package:get/get.dart';
import './reserva_tu_pista_c.dart';


class ReservaTuPistaBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReservaTuPistaController>(() => ReservaTuPistaController());
  }
}