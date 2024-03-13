import 'dart:convert';

class ListPistas {
  List<PistasModel> listPistas;
  ListPistas({required this.listPistas});
  factory ListPistas.fromRawList(String str) =>
      ListPistas.fromList(json.decode(str));
  factory ListPistas.fromList(List<dynamic> list) =>
      ListPistas(listPistas: list.map((e) => PistasModel.fromJson(e)).toList());
  String toRawList() => json.encode(listPistas.map((e) => e.toJson()).toList());
}

class PistasModel {
  int idPista;
  String deporte;
  int numPista;
  int techada;
  String iluminacion;
  String tipo;
  String cesped;
  int automatizada;
  int duracionPartida;
  String horaInicio;
  String horaFin;
  int tiempoReservaSocio;
  int tiempoCancelacionSocio;
  double precioLuzSocio;
  double precioSinLuzSocio;
  int tiempoReservaNoSocio;
  int tiempoCancelacionNoSocio;
  double precioLuzNoSocio;
  double precioSinLuzNoSocio;
  String descripcion;
  String nombrePatrocinador;
  String imagenPatrocinador;
  int vestuario;
  int duchas;
  String imagenesPista;

  PistasModel({
    required this.idPista,
    required this.deporte,
    required this.numPista,
    required this.techada,
    required this.iluminacion,
    required this.tipo,
    required this.cesped,
    required this.automatizada,
    required this.duracionPartida,
    required this.horaInicio,
    required this.horaFin,
    required this.tiempoReservaSocio,
    required this.tiempoCancelacionSocio,
    required this.precioLuzSocio,
    required this.precioSinLuzSocio,
    required this.tiempoReservaNoSocio,
    required this.tiempoCancelacionNoSocio,
    required this.precioLuzNoSocio,
    required this.precioSinLuzNoSocio,
    required this.descripcion,
    required this.nombrePatrocinador,
    required this.imagenPatrocinador,
    required this.vestuario,
    required this.duchas,
    required this.imagenesPista,
  });

  factory PistasModel.fromRawJson(String str) =>
      PistasModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PistasModel.fromJson(Map<String, dynamic> json) => PistasModel(
        idPista: json["id_pista"],
        deporte: json["deporte"],
        numPista: json["num_pista"],
        techada: json["techada"],
        iluminacion: json["iluminacion"],
        tipo: json["tipo"],
        cesped: json["cesped"],
        automatizada: json["automatizada"],
        duracionPartida: json["duracion_partida"],
        horaInicio: json["hora_inicio"],
        horaFin: json["hora_fin"],
        tiempoReservaSocio: json["tiempo_reserva_socio"],
        tiempoCancelacionSocio: json["tiempo_cancelacion_socio"],
        precioLuzSocio: json["precio_luz_socio"].toDouble(),
        precioSinLuzSocio: json["precio_sin_luz_socio"].toDouble(),
        tiempoReservaNoSocio: json["tiempo_reserva_no_socio"],
        tiempoCancelacionNoSocio: json["tiempo_cancelacion_no_socio"],
        precioLuzNoSocio: json["precio_luz_no_socio"].toDouble(),
        precioSinLuzNoSocio: json["precio_sin_luz_no_socio"].toDouble(),
        descripcion: json["descripcion"],
        nombrePatrocinador: json["nombre_patrocinador"],
        imagenPatrocinador: json["imagen_patrocinador"],
        vestuario: json["vestuario"],
        duchas: json["duchas"],
        imagenesPista: json["imagenes_pista"],
      );

  Map<String, dynamic> toJson() => {
        "id_pista": idPista,
        "deporte": deporte,
        "num_pista": numPista,
        "techada": techada,
        "iluminacion": iluminacion,
        "tipo": tipo,
        "cesped": cesped,
        "automatizada": automatizada,
        "duracion_partida": duracionPartida,
        "hora_inicio": horaInicio,
        "hora_fin": horaFin,
        "tiempo_reserva_socio": tiempoReservaSocio,
        "tiempo_cancelacion_socio": tiempoCancelacionSocio,
        "precio_luz_socio": precioLuzSocio,
        "precio_sin_luz_socio": precioSinLuzSocio,
        "tiempo_reserva_no_socio": tiempoReservaNoSocio,
        "tiempo_cancelacion_no_socio": tiempoCancelacionNoSocio,
        "precio_luz_no_socio": precioLuzNoSocio,
        "precio_sin_luz_no_socio": precioSinLuzNoSocio,
        "descripcion": descripcion,
        "nombre_patrocinador": nombrePatrocinador,
        "imagen_patrocinador": imagenPatrocinador,
        "vestuario": vestuario,
        "duchas": duchas,
        "imagenes_pista": imagenesPista,
      };
}
