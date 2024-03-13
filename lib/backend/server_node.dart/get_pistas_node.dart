import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../app/routes/models/pistas_model.dart';
import 'datos_server.dart';

Future<List<PistasModel>> getPistas() async {
  final url = Uri.parse('${DatosServer().urlServer}/mis_pistas');
  // Crear una solicitud multipart
  var request = http.get(url);

  // Enviar la solicitud
  try {
    var response = await request;
    if (response.statusCode == 200) {
      print(response.body);
      final newList = ListPistas.fromRawList(response.body);
      print(newList.toRawList());
      return newList.listPistas;
    } else {
      // Manejar el caso en el que la carga no fue exitosa
      print('Error al pista anadida. Código de estado: ${response.statusCode}');
      return [];
    }
  } catch (error, stack) {
    print('Error al pista anadida: $error');
    print(stack);
    return [];
  }
}
// Signo mas
// Por lo menos que salga la primera cabeza