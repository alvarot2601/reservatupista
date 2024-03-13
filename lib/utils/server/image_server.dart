import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/routes/database.dart';
import '../../backend/server_node.dart/proveedor_node.dart';
import '../../backend/server_node.dart/usuario_node.dart';

enum Tipo {
  usuario,
  proveedor,
}

class ImageServer extends StatelessWidget {
  ImageServer({
    super.key,
    this.width,
    this.height,
    this.fit,
    required this.tipo,
  });
  final Tipo tipo;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final DatabaseController db = Get.find();

  @override
  Widget build(BuildContext context) {
    return Image.network(
      tipo == Tipo.usuario
          ? getImageUsuarioNode(db.datosUsuario!.foto)
          : getImageProveedorNode(db.datosProveedor!.foto),
      width: width ?? 100.0,
      height: height ?? 100.0,
      fit: fit ?? BoxFit.cover,
    );
  }
}
