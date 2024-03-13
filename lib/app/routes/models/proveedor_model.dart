import 'dart:convert';

class ProveedorModel {
  String tipo;
  String cifNif;
  String direccionFiscal;
  int codigoPostalFiscal;
  String localidadFiscal;
  String provinciaFiscal;
  String comunidadFiscal;
  String codigoIban;
  String certificadoCuenta;
  String nombre;
  String apellidos;
  String fijo;
  String email;
  String lada;
  String telefono;
  String nombreComercial;
  String direccion;
  int codigoPostal;
  String localidad;
  String provincia;
  String comunidad;
  String contrasena;
  String foto;
  DateTime fechaRegistro;

  ProveedorModel({
    required this.tipo,
    required this.cifNif,
    required this.direccionFiscal,
    required this.codigoPostalFiscal,
    required this.localidadFiscal,
    required this.provinciaFiscal,
    required this.comunidadFiscal,
    required this.codigoIban,
    required this.certificadoCuenta,
    required this.nombre,
    required this.apellidos,
    required this.fijo,
    required this.email,
    required this.lada,
    required this.telefono,
    required this.nombreComercial,
    required this.direccion,
    required this.codigoPostal,
    required this.localidad,
    required this.provincia,
    required this.comunidad,
    required this.contrasena,
    required this.foto,
    required this.fechaRegistro,
  });

  factory ProveedorModel.fromRawJson(String str) =>
      ProveedorModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProveedorModel.fromJson(Map<String, dynamic> json) => ProveedorModel(
        tipo: json["tipo"],
        cifNif: json["cif_nif"],
        direccionFiscal: json["direccion_fiscal"],
        codigoPostalFiscal: json["codigo_postal_fiscal"],
        localidadFiscal: json["localidad_fiscal"],
        provinciaFiscal: json["provincia_fiscal"],
        comunidadFiscal: json["comunidad_fiscal"],
        codigoIban: json["codigo_iban"],
        certificadoCuenta: json["certificado_cuenta"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        fijo: json["fijo"],
        email: json["email"],
        lada: json["lada"],
        telefono: json["telefono"],
        nombreComercial: json["nombre_comercial"],
        direccion: json["direccion"],
        codigoPostal: json["codigo_postal"],
        localidad: json["localidad"],
        provincia: json["provincia"],
        comunidad: json["comunidad"],
        contrasena: json["contrasena"],
        foto: json["foto"],
        fechaRegistro: DateTime.parse(json["fecha_registro"]),
      );

  Map<String, dynamic> toJson() => {
        "tipo": tipo,
        "cif_nif": cifNif,
        "direccion_fiscal": direccionFiscal,
        "codigo_postal_fiscal": codigoPostalFiscal,
        "localidad_fiscal": localidadFiscal,
        "provincia_fiscal": provinciaFiscal,
        "comunidad_fiscal": comunidadFiscal,
        "codigo_iban": codigoIban,
        "certificado_cuenta": certificadoCuenta,
        "nombre": nombre,
        "apellidos": apellidos,
        "fijo": fijo,
        "email": email,
        "lada": lada,
        "telefono": telefono,
        "nombre_comercial": nombreComercial,
        "direccion": direccion,
        "codigo_postal": codigoPostal,
        "localidad": localidad,
        "provincia": provincia,
        "comunidad": comunidad,
        "contrasena": contrasena,
        "foto": foto,
        "fecha_registro": fechaRegistro.toIso8601String(),
      };
}
