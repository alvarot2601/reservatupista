
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './reserva_tu_pista_c.dart';


class ReservaTuPistaPage extends GetView<ReservaTuPistaController> {
  ReservaTuPistaController get self => controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReservaTuPistaPage'),
      ),
      body: SafeArea(
        child: Text('ReservaTuPistaController'),
      ),
    );
  }
}