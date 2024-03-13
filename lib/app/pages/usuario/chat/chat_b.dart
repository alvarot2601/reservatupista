
import 'package:get/get.dart';
import './chat_c.dart';


class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }
}