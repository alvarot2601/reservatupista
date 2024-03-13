import 'dart:ui';

class Colores {
  final ColoresProveedor proveedor = ColoresProveedor();
  final ColoresUsuario usuario = ColoresUsuario();
  final Color rojo = const Color(0xFFF77066);
  final Color orange = const Color(0xFFFFA500);
  final Color grisClaro = const Color.fromRGBO(220, 220, 220, 1.0);
}

class ColoresProveedor {
  final Color primary = const Color(0xFF46EF98);
  final Color primary160 = const Color.fromARGB(160, 70, 239, 152);
  final Color primary69 = const Color.fromARGB(69, 70, 239, 152);
}

class ColoresUsuario {
  final Color primary = const Color.fromARGB(255, 43, 120, 220);
  final Color primary160 = const Color.fromARGB(160, 43, 120, 220);
  final Color primary69 = const Color.fromARGB(69, 43, 120, 220);
}
