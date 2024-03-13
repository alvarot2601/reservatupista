import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../app/routes/models/proveedor_model.dart';
import 'datos_server.dart';

String getImageProveedorNode(String fotoName) {
  return '${DatosServer().urlServer}/images_proveedor/$fotoName.png?timestamp=${DateTime.now().millisecondsSinceEpoch}';
}

Future<void> anadirProveedorNode(List proveedor) async {
  try {
    final url = Uri.parse('${DatosServer().urlServer}/proveedor');
    print(proveedor.toString());
    var request = http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "proveedor": proveedor,
        }));

    // Enviar la solicitud
    var response = await request;
    if (response.statusCode == 200) {
      print('proveedor anadida correctamente');
    } else {
      // Manejar el caso en el que la carga no fue exitosa
      print(
          'Error al proveedor anadida. Código de estado: ${response.statusCode}');
    }
  } catch (error) {
    print('Error al proveedor anadida: $error');
  }
}

Future<void> modificarUsuarioNode(
    int id, List usuario, List<String> datosModificados) async {
  try {
    final url = Uri.parse('${DatosServer().urlServer}/usuario');
    // Crear una solicitud multipart
    print(usuario.toString());
    var request = http.put(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "id": id,
          "datosUsuario": usuario,
          "datosModificados": datosModificados
        }));

    // Enviar la solicitud
    var response = await request;
    if (response.statusCode == 200) {
      print('usuario modificado correctamente');
    } else {
      // Manejar el caso en el que la carga no fue exitosa
      print(
          'Error al usuario modificado. Código de estado: ${response.statusCode}');
    }
  } catch (error) {
    print('Error al usuario modificado: $error');
  }
}

Future<ProveedorModel?> getProveedorNode(String id) async {
  try {
    final url = Uri.parse('${DatosServer().urlServer}/proveedor');
    // Crear una solicitud multipart
    var request = http.get(url);

    // Enviar la solicitud
    var response = await request;
    if (response.statusCode == 200) {
      print(response.body == '{}');
      print('get datos Proveedor correctamente');
      return ProveedorModel.fromRawJson(response.body);
    } else {
      // Manejar el caso en el que la carga no fue exitosa
      print(
          'Error al Proveedor hgvh. Código de estado: ${response.statusCode}');
    }
  } catch (error, stack) {
    print(stack);
    print('Error al Proveedor kjj: $error');
  }
  return null;
}
