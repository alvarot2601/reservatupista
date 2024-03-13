import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/navbar_y_appbar_usuario.dart';
import './chat_c.dart';

class ChatPage extends GetView<ChatController> {
  ChatController get self => controller;
  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarUsuario(
      title: 'Chat',
      isTitleBack: true,
      child: Text(''),
      isNavBar: false,
    );
  }
}
