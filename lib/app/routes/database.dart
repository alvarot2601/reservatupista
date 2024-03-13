import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import '../../backend/server_node.dart/proveedor_node.dart';
import '../../backend/server_node.dart/usuario_node.dart';
import 'models/datos_reservas_pista.dart';
import 'models/proveedor_model.dart';
import 'models/usuario_model.dart';

class DatabaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DatabaseController>(DatabaseController());
  }
}

class DatabaseController extends GetxController {
  String version = '1.2.29';
  String nombre = 'Nutri';
  String imageServer = '';
  String? imageProveedor;
  late DatosReservaPista datosReserva;
  UsuarioModel? datosUsuario;
  ProveedorModel? datosProveedor;

  @override
  void onInit() async {
    super.onInit();
    try {
      datosReserva = datosReservaPistaFromJson(jsonEncode(
          {"clubsFavoritos": [], "tiempoReserva": 7, "reservas": generate()}));
    } catch (e) {
      print(e);
    }
    print("sd");
  }

  Future<bool> getDatosUsuario() async {
    try {
      final result = await getUsuarioNode('1');
      if (result is UsuarioModel) {
        imageServer = getImageUsuarioNode(result.foto);
        datosUsuario = result;

        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> getDatosProveedor() async {
    try {
      final result = await getProveedorNode('1');
      if (result is ProveedorModel) {
        datosProveedor = result;
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}

List generate() {
  final localidades = [
    'Belvis de Monroy',
    'Riolobos',
    'Casar de Palomaro',
    'Cheles',
    'Helechosa de los Montes',
    'Orellana La Vieja',
    'Aldea del Cano',
    'Tayuela',
    'Tayuela Club',
  ];

  final clubs = [
    'Club 1',
    'Club 2',
    'Club 3',
    'Club 4',
    'Club 5',
    'Club 6',
    'Club 7',
    'Club 8',
    'Club 9',
  ];

  List<Map> mapa = [];
  for (var l = 0; l < 9; l++) {
    final mapj = {};
    mapj['localidad'] = localidades[l];
    // List listCompleta = [];
    // for (var i = 0; i < clubs.length; i++) {
    List listaClubs = [];
    for (var j = 0; j < l + 1; j++) {
      listaClubs.add({
        'name': clubs[j] + ' ${localidades[l]}',
        'favorito': false,
        'deportes': getDeportes(l + 1)
      });
    }
    mapj['clubs'] = listaClubs;
    mapa.add(mapj);
    // }
  }
  return mapa;
  // printInfo(info: jsonEncode(mapa).toString());
}

List getDeportes(int index) {
  final deportes = [
    '🎾 Padel',
    '🎾 Tenis',
    '🏸 Badminton',
    '🏊‍♀️ P. Climatizada',
    '🏊‍♀️ Piscina',
    '🏀 Baloncesto',
    '⚽ Futbol sala',
    '⚽ Futbol 7',
    '⚽ Futbol 11',
    '🥍 Pickleball',
    '🏸 Squash',
    '🏓 Tenis de mesa',
    '🏓 Fronton',
    '⚽ Balomano',
    '🏉 Rugby',
    '🥅 Multideporte',
  ];
  final newLista = [];
  final RAD = Random();
  final id = RAD.nextInt(16);
  for (var i = 0; i < index; i++) {
    newLista.add({
      'name': deportes[i],
      'semana': List.generate(7, (index) => getSemana(index))
    });
  }
  return newLista;
}

Map getSemana(int index) {
  final pistas = [
    'Reservatupista',
    'Modularbox',
    'Miragredos',
    'Fibrabox',
  ];
  // const image = 'logo_reservatupista.png';
  final images = [
    'logo_reservatupista_title.jpg',
    'logo_modularbox.jpg',
    'logo_miragredos.jpg',
    'logo_fibrabox.jpg'
  ];
  List listacom = [];
  for (var j = 0; j < pistas.length; j++) {
    // pistas[j]
    final random = Random();
    final horariosAleatorio = [
      {"horario": "07:30", "estatus": "reservada"},
      {"horario": "09:00", "estatus": "reservada"},
      {"horario": "10:30", "estatus": "reservada"},
      {"horario": "12:00", "estatus": "reservada"},
      {"horario": "13:30", "estatus": "ocupada"},
      {"horario": "15:00", "estatus": "ocupada"},
      {"horario": "16:30", "estatus": "reservada"},
      {"horario": "18:00", "estatus": "reservada"},
      {"horario": "19:30", "estatus": "reservada"},
      {"horario": "21:00", "estatus": "reservada"},
      {"horario": "22:30", "estatus": "reservada"}
    ];
    final estatus = ['desocupada', 'reservada', 'ocupada', 'abierta'];
    for (var i = 0; i < horariosAleatorio.length; i++) {
      int indiceAleatorio = random.nextInt(4);
      if (index == 0 && pistas[j] == "Modularbox") {
        horariosAleatorio[i]['estatus'] = 'reservada';
      } else {
        horariosAleatorio[i]['estatus'] = estatus[indiceAleatorio];
      }
    }
    listacom.add(
        {'name': pistas[j], 'image': images[j], 'horarios': horariosAleatorio});
  }
  return {'pistas': listacom};
}

/*


    '🎾 Padel',
    '🎾 Tenis',
    '🏸 Badminton',
    '🏊‍♀️ Piscina climatizada',
    '🏊‍♀️ Piscina',
    '🏀 Baloncesto',
    '⚽ Futbol sala',
    '⚽ Futbol 7',
    '⚽ Futbol 11',
    '🥍 Pickleball',
    '🏸 Squash',
    '🏓 Tenis de mesa',
    '🏓 Fronton',
    '⚽ Balomano',
    '🏉 Rugby',
    '🥅 Pista multideporte',
    
INSERT INTO Horarios (estado, fecha, hora_inicio, hora_fin) VALUES
('reservada', '2024-21-01', '07:30', '09:00'),
('ocupada', '2024-21-01', '09:00', '10:30'),
('desocupada', '2024-21-01', '10:30', '12:00');
('desocupada', '2024-21-01', '12:00', '13:30');
('reservada', '2024-21-01', '13:30', '15:00'),
('ocupada', '2024-21-01', '15:00', '16:30'),
('desocupada', '2024-21-01', '16:30', '18:00');
('desocupada', '2024-21-01', '18:00', '19:30');
('reservada', '2024-21-01', '19:30', '21:00'),
('ocupada', '2024-21-01', '21:00', '22:30'),
('desocupada', '2024-21-01', '22:30', '00:00');
    */
final data = {
  "clubs_favoritos": [
    {"id_localidad": 0, "id_club": 0, "id_usuario": 0}
  ],
  "tiempo_reserva": 7,
  "reservas": [
    {
      "localidad": "Belvis de Monroy",
      "clubs": [
        {
          "name": "Club 1",
          "deportes": [
            {
              "name": "Padel",
              "pistas": [
                {
                  "name": "Turegalito.com",
                  "image": "logo_reservatupista.png",
                  "horarios": [
                    {
                      "horario": "07:30",
                      "fecha": "2024-22-2024",
                      "estatus": "reservada"
                    },
                    {
                      "horario": "09:00",
                      "fecha": "2024-22-2024",
                      "estatus": "ocupada"
                    },
                    {
                      "horario": "10:30",
                      "fecha": "2024-22-2024",
                      "estatus": "ocupada"
                    },
                    {
                      "horario": "12:00",
                      "fecha": "2024-22-2024",
                      "estatus": "reservada"
                    },
                    {
                      "horario": "13:30",
                      "fecha": "2024-22-2024",
                      "estatus": "reservada"
                    },
                    {
                      "horario": "15:00",
                      "fecha": "2024-22-2024",
                      "estatus": "desocupada"
                    },
                    {
                      "horario": "16:30",
                      "fecha": "2024-22-2024",
                      "estatus": "reservada"
                    },
                    {
                      "horario": "18:00",
                      "fecha": "2024-22-2024",
                      "estatus": "desocupada"
                    },
                    {
                      "horario": "19:30",
                      "fecha": "2024-22-2024",
                      "estatus": "reservada"
                    },
                    {
                      "horario": "21:00",
                      "fecha": "2024-22-2024",
                      "estatus": "reservada"
                    },
                    {
                      "horario": "22:30",
                      "fecha": "2024-22-2024",
                      "estatus": "desocupada"
                    }
                  ]
                },
              ]
            }
          ]
        }
      ]
    }
  ]
};
final localidades = {
  "clubsFavoritos": [],
  "tiempoReserva": 7,
  "reservas": [
    {
      "localidad": "Belvis de Monroy",
      "clubs": [
        {
          "name": "Club 1",
          "favorito": false,
          "deportes": [
            {
              "name": "Padel",
              "semana": [
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "localidad": "Riolobos",
      "clubs": [
        {
          "name": "Club 1 riolobos",
          "favorito": false,
          "deportes": [
            {
              "name": "Padel",
              "semana": [
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "name": "Tenis",
              "semana": [
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "name": "Club 2 riolobos",
          "favorito": false,
          "deportes": [
            {
              "name": "Padel",
              "semana": [
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "name": "Tenis",
              "semana": [
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    },
    {
      "localidad": "Casar de Palomaro",
      "clubs": [
        {
          "name": "Club 1 casar",
          "favorito": false,
          "deportes": [
            {
              "name": "Padel",
              "semana": [
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "name": "Tenis",
              "semana": [
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "name": "Badminton",
              "semana": [
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "name": "Club 2 casar",
          "favorito": false,
          "deportes": [
            {
              "name": "Padel",
              "semana": [
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "name": "Tenis",
              "semana": [
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "name": "Badminton",
              "semana": [
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "name": "Club 3 casar",
          "favorito": false,
          "deportes": [
            {
              "name": "Padel",
              "semana": [
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "name": "Tenis",
              "semana": [
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                }
              ]
            },
            {
              "name": "Badminton",
              "semana": [
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "ocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "reservada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "ocupada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "ocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "ocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "reservada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "reservada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "desocupada"},
                        {"horario": "12:00", "estatus": "reservada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "desocupada"},
                        {"horario": "09:00", "estatus": "ocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "reservada"},
                        {"horario": "15:00", "estatus": "ocupada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    }
                  ]
                },
                {
                  "pistas": [
                    {
                      "name": "Turegalito.com",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "ocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "desocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "desocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    },
                    {
                      "name": "Reservatupista",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "reservada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "desocupada"},
                        {"horario": "15:00", "estatus": "reservada"},
                        {"horario": "16:30", "estatus": "ocupada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "ocupada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "desocupada"}
                      ]
                    },
                    {
                      "name": "Modularbox",
                      "image": "logo_reservatupista.png",
                      "horarios": [
                        {"horario": "07:30", "estatus": "reservada"},
                        {"horario": "09:00", "estatus": "desocupada"},
                        {"horario": "10:30", "estatus": "ocupada"},
                        {"horario": "12:00", "estatus": "desocupada"},
                        {"horario": "13:30", "estatus": "ocupada"},
                        {"horario": "15:00", "estatus": "desocupada"},
                        {"horario": "16:30", "estatus": "reservada"},
                        {"horario": "18:00", "estatus": "desocupada"},
                        {"horario": "19:30", "estatus": "reservada"},
                        {"horario": "21:00", "estatus": "desocupada"},
                        {"horario": "22:30", "estatus": "reservada"}
                      ]
                    }
                  ]
                }
              ]
            }
          ]
        }
      ]
    }
  ]
  // [
  //   {
  //     "localidad": "Belvis de Monroy",
  //     "clubs": [
  //       {
  //         "name": "Club 1",
  //         "favorito": false,
  //         "deportes": [
  //           {
  //             "name": "Padel",
  //             "semana": [
  //               {
  //                 "pistas": [
  //                   {
  //                     "name": "ModularBox",
  //                     "image": "logo_reservatupista.png",
  //                     "horarios": [
  //                       {"horario": "07:30", "estatus": "reservada"},
  //                       {"horario": "09:00", "estatus": "reservada"},
  //                       {"horario": "10:30", "estatus": "reservada"},
  //                       {"horario": "12:00", "estatus": "reservada"},
  //                       {"horario": "13:30", "estatus": "ocupada"},
  //                       {"horario": "15:00", "estatus": "ocupada"},
  //                       {"horario": "16:30", "estatus": "reservada"},
  //                       {"horario": "18:00", "estatus": "reservada"},
  //                       {"horario": "19:30", "estatus": "reservada"},
  //                       {"horario": "21:00", "estatus": "reservada"},
  //                       {"horario": "22:30", "estatus": "reservada"}
  //                     ]
  //                   },
  //                   {
  //                     "name": "ReservaTupista.com",
  //                     "image": "logo_reservatupista.png",
  //                     "horarios": [
  //                       {"horario": "07:30", "estatus": "ocupada"},
  //                       {"horario": "09:00", "estatus": "ocupada"},
  //                       {"horario": "10:30", "estatus": "ocupada"},
  //                       {"horario": "12:00", "estatus": "desocupada"},
  //                       {"horario": "13:30", "estatus": "desocupada"},
  //                       {"horario": "15:00", "estatus": "desocupada"},
  //                       {"horario": "16:30", "estatus": "desocupada"},
  //                       {"horario": "18:00", "estatus": "reservada"},
  //                       {"horario": "19:30", "estatus": "reservada"},
  //                       {"horario": "21:00", "estatus": "reservada"},
  //                       {"horario": "22:30", "estatus": "reservada"}
  //                     ]
  //                   }
  //                 ]
  //               },
  //               {
  //                 "pistas": [
  //                   {
  //                     "name": "ModularBox",
  //                     "image": "logo_reservatupista.png",
  //                     "horarios": [
  //                       {"horario": "07:30", "estatus": "reservada"},
  //                       {"horario": "09:00", "estatus": "reservada"},
  //                       {"horario": "10:30", "estatus": "reservada"},
  //                       {"horario": "12:00", "estatus": "desocupada"},
  //                       {"horario": "13:30", "estatus": "desocupada"},
  //                       {"horario": "15:00", "estatus": "desocupada"},
  //                       {"horario": "16:30", "estatus": "desocupada"},
  //                       {"horario": "18:00", "estatus": "desocupada"},
  //                       {"horario": "19:30", "estatus": "desocupada"},
  //                       {"horario": "21:00", "estatus": "reservada"},
  //                       {"horario": "22:30", "estatus": "reservada"}
  //                     ]
  //                   }
  //                 ]
  //               },
  //               {
  //                 "pistas": [
  //                   {
  //                     "name": "ReservaTupista.com",
  //                     "image": "logo_reservatupista.png",
  //                     "horarios": [
  //                       {"horario": "07:30", "estatus": "reservada"},
  //                       {"horario": "09:00", "estatus": "reservada"},
  //                       {"horario": "10:30", "estatus": "reservada"},
  //                       {"horario": "12:00", "estatus": "reservada"},
  //                       {"horario": "13:30", "estatus": "reservada"},
  //                       {"horario": "15:00", "estatus": "reservada"},
  //                       {"horario": "16:30", "estatus": "reservada"},
  //                       {"horario": "18:00", "estatus": "reservada"},
  //                       {"horario": "19:30", "estatus": "reservada"},
  //                       {"horario": "21:00", "estatus": "reservada"},
  //                       {"horario": "22:30", "estatus": "reservada"}
  //                     ]
  //                   }
  //                 ]
  //               },
  //               {
  //                 "pistas": [
  //                   {
  //                     "name": "ModularBox",
  //                     "image": "logo_reservatupista.png",
  //                     "horarios": [
  //                       {"horario": "07:30", "estatus": "reservada"},
  //                       {"horario": "09:00", "estatus": "reservada"},
  //                       {"horario": "10:30", "estatus": "reservada"},
  //                       {"horario": "12:00", "estatus": "reservada"},
  //                       {"horario": "13:30", "estatus": "reservada"},
  //                       {"horario": "15:00", "estatus": "reservada"},
  //                       {"horario": "16:30", "estatus": "reservada"},
  //                       {"horario": "18:00", "estatus": "reservada"},
  //                       {"horario": "19:30", "estatus": "reservada"},
  //                       {"horario": "21:00", "estatus": "reservada"},
  //                       {"horario": "22:30", "estatus": "reservada"}
  //                     ]
  //                   }
  //                 ]
  //               },
  //               {
  //                 "pistas": [
  //                   {
  //                     "name": "ModularBox",
  //                     "image": "logo_reservatupista.png",
  //                     "horarios": [
  //                       {"horario": "07:30", "estatus": "reservada"},
  //                       {"horario": "09:00", "estatus": "reservada"},
  //                       {"horario": "10:30", "estatus": "reservada"},
  //                       {"horario": "12:00", "estatus": "reservada"},
  //                       {"horario": "13:30", "estatus": "reservada"},
  //                       {"horario": "15:00", "estatus": "reservada"},
  //                       {"horario": "16:30", "estatus": "reservada"},
  //                       {"horario": "18:00", "estatus": "reservada"},
  //                       {"horario": "19:30", "estatus": "reservada"},
  //                       {"horario": "21:00", "estatus": "reservada"},
  //                       {"horario": "22:30", "estatus": "reservada"}
  //                     ]
  //                   }
  //                 ]
  //               },
  //               {
  //                 "pistas": [
  //                   {
  //                     "name": "ModularBox",
  //                     "image": "logo_reservatupista.png",
  //                     "horarios": [
  //                       {"horario": "07:30", "estatus": "reservada"},
  //                       {"horario": "09:00", "estatus": "reservada"},
  //                       {"horario": "10:30", "estatus": "reservada"},
  //                       {"horario": "12:00", "estatus": "reservada"},
  //                       {"horario": "13:30", "estatus": "reservada"},
  //                       {"horario": "15:00", "estatus": "reservada"},
  //                       {"horario": "16:30", "estatus": "reservada"},
  //                       {"horario": "18:00", "estatus": "reservada"},
  //                       {"horario": "19:30", "estatus": "reservada"},
  //                       {"horario": "21:00", "estatus": "reservada"},
  //                       {"horario": "22:30", "estatus": "reservada"}
  //                     ]
  //                   }
  //                 ]
  //               },
  //               {
  //                 "pistas": [
  //                   {
  //                     "name": "ModularBox",
  //                     "image": "logo_reservatupista.png",
  //                     "horarios": [
  //                       {"horario": "07:30", "estatus": "reservada"},
  //                       {"horario": "09:00", "estatus": "reservada"},
  //                       {"horario": "10:30", "estatus": "reservada"},
  //                       {"horario": "12:00", "estatus": "reservada"},
  //                       {"horario": "13:30", "estatus": "reservada"},
  //                       {"horario": "15:00", "estatus": "reservada"},
  //                       {"horario": "16:30", "estatus": "reservada"},
  //                       {"horario": "18:00", "estatus": "reservada"},
  //                       {"horario": "19:30", "estatus": "reservada"},
  //                       {"horario": "21:00", "estatus": "reservada"},
  //                       {"horario": "22:30", "estatus": "reservada"}
  //                     ]
  //                   }
  //                 ]
  //               }
  //             ]
  //           }
  //         ]
  //       },
  //     ]
  //   },
  //   {
  //     "localidad": "Riolobos",
  //     "clubs": [
  //       {
  //         "name": "Club Riolobos 1",
  //         "favorito": false,
  //         "deportes": [
  //           {
  //             "name": "🎾 Padel",
  //             "semana": [
  //               {
  //                 "pistas": [
  //                   {
  //                     "name": "ModularBox",
  //                     "image": "logo_reservatupista.png",
  //                     "horarios": [
  //                       {"horario": "07:30", "estatus": "desocupada"},
  //                       {"horario": "09:00", "estatus": "desocupada"},
  //                       {"horario": "10:30", "estatus": "desocupada"},
  //                       {"horario": "12:00", "estatus": "desocupada"},
  //                       {"horario": "13:30", "estatus": "desocupada"},
  //                       {"horario": "15:00", "estatus": "desocupada"},
  //                       {"horario": "16:30", "estatus": "desocupada"},
  //                       {"horario": "18:00", "estatus": "reservada"},
  //                       {"horario": "19:30", "estatus": "reservada"},
  //                       {"horario": "21:00", "estatus": "reservada"},
  //                       {"horario": "22:30", "estatus": "reservada"}
  //                     ]
  //                   }
  //                 ]
  //               },
  //               {
  //                 "pistas": [
  //                   {
  //                     "name": "ModularBox",
  //                     "image": "logo_reservatupista.png",
  //                     "horarios": [
  //                       {"horario": "07:30", "estatus": "reservada"},
  //                       {"horario": "09:00", "estatus": "reservada"},
  //                       {"horario": "10:30", "estatus": "desocupada"},
  //                       {"horario": "12:00", "estatus": "desocupada"},
  //                       {"horario": "13:30", "estatus": "desocupada"},
  //                       {"horario": "15:00", "estatus": "desocupada"},
  //                       {"horario": "16:30", "estatus": "desocupada"},
  //                       {"horario": "18:00", "estatus": "desocupada"},
  //                       {"horario": "19:30", "estatus": "reservada"},
  //                       {"horario": "21:00", "estatus": "reservada"},
  //                       {"horario": "22:30", "estatus": "reservada"}
  //                     ]
  //                   }
  //                 ]
  //               },
  //               {
  //                 "pistas": [
  //                   {
  //                     "name": "ModularBox",
  //                     "image": "logo_reservatupista.png",
  //                     "horarios": [
  //                       {"horario": "07:30", "estatus": "reservada"},
  //                       {"horario": "09:00", "estatus": "reservada"},
  //                       {"horario": "10:30", "estatus": "reservada"},
  //                       {"horario": "12:00", "estatus": "reservada"},
  //                       {"horario": "13:30", "estatus": "desocupada"},
  //                       {"horario": "15:00", "estatus": "desocupada"},
  //                       {"horario": "16:30", "estatus": "desocupada"},
  //                       {"horario": "18:00", "estatus": "desocupada"},
  //                       {"horario": "19:30", "estatus": "desocupada"},
  //                       {"horario": "21:00", "estatus": "desocupada"},
  //                       {"horario": "22:30", "estatus": "reservada"}
  //                     ]
  //                   }
  //                 ]
  //               },
  //               {
  //                 "pistas": [
  //                   {
  //                     "name": "ModularBox",
  //                     "image": "logo_reservatupista.png",
  //                     "horarios": [
  //                       {"horario": "07:30", "estatus": "reservada"},
  //                       {"horario": "09:00", "estatus": "reservada"},
  //                       {"horario": "10:30", "estatus": "reservada"},
  //                       {"horario": "12:00", "estatus": "desocupada"},
  //                       {"horario": "13:30", "estatus": "desocupada"},
  //                       {"horario": "15:00", "estatus": "desocupada"},
  //                       {"horario": "16:30", "estatus": "desocupada"},
  //                       {"horario": "18:00", "estatus": "desocupada"},
  //                       {"horario": "19:30", "estatus": "desocupada"},
  //                       {"horario": "21:00", "estatus": "reservada"},
  //                       {"horario": "22:30", "estatus": "reservada"}
  //                     ]
  //                   }
  //                 ]
  //               },
  //               {
  //                 "pistas": [
  //                   {
  //                     "name": "ModularBox",
  //                     "image": "logo_reservatupista.png",
  //                     "horarios": [
  //                       {"horario": "07:30", "estatus": "reservada"},
  //                       {"horario": "09:00", "estatus": "reservada"},
  //                       {"horario": "10:30", "estatus": "reservada"},
  //                       {"horario": "12:00", "estatus": "desocupada"},
  //                       {"horario": "13:30", "estatus": "desocupada"},
  //                       {"horario": "15:00", "estatus": "desocupada"},
  //                       {"horario": "16:30", "estatus": "desocupada"},
  //                       {"horario": "18:00", "estatus": "desocupada"},
  //                       {"horario": "19:30", "estatus": "desocupada"},
  //                       {"horario": "21:00", "estatus": "reservada"},
  //                       {"horario": "22:30", "estatus": "reservada"}
  //                     ]
  //                   }
  //                 ]
  //               },
  //               {
  //                 "pistas": [
  //                   {
  //                     "name": "ModularBox",
  //                     "image": "logo_reservatupista.png",
  //                     "horarios": [
  //                       {"horario": "07:30", "estatus": "reservada"},
  //                       {"horario": "09:00", "estatus": "reservada"},
  //                       {"horario": "10:30", "estatus": "reservada"},
  //                       {"horario": "12:00", "estatus": "desocupada"},
  //                       {"horario": "13:30", "estatus": "desocupada"},
  //                       {"horario": "15:00", "estatus": "desocupada"},
  //                       {"horario": "16:30", "estatus": "desocupada"},
  //                       {"horario": "18:00", "estatus": "desocupada"},
  //                       {"horario": "19:30", "estatus": "desocupada"},
  //                       {"horario": "21:00", "estatus": "desocupada"},
  //                       {"horario": "22:30", "estatus": "reservada"}
  //                     ]
  //                   }
  //                 ]
  //               },
  //               {
  //                 "pistas": [
  //                   {
  //                     "name": "ModularBox",
  //                     "image": "logo_reservatupista.png",
  //                     "horarios": [
  //                       {"horario": "07:30", "estatus": "reservada"},
  //                       {"horario": "09:00", "estatus": "reservada"},
  //                       {"horario": "10:30", "estatus": "reservada"},
  //                       {"horario": "12:00", "estatus": "desocupada"},
  //                       {"horario": "13:30", "estatus": "desocupada"},
  //                       {"horario": "15:00", "estatus": "desocupada"},
  //                       {"horario": "16:30", "estatus": "desocupada"},
  //                       {"horario": "18:00", "estatus": "desocupada"},
  //                       {"horario": "19:30", "estatus": "desocupada"},
  //                       {"horario": "21:00", "estatus": "desocupada"},
  //                       {"horario": "22:30", "estatus": "reservada"}
  //                     ]
  //                   }
  //                 ]
  //               }
  //             ]
  //           }
  //         ]
  //       },
  //       {
  //         "name": "Club Riolobos 2",
  //         "favorito": false,
  //         "deportes": [
  //           {
  //             "name": "🎾 Tenis",
  //             "semana": [
  //               {
  //                 "pistas": [
  //                   {
  //                     "name": "ModularBox",
  //                     "image": "logo_reservatupista.png",
  //                     "horarios": [
  //                       {"horario": "07:30", "estatus": "reservada"},
  //                       {"horario": "09:00", "estatus": "reservada"},
  //                       {"horario": "10:30", "estatus": "reservada"},
  //                       {"horario": "12:00", "estatus": "reservada"},
  //                       {"horario": "13:30", "estatus": "reservada"},
  //                       {"horario": "15:00", "estatus": "reservada"},
  //                       {"horario": "16:30", "estatus": "reservada"},
  //                       {"horario": "18:00", "estatus": "reservada"},
  //                       {"horario": "19:30", "estatus": "reservada"},
  //                       {"horario": "21:00", "estatus": "reservada"},
  //                       {"horario": "22:30", "estatus": "reservada"}
  //                     ]
  //                   }
  //                 ]
  //               },
  //               {
  //                 "pistas": [
  //                   {
  //                     "name": "ModularBox",
  //                     "image": "logo_reservatupista.png",
  //                     "horarios": [
  //                       {"horario": "07:30", "estatus": "reservada"},
  //                       {"horario": "09:00", "estatus": "reservada"},
  //                       {"horario": "10:30", "estatus": "reservada"},
  //                       {"horario": "12:00", "estatus": "reservada"},
  //                       {"horario": "13:30", "estatus": "reservada"},
  //                       {"horario": "15:00", "estatus": "reservada"},
  //                       {"horario": "16:30", "estatus": "reservada"},
  //                       {"horario": "18:00", "estatus": "reservada"},
  //                       {"horario": "19:30", "estatus": "reservada"},
  //                       {"horario": "21:00", "estatus": "reservada"},
  //                       {"horario": "22:30", "estatus": "reservada"}
  //                     ]
  //                   }
  //                 ]
  //               },
  //               {
  //                 "pistas": [
  //                   {
  //                     "name": "ModularBox",
  //                     "image": "logo_reservatupista.png",
  //                     "horarios": [
  //                       {"horario": "07:30", "estatus": "reservada"},
  //                       {"horario": "09:00", "estatus": "reservada"},
  //                       {"horario": "10:30", "estatus": "reservada"},
  //                       {"horario": "12:00", "estatus": "reservada"},
  //                       {"horario": "13:30", "estatus": "reservada"},
  //                       {"horario": "15:00", "estatus": "reservada"},
  //                       {"horario": "16:30", "estatus": "reservada"},
  //                       {"horario": "18:00", "estatus": "reservada"},
  //                       {"horario": "19:30", "estatus": "reservada"},
  //                       {"horario": "21:00", "estatus": "reservada"},
  //                       {"horario": "22:30", "estatus": "reservada"}
  //                     ]
  //                   }
  //                 ]
  //               },
  //               {
  //                 "pistas": [
  //                   {
  //                     "name": "ModularBox",
  //                     "image": "logo_reservatupista.png",
  //                     "horarios": [
  //                       {"horario": "07:30", "estatus": "reservada"},
  //                       {"horario": "09:00", "estatus": "reservada"},
  //                       {"horario": "10:30", "estatus": "reservada"},
  //                       {"horario": "12:00", "estatus": "reservada"},
  //                       {"horario": "13:30", "estatus": "reservada"},
  //                       {"horario": "15:00", "estatus": "reservada"},
  //                       {"horario": "16:30", "estatus": "reservada"},
  //                       {"horario": "18:00", "estatus": "reservada"},
  //                       {"horario": "19:30", "estatus": "reservada"},
  //                       {"horario": "21:00", "estatus": "reservada"},
  //                       {"horario": "22:30", "estatus": "reservada"}
  //                     ]
  //                   }
  //                 ]
  //               },
  //               {
  //                 "pistas": [
  //                   {
  //                     "name": "ModularBox",
  //                     "image": "logo_reservatupista.png",
  //                     "horarios": [
  //                       {"horario": "07:30", "estatus": "reservada"},
  //                       {"horario": "09:00", "estatus": "reservada"},
  //                       {"horario": "10:30", "estatus": "reservada"},
  //                       {"horario": "12:00", "estatus": "reservada"},
  //                       {"horario": "13:30", "estatus": "reservada"},
  //                       {"horario": "15:00", "estatus": "reservada"},
  //                       {"horario": "16:30", "estatus": "reservada"},
  //                       {"horario": "18:00", "estatus": "reservada"},
  //                       {"horario": "19:30", "estatus": "reservada"},
  //                       {"horario": "21:00", "estatus": "reservada"},
  //                       {"horario": "22:30", "estatus": "reservada"}
  //                     ]
  //                   }
  //                 ]
  //               },
  //               {
  //                 "pistas": [
  //                   {
  //                     "name": "ModularBox",
  //                     "image": "logo_reservatupista.png",
  //                     "horarios": [
  //                       {"horario": "07:30", "estatus": "reservada"},
  //                       {"horario": "09:00", "estatus": "reservada"},
  //                       {"horario": "10:30", "estatus": "reservada"},
  //                       {"horario": "12:00", "estatus": "reservada"},
  //                       {"horario": "13:30", "estatus": "reservada"},
  //                       {"horario": "15:00", "estatus": "reservada"},
  //                       {"horario": "16:30", "estatus": "reservada"},
  //                       {"horario": "18:00", "estatus": "reservada"},
  //                       {"horario": "19:30", "estatus": "reservada"},
  //                       {"horario": "21:00", "estatus": "reservada"},
  //                       {"horario": "22:30", "estatus": "reservada"}
  //                     ]
  //                   }
  //                 ]
  //               },
  //               {
  //                 "pistas": [
  //                   {
  //                     "name": "ModularBox",
  //                     "image": "logo_reservatupista.png",
  //                     "horarios": [
  //                       {"horario": "07:30", "estatus": "reservada"},
  //                       {"horario": "09:00", "estatus": "reservada"},
  //                       {"horario": "10:30", "estatus": "reservada"},
  //                       {"horario": "12:00", "estatus": "reservada"},
  //                       {"horario": "13:30", "estatus": "reservada"},
  //                       {"horario": "15:00", "estatus": "reservada"},
  //                       {"horario": "16:30", "estatus": "reservada"},
  //                       {"horario": "18:00", "estatus": "reservada"},
  //                       {"horario": "19:30", "estatus": "reservada"},
  //                       {"horario": "21:00", "estatus": "reservada"},
  //                       {"horario": "22:30", "estatus": "reservada"}
  //                     ]
  //                   }
  //                 ]
  //               }
  //             ]
  //           }
  //         ]
  //       },
  //     ]
  //   }
  // ]
};

// final localidades = {
//   "clubsFavoritos": [],
//   "tiempoReserva": 7,

//   };
// {
//   "localidad": "Riolobos",
//   "clubs": [
//     {
//       "club": "Club 1",
//       "favorito": false,
//       "deportes": [
//         {
//           "name": "Padel",
//           "semana": [
//             {
//               "pistas": [
//                 {
//                   "name": "ModularBox",
//                   "horarios": [
//                     {"horario": "07:30", "estatus": "reservada"},
//                     {"horario": "09:00", "estatus": "ocupada"},
//                     {"horario": "10:30", "estatus": "ocupada"},
//                     {"horario": "12:00", "estatus": "reservada"},
//                     {"horario": "13:30", "estatus": "reservada"},
//                     {"horario": "15:00", "estatus": "reservada"},
//                     {"horario": "16:30", "estatus": "reservada"},
//                     {"horario": "18:00", "estatus": "reservada"},
//                     {"horario": "19:30", "estatus": "ocupada"},
//                     {"horario": "21:00", "estatus": "ocupada"},
//                     {"horario": "22:30", "estatus": "ocupada"}
//                   ]
//                 }
//               ]
//             }
//           ]
//         },
//         {
//           "name": "Tenis",
//           "semana": [
//             {
//               "pistas": [
//                 {
//                   "name": "ModularBox",
//                   "horarios": [
//                     {"horario": "07:30", "estatus": "reservada"},
//                     {"horario": "09:00", "estatus": "ocupada"},
//                     {"horario": "10:30", "estatus": "ocupada"},
//                     {"horario": "12:00", "estatus": "reservada"},
//                     {"horario": "13:30", "estatus": "reservada"},
//                     {"horario": "15:00", "estatus": "reservada"},
//                     {"horario": "16:30", "estatus": "reservada"},
//                     {"horario": "18:00", "estatus": "reservada"},
//                     {"horario": "19:30", "estatus": "ocupada"},
//                     {"horario": "21:00", "estatus": "ocupada"},
//                     {"horario": "22:30", "estatus": "ocupada"}
//                   ]
//                 }
//               ]
//             }
//           ]
//         }
//       ]
//     },
//     {
//       "club": "Club 2",
//       "favorito": "reservada",
//       "deportes": [
//         {
//           "name": "Padel",
//           "semana": [
//             {
//               "pistas": [
//                 {
//                   "name": "Reservatupista",
//                   "horarios": [
//                     {"horario": "07:30", "estatus": "reservada"},
//                     {"horario": "09:00", "estatus": "ocupada"},
//                     {"horario": "10:30", "estatus": "ocupada"},
//                     {"horario": "12:00", "estatus": "reservada"},
//                     {"horario": "13:30", "estatus": "reservada"},
//                     {"horario": "15:00", "estatus": "ocupada"},
//                     {"horario": "16:30", "estatus": "ocupada"},
//                     {"horario": "18:00", "estatus": "reservada"},
//                     {"horario": "19:30", "estatus": "ocupada"},
//                     {"horario": "21:00", "estatus": "reservada"},
//                     {"horario": "22:30", "estatus": "reservada"}
//                   ]
//                 }
//               ]
//             }
//           ]
//         },
//       ]
//     }
//   ]
// },
// {
//   "localidad": "Casar de Palomaro",
//   "clubs": [
//     {
//       "club": "Club 1",
//       "favorito": "reservada",
//       "deportes": [
//         {
//           "name": "padel",
//           "semana": [
//             {
//               "pistas": [
//                 {
//                   "name": "ModularBox",
//                   "horarios": [
//                     {"horario": "07:30", "estatus": "reservada"},
//                     {"horario": "09:00", "estatus": "ocupada"},
//                     {"horario": "10:30", "estatus": "ocupada"},
//                     {"horario": "12:00", "estatus": "reservada"},
//                     {"horario": "13:30", "estatus": "reservada"},
//                     {"horario": "15:00", "estatus": "reservada"},
//                     {"horario": "16:30", "estatus": "reservada"},
//                     {"horario": "18:00", "estatus": "reservada"},
//                     {"horario": "19:30", "estatus": "ocupada"},
//                     {"horario": "21:00", "estatus": "ocupada"},
//                     {"horario": "22:30", "estatus": "ocupada"}
//                   ]
//                 }
//               ]
//             }
//           ]
//         }
//       ]
//     },
//     {
//       "club": "Club 2",
//       "favorito": false,
//       "deportes": [
//         {
//           "name": "Casar de Palomaro",
//           "semana": [
//             {
//               "pistas": [
//                 {
//                   "name": "Reservatupista",
//                   "horarios": [
//                     {"horario": "07:30", "estatus": "desocupada"},
//                     {"horario": "09:00", "estatus": "ocupada"},
//                     {"horario": "10:30", "estatus": "ocupada"},
//                     {"horario": "12:00", "estatus": "desocupada"},
//                     {"horario": "13:30", "estatus": "desocupada"},
//                     {"horario": "15:00", "estatus": "ocupada"},
//                     {"horario": "16:30", "estatus": "ocupada"},
//                     {"horario": "18:00", "estatus": "desocupada"},
//                     {"horario": "19:30", "estatus": "ocupada"},
//                     {"horario": "21:00", "estatus": "desocupada"},
//                     {"horario": "22:30", "estatus": "desocupada"}
//                   ]
//                 }
//               ]
//             }
//           ]
//         }
//       ]
//     },
//     {
//       "club": "Club 3",
//       "favorito": false,
//       "deportes": [
//         {
//           "name": "Casar de Palomaro",
//           "semana": [
//             {
//               "pistas": [
//                 {
//                   "name": "Reservatupista",
//                   "horarios": [
//                     {"horario": "07:30", "estatus": "desocupada"},
//                     {"horario": "09:00", "estatus": "ocupada"},
//                     {"horario": "10:30", "estatus": "ocupada"},
//                     {"horario": "12:00", "estatus": "desocupada"},
//                     {"horario": "13:30", "estatus": "desocupada"},
//                     {"horario": "15:00", "estatus": "ocupada"},
//                     {"horario": "16:30", "estatus": "ocupada"},
//                     {"horario": "18:00", "estatus": "desocupada"},
//                     {"horario": "19:30", "estatus": "ocupada"},
//                     {"horario": "21:00", "estatus": "desocupada"},
//                     {"horario": "22:30", "estatus": "desocupada"}
//                   ]
//                 }
//               ]
//             }
//           ]
//         }
//       ]
//     }
//   ]
// },
// {
//   "localidad": "Riolobos",
//   "clubs": [
//     {
//       "club": "Club 1",
//       "favorito": false,
//       "deportes": [
//         {
//           "name": "padel",
//           "semana": [
//             {
//               "pistas": [
//                 {
//                   "name": "ModularBox",
//                   "horarios": [
//                     {"horario": "07:30", "estatus": "desocupada"},
//                     {"horario": "09:00", "estatus": "ocupada"},
//                     {"horario": "10:30", "estatus": "ocupada"},
//                     {"horario": "12:00", "estatus": "desocupada"},
//                     {"horario": "13:30", "estatus": "desocupada"},
//                     {"horario": "15:00", "estatus": "desocupada"},
//                     {"horario": "16:30", "estatus": "desocupada"},
//                     {"horario": "18:00", "estatus": "desocupada"},
//                     {"horario": "19:30", "estatus": "ocupada"},
//                     {"horario": "21:00", "estatus": "ocupada"},
//                     {"horario": "22:30", "estatus": "ocupada"}
//                   ]
//                 }
//               ]
//             }
//           ]
//         }
//       ]
//     },
//     {
//       "club": "Club 2",
//       "favorito": false,
//       "deportes": [
//         {
//           "name": "Casar de Palomaro",
//           "semana": [
//             {
//               "pistas": [
//                 {
//                   "name": "Reservatupista",
//                   "horarios": [
//                     {"horario": "07:30", "estatus": "desocupada"},
//                     {"horario": "09:00", "estatus": "ocupada"},
//                     {"horario": "10:30", "estatus": "ocupada"},
//                     {"horario": "12:00", "estatus": "desocupada"},
//                     {"horario": "13:30", "estatus": "desocupada"},
//                     {"horario": "15:00", "estatus": "ocupada"},
//                     {"horario": "16:30", "estatus": "ocupada"},
//                     {"horario": "18:00", "estatus": "desocupada"},
//                     {"horario": "19:30", "estatus": "ocupada"},
//                     {"horario": "21:00", "estatus": "desocupada"},
//                     {"horario": "22:30", "estatus": "desocupada"}
//                   ]
//                 }
//               ]
//             }
//           ]
//         }
//       ]
//     }
//   ]
// }

