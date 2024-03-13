
import 'package:get/get.dart';
import './login_profesional_c.dart';


class LoginProfesionalBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginProfesionalController>(() => LoginProfesionalController());
  }
}