import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/navbar_y_appbar_profesional.dart';
import './chat_proveedor_c.dart';

class ChatProveedorPage extends GetView<ChatProveedorController> {
  ChatProveedorController get self => controller;
  @override
  Widget build(BuildContext context) {
    return const NavbarYAppbarProfesional(
      title: 'Chat Proveedor',
      isTitleBack: true,
      child: SizedBox(),
    );
  }
}
