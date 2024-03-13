import 'package:http/http.dart' as http;
import 'datos_server.dart';

extension on String {
  bool toBool() {
    return (toLowerCase() == "true" || toLowerCase() == "1")
        ? true
        : (toLowerCase() == "false" || toLowerCase() == "0" ? false : false);
  }
}

Future<bool> getUsuarioExisteNick(String nick) async {
  final url = Uri.parse('${DatosServer().urlServer}/usuario_existe_nick');
  // Crear una solicitud multipart
  var request = http.get(url, headers: {'nick': nick});

  // Enviar la solicitud
  try {
    var response = await request;
    if (response.statusCode == 200) {
      print(response.body);
      return !response.body.toBool();
    } else {
      // Manejar el caso en el que la carga no fue exitosa
      print(
          'Error al saber si el usuario existe. Código de estado: ${response.statusCode}');
      return false;
    }
  } catch (error, stack) {
    print('Error al saber si el usuario existe: $error');
    print(stack);
    return false;
  }
}
