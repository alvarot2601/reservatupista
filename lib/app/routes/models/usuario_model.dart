import 'dart:convert';

class UsuarioModel {
  int idUsuario;
  String nombre;
  String apellidos;
  String sexo;
  String dni;
  String lada;
  String telefono;
  String email;
  String empadronamiento;
  String comunidadDeVecinos;
  String direccion;
  int codigoPostal;
  String localidad;
  String provincia;
  String comunidad;
  String nick;
  String nivel;
  String posicion;
  String marcaPala;
  String modeloPala;
  String juegosSemana;
  String foto;
  DateTime fechaRegistro;

  UsuarioModel({
    required this.idUsuario,
    required this.nombre,
    required this.apellidos,
    required this.sexo,
    required this.dni,
    required this.lada,
    required this.telefono,
    required this.email,
    required this.empadronamiento,
    required this.comunidadDeVecinos,
    required this.direccion,
    required this.codigoPostal,
    required this.localidad,
    required this.provincia,
    required this.comunidad,
    required this.nick,
    required this.nivel,
    required this.posicion,
    required this.marcaPala,
    required this.modeloPala,
    required this.juegosSemana,
    required this.foto,
    required this.fechaRegistro,
  });

  factory UsuarioModel.fromRawJson(String str) =>
      UsuarioModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        idUsuario: json["id_usuario"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        sexo: json["sexo"],
        dni: json["DNI"],
        lada: json["lada"],
        telefono: json["telefono"],
        email: json["email"],
        empadronamiento: json["empadronamiento"],
        comunidadDeVecinos: json["comunidad_de_vecinos"],
        direccion: json["direccion"],
        codigoPostal: json["codigo_postal"],
        localidad: json["localidad"],
        provincia: json["provincia"],
        comunidad: json["comunidad"],
        nick: json["nick"],
        nivel: json["nivel"],
        posicion: json["posicion"],
        marcaPala: json["marca_pala"],
        modeloPala: json["modelo_pala"],
        juegosSemana: json["juegos_semana"],
        foto: json["foto"],
        fechaRegistro: DateTime.parse(json["fecha_registro"]),
      );

  Map<String, dynamic> toJson() => {
        "id_usuario": idUsuario,
        "nombre": nombre,
        "apellidos": apellidos,
        "sexo": sexo,
        "DNI": dni,
        "lada": lada,
        "telefono": telefono,
        "email": email,
        "empadronamiento": empadronamiento,
        "comunidad_de_vecinos": comunidadDeVecinos,
        "direccion": direccion,
        "codigo_postal": codigoPostal,
        "localidad": localidad,
        "provincia": provincia,
        "nick": nick,
        "nivel": nivel,
        "posicion": posicion,
        "marca_pala": marcaPala,
        "modelo_pala": modeloPala,
        "juegos_semana": juegosSemana,
        "foto": foto,
        "fecha_registro": fechaRegistro.toIso8601String(),
      };
}
