
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './prueba_proveedor_c.dart';


class PruebaProveedorPage extends GetView<PruebaProveedorController> {
  PruebaProveedorController get self => controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PruebaProveedorPage'),
      ),
      body: SafeArea(
        child: Text('PruebaProveedorController'),
      ),
    );
  }
}