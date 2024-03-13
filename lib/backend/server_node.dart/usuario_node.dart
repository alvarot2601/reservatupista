import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../app/routes/models/usuario_model.dart';
import 'datos_server.dart';

String getImageUsuarioNode(String fotoName) {
  return '${DatosServer().urlServer}/images_usuario/$fotoName.png';
}

Future<void> anadirUsuarioNode(List usuario) async {
  try {
    final url = Uri.parse('${DatosServer().urlServer}/usuario');
    // Crear una solicitud multipart
    print(usuario.toString());
    var request = http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "usuario": usuario,
        }));

    // Enviar la solicitud
    var response = await request;
    if (response.statusCode == 200) {
      print('usuario anadida correctamente');
    } else {
      // Manejar el caso en el que la carga no fue exitosa
      print(
          'Error al usuario anadida. Código de estado: ${response.statusCode}');
    }
  } catch (error) {
    print('Error al usuario anadida: $error');
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

Future<UsuarioModel?> getUsuarioNode(String id) async {
  try {
    final url = Uri.parse('${DatosServer().urlServer}/usuario');
    // Crear una solicitud multipart
    var request = http.get(url);

    // Enviar la solicitud
    var response = await request;
    if (response.statusCode == 200) {
      print(response.body == '{}');
      print('get datos usuario correctamente');
      return UsuarioModel.fromRawJson(response.body);
    } else {
      // Manejar el caso en el que la carga no fue exitosa
      print('Error al usuario hgvh. Código de estado: ${response.statusCode}');
    }
  } catch (error, stack) {
    print(stack);
    print('Error al usuario kjj: $error');
  }
  return null;
}
