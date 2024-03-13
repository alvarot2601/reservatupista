import 'dart:convert';
import 'package:http/http.dart' as http;

class Direccion {
  final String localidad;
  final String comunidad;
  final String provincia;
  Direccion(
      {required this.localidad,
      required this.provincia,
      required this.comunidad});
}

/// Obtener la direccion mediante el codigo postal.
Future<Direccion?> getDireccion(String codigopostal) async {
  final url =
      'https://nominatim.openstreetmap.org/search?format=json&postalcode=${codigopostal}';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final decoded = json.decode(response.body);
    for (var _ in decoded) {
      final displayName = _['display_name'];
      final displayNameSplit = displayName.split(', ');
      final isEspana =
          displayNameSplit[displayNameSplit.length - 1] == 'España';
      if (isEspana) {
        final localidad = displayNameSplit[0];
        final comunidad = displayNameSplit[3];
        final provincia = displayNameSplit[4];
        return Direccion(
            localidad: localidad, comunidad: comunidad, provincia: provincia);
      }
    }
    return null;
  } else {
    return null;
  }
}
