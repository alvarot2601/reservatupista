
import 'package:get/get.dart';
import './chat_proveedor_c.dart';


class ChatProveedorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatProveedorController>(() => ChatProveedorController());
  }
}