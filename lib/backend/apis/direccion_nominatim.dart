import 'dart:convert';
import 'package:http/http.dart' as http;

class DireccionNominatim {
  final String localidad;
  final String comunidad;
  final String provincia;
  DireccionNominatim(
      {required this.localidad,
      required this.provincia,
      required this.comunidad});
}

/// Obtener la direccionNominatim mediante el codigo postal.
Future<DireccionNominatim?> getDireccionNominatim(String codigopostal) async {
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
        final localidad = displayNameSplit.length > 5
            ? displayNameSplit[1]
            : displayNameSplit[0];
        final provincia = displayNameSplit[displayNameSplit.length - 3];
        final comunidad = displayNameSplit[displayNameSplit.length - 2];
        return DireccionNominatim(
            localidad: localidad, comunidad: comunidad, provincia: provincia);
      }
    }
    return null;
  } else {
    return null;
  }
}
