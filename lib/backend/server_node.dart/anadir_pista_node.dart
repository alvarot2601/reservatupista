import 'dart:convert';
import 'package:http/http.dart' as http;

import 'datos_server.dart';

Future<void> anadirPistaNode(List pistas, List tarifas) async {
  final url = Uri.parse('${DatosServer().urlServer}/pista');
  // Crear una solicitud multipart
  var request = http.post(url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "pista": pistas,
        "tarifas": tarifas,
        "localidad": "Riolobos",
      }));

  // Enviar la solicitud
  try {
    var response = await request;
    if (response.statusCode == 200) {
      print('pista anadida correctamente');
    } else {
      // Manejar el caso en el que la carga no fue exitosa
      print('Error al pista anadida. Código de estado: ${response.statusCode}');
    }
  } catch (error) {
    print('Error al pista anadida: $error');
  }
}
