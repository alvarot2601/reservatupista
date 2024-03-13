import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Login
  {
    'epnl8mdq': {
      'es': 'Usuario',
      'en': 'User',
    },
    '91010ejk': {
      'es': 'Ingresa su correo electrónico aquí...',
      'en': 'Enter your email here...',
    },
    'vqric0j1': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'bv6srh46': {
      'es': 'Ingresa tu contraseña aqui...',
      'en': 'Enter your password here...',
    },
    'ba6l0fvy': {
      'es': 'Recordar\ncontraseña',
      'en': 'Remember password',
    },
    'o2a8ul2j': {
      'es': '¿Has olvidado\nla contraseña?',
      'en': 'have you forgotten\nPassword?',
    },
    'v6vjrcq2': {
      'es': 'Acceder',
      'en': 'To access',
    },
    'z3fe7ku5': {
      'es': 'Registrarte',
      'en': 'Register',
    },
    'ejnrkmgj': {
      'es': 'Términos y Condiciones de Servicio.',
      'en': 'Terms and Conditions of Service.',
    },
    '1t6sgx2w': {
      'es': 'Profesionales',
      'en': 'Professionals',
    },
    '4w64f4jd': {
      'es': 'Clubs, Ayuntamiento, Comunidad, Asociaciones',
      'en': 'Clubs, Town Hall, Community, Associations',
    },
    '96wmjt33': {
      'es': 'info@reservatupista.com',
      'en': 'info@reservatupista.com',
    },
    'c2rlxvwa': {
      'es': '653483483',
      'en': '653483483',
    },
    'wa0kpeem': {
      'es': '© 2023 MODULARBOX S.L.\nTODOS LOS DERECHOS RESERVADOS',
      'en': '© 2023 MODULARBOX S.L.\nALL RIGHTS RESERVED',
    },
    'iys83cv0': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // Perfil
  {
    '78c9x9oa': {
      'es': 'Julio Fresno Torrado',
      'en': 'Julio Fresno Torrado',
    },
    'eofqyfrj': {
      'es': 'juliofresno59',
      'en': 'Juliofresno59',
    },
    'eua12kej': {
      'es': 'Cuenta',
      'en': 'Account',
    },
    'jf8ma3wd': {
      'es': 'Reservar Pista',
      'en': 'My Reservations',
    },
    'nbios80t': {
      'es': 'Mis Reservas',
      'en': 'My Reservations',
    },
    'wjdf6zwy': {
      'es': 'Monedero Virtual',
      'en': 'Virtual Wallet',
    },
    '7yt33xla': {
      'es': 'Datos',
      'en': 'Invite friends',
    },
    'jwaaf104': {
      'es': 'General',
      'en': 'General',
    },
    'baki4id2': {
      'es': 'Notificaciones',
      'en': 'Notifications',
    },
    'p20wvoqj': {
      'es': 'Términos de servicio',
      'en': 'Terms of Service',
    },
    'sx6gm0g9': {
      'es': 'Invitar a amigos',
      'en': 'Invite friends',
    },
    '1swznh5g': {
      'es': 'Cerrar Sesión',
      'en': 'Sign off',
    },
    '40ndsfjw': {
      'es': 'Perfil',
      'en': 'Profile',
    },
    'dj4j0njy': {
      'es': 'Reserva de Pista',
      'en': 'Runway Reservation',
    },
  },
  // LoginProfesional
  {
    'jc2uhe2a': {
      'es': 'Profesional',
      'en': '',
    },
    'rculx1wc': {
      'es': 'Clubs, Ayuntamiento, Comunidad, Asociaciones',
      'en': '',
    },
    '0nfsv0ov': {
      'es': 'Usuario',
      'en': 'User',
    },
    'jx5tit1i': {
      'es': 'Ingresa su correo electrónico aquí...',
      'en': 'Enter your email here...',
    },
    'i00rmztj': {
      'es': 'Contraseña',
      'en': 'Password',
    },
    'ucpg9z1d': {
      'es': 'Ingresa tu contraseña aqui...',
      'en': 'Enter your password here...',
    },
    'jzbqvg2r': {
      'es': 'Recordar\ncontraseña',
      'en': 'Remember password',
    },
    'o5vmye9f': {
      'es': '¿Has olvidado\nla contraseña?',
      'en': 'have you forgotten\nPassword?',
    },
    '5lvqf3l0': {
      'es': 'Acceder',
      'en': 'To access',
    },
    'ccmi37a8': {
      'es': 'Registrarte',
      'en': 'Register',
    },
    '5nbnv5gx': {
      'es': 'Términos y Condiciones de Servicio.',
      'en': 'Terms and Conditions of Service.',
    },
    'whz0gbcv': {
      'es': 'Usuario',
      'en': 'To access',
    },
    'tkqxlmof': {
      'es': 'info@reservatupista.com',
      'en': 'info@reservatupista.com',
    },
    'xbatpwpp': {
      'es': '653483483',
      'en': '653483483',
    },
    'vc6xa3fc': {
      'es': '© 2023 MODULARBOX S.L.\nTODOS LOS DERECHOS RESERVADOS',
      'en': '© 2023 MODULARBOX S.L.\nALL RIGHTS RESERVED',
    },
    'vay6jlsj': {
      'es': 'Home',
      'en': 'home',
    },
  },
  // ReservarPista
  {
    '3k5rut2f': {
      'es': 'Option 1',
      'en': '',
    },
    'lgluabne': {
      'es': 'Localidad',
      'en': '',
    },
    'zmg687lu': {
      'es': 'Search for an item...',
      'en': '',
    },
    '0mlkt2y2': {
      'es': 'Deporte',
      'en': '',
    },
    'd0jjgxjq': {
      'es': 'Deporte',
      'en': '',
    },
    'fnp5wwk9': {
      'es': 'Search for an item...',
      'en': '',
    },
    'wq52pizn': {
      'es': 'N° de pista',
      'en': '',
    },
    'xw1t16kd': {
      'es': 'N° de pista',
      'en': '',
    },
    'qoauer0t': {
      'es': 'Search for an item...',
      'en': '',
    },
    '9a9dz4vw': {
      'es': 'Month',
      'en': '',
    },
    '2p6fb9qg': {
      'es': 'Week',
      'en': '',
    },
    'nn9jlkr2': {
      'es': 'Home',
      'en': '',
    },
  },
  // MisReservas
  {
    'yupuqvyj': {
      'es': 'Padel Bel',
      'en': '',
    },
    'wv5tlwap': {
      'es': '# 1',
      'en': '',
    },
    'wtkm0g7l': {
      'es': 'Sabado 30',
      'en': '',
    },
    '24ab134y': {
      'es': '19:30 - 21:00',
      'en': '',
    },
    'f7pso8ho': {
      'es': 'Home',
      'en': '',
    },
  },
  // Datos
  {
    'xirqyp1a': {
      'es': 'Datos Personales',
      'en': 'Account',
    },
    'ugf5n29q': {
      'es': 'Nick',
      'en': 'User',
    },
    'crfusfrv': {
      'es': 'Mike',
      'en': 'Enter your email here...',
    },
    'b2k0lzh0': {
      'es': 'Nombre',
      'en': 'User',
    },
    'hixrgqou': {
      'es': 'Miguel Angel',
      'en': 'Enter your email here...',
    },
    'pqxptsd9': {
      'es': 'Apellidos',
      'en': 'User',
    },
    'm6rak9yt': {
      'es': 'Hernandez Martinez',
      'en': 'Enter your email here...',
    },
    'i54mhpsf': {
      'es': 'Sexo',
      'en': 'User',
    },
    'zdnizzjf': {
      'es': 'Hombre',
      'en': 'Enter your email here...',
    },
    '0tu1kq3q': {
      'es': 'DNI',
      'en': 'User',
    },
    'rnjydxm7': {
      'es': '12345678A',
      'en': 'Enter your email here...',
    },
    '5ildj9zp': {
      'es': 'Telefono',
      'en': 'User',
    },
    '2n1h22ik': {
      'es': '12345678A',
      'en': 'Enter your email here...',
    },
    'i773oia9': {
      'es': 'Email',
      'en': 'User',
    },
    'v7adkj1m': {
      'es': '12345678A',
      'en': 'Enter your email here...',
    },
    'cmy5laeu': {
      'es': 'xhpedro@hotmail.com',
      'en': '',
    },
    '4vuln5vv': {
      'es': 'Socio o Empradronamiento',
      'en': 'User',
    },
    'ivjng99s': {
      'es': '...',
      'en': 'Enter your email here...',
    },
    'n5gzq74a': {
      'es': 'Datos Ubicacion',
      'en': 'General',
    },
    'x9v4niqd': {
      'es': 'Direccion',
      'en': 'User',
    },
    'qr396ekk': {
      'es': '...',
      'en': 'Enter your email here...',
    },
    'ins4ehlv': {
      'es': 'Avenida rosario 1 2',
      'en': '',
    },
    'pc4t3o70': {
      'es': 'Codigo Postal',
      'en': 'User',
    },
    '96p48n4k': {
      'es': '...',
      'en': 'Enter your email here...',
    },
    'yznu7b2h': {
      'es': '30172',
      'en': '',
    },
    'lrqaq6o0': {
      'es': 'Localidad',
      'en': 'User',
    },
    'xixn1e24': {
      'es': '...',
      'en': 'Enter your email here...',
    },
    'tlxghd4s': {
      'es': 'Peraleda de la Mata',
      'en': '',
    },
    'qu95wuuh': {
      'es': 'Provincia',
      'en': 'User',
    },
    'ti58rpd0': {
      'es': '...',
      'en': 'Enter your email here...',
    },
    '98oh3jip': {
      'es': 'Extremadura',
      'en': '',
    },
    'c1jaw9te': {
      'es': 'Datos de Juego',
      'en': 'General',
    },
    '0j5krmw5': {
      'es': 'Nivel',
      'en': 'User',
    },
    'yakt0kjv': {
      'es': '...',
      'en': 'Enter your email here...',
    },
    'dork0h3p': {
      'es': '0.25',
      'en': '',
    },
    'lxbof0nj': {
      'es': 'Posicion',
      'en': 'User',
    },
    'es68rase': {
      'es': '...',
      'en': 'Enter your email here...',
    },
    'v5kaz3ax': {
      'es': 'Drive',
      'en': '',
    },
    'ae6960b5': {
      'es': 'Pala',
      'en': 'User',
    },
    '9e4amb34': {
      'es': '...',
      'en': 'Enter your email here...',
    },
    'dzlyc7dv': {
      'es': 'Pala',
      'en': '',
    },
    'iptvm9ch': {
      'es': 'Modelo',
      'en': 'User',
    },
    'occ6x0jw': {
      'es': '...',
      'en': 'Enter your email here...',
    },
    '7sr1mz9o': {
      'es': 'Modelo',
      'en': '',
    },
    'gi0ac7k0': {
      'es': 'Juegos por semana',
      'en': 'User',
    },
    '5dtfpc6u': {
      'es': '...',
      'en': 'Enter your email here...',
    },
    '96o2goif': {
      'es': '1',
      'en': '',
    },
    'mhbtbkfs': {
      'es': 'Club Favorito',
      'en': 'User',
    },
    'sort2cs7': {
      'es': '...',
      'en': 'Enter your email here...',
    },
    '60edivde': {
      'es': 'Club 1',
      'en': '',
    },
    'din4pp46': {
      'es': 'Datos',
      'en': '',
    },
    'kqpx8mj6': {
      'es': 'Reserva de Pista',
      'en': 'Runway Reservation',
    },
  },
  // DatosProfesional
  {
    '6yixzxnh': {
      'es': 'Datos Club',
      'en': 'Account',
    },
    'ea75i48s': {
      'es': 'Nombre del Club',
      'en': 'User',
    },
    'fidyr11f': {
      'es': 'Mike',
      'en': 'Enter your email here...',
    },
    's4z88c72': {
      'es': 'Club Padel',
      'en': '',
    },
    'c098k3l2': {
      'es': 'CIF/NIF',
      'en': 'User',
    },
    'a1syawox': {
      'es': 'Miguel Angel',
      'en': 'Enter your email here...',
    },
    '6uzlki9b': {
      'es': 'E2345678F',
      'en': '',
    },
    '3npdvyv5': {
      'es': 'Persona Responsable',
      'en': 'User',
    },
    'ude41jvo': {
      'es': 'Hernandez Martinez',
      'en': 'Enter your email here...',
    },
    's8p7yzyl': {
      'es': 'Miguel Angel',
      'en': '',
    },
    'nu7yp2fm': {
      'es': 'Tipo',
      'en': 'User',
    },
    'f07x8emt': {
      'es': 'Hombre',
      'en': 'Enter your email here...',
    },
    'nphv32is': {
      'es': 'Club',
      'en': '',
    },
    'u94cuqku': {
      'es': 'Nombre Comercial',
      'en': 'User',
    },
    'ciqgdv94': {
      'es': '12345678A',
      'en': 'Enter your email here...',
    },
    'ad058jvq': {
      'es': 'Comercio Padel',
      'en': '',
    },
    'r2rb3qj7': {
      'es': 'Telefono',
      'en': 'User',
    },
    '9uh36uoi': {
      'es': '12345678A',
      'en': 'Enter your email here...',
    },
    '4aetho48': {
      'es': '123456789',
      'en': '',
    },
    'dosq9svt': {
      'es': 'Email',
      'en': 'User',
    },
    'qlm70wjm': {
      'es': '12345678A',
      'en': 'Enter your email here...',
    },
    '6v68cg76': {
      'es': 'xhpedro@hotmail.com',
      'en': '',
    },
    'o9607510': {
      'es': 'Numero de cuenta',
      'en': 'User',
    },
    'f2jzaxqf': {
      'es': '...',
      'en': 'Enter your email here...',
    },
    'mmypdnpc': {
      'es': '332432324242424',
      'en': '',
    },
    '1qdqtwv4': {
      'es': 'Certificado de cuenta',
      'en': 'User',
    },
    'u6mf4jyc': {
      'es': '...',
      'en': 'Enter your email here...',
    },
    '97sw3kru': {
      'es': 'DFS3432434234',
      'en': '',
    },
    'io4i3a5c': {
      'es': 'Datos Ubicacion',
      'en': 'General',
    },
    'io6nryg8': {
      'es': 'Direccion',
      'en': 'User',
    },
    '1hxeuw06': {
      'es': '...',
      'en': 'Enter your email here...',
    },
    'mfw4mqch': {
      'es': 'Avenida rosario 1 2',
      'en': '',
    },
    'zindbfjv': {
      'es': 'Codigo Postal',
      'en': 'User',
    },
    'qyzn0tlz': {
      'es': '...',
      'en': 'Enter your email here...',
    },
    '4kje1g0k': {
      'es': '30172',
      'en': '',
    },
    'f7mp1cvn': {
      'es': 'Localidad',
      'en': 'User',
    },
    'ota7oiuo': {
      'es': '...',
      'en': 'Enter your email here...',
    },
    '1hriyucq': {
      'es': 'Peraleda de la Mata',
      'en': '',
    },
    'nw0q2ncp': {
      'es': 'Provincia',
      'en': 'User',
    },
    'apw43y3z': {
      'es': '...',
      'en': 'Enter your email here...',
    },
    'h0lf4yq9': {
      'es': 'Extremadura',
      'en': '',
    },
    'zm14rpko': {
      'es': 'Datos Profesional',
      'en': '',
    },
    'qwlpj153': {
      'es': 'Reserva de Pista',
      'en': 'Runway Reservation',
    },
  },
  // RegistroUsuario
  {
    'jgqax4kd': {
      'es': 'Datos Personales',
      'en': 'Account',
    },
    'rj6zw2ay': {
      'es': 'Nick',
      'en': 'User',
    },
    '0g1b20hr': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'ka8nw3lz': {
      'es': 'Nombre',
      'en': 'User',
    },
    'jkt954v2': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'hs8q9yd8': {
      'es': 'Apellidos',
      'en': 'User',
    },
    'f54c21si': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'a4dgwqk0': {
      'es': 'Sexo',
      'en': 'User',
    },
    'no4wbk7v': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'fhyr8n9v': {
      'es': 'DNI',
      'en': 'User',
    },
    '2q1yuknb': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'h06srmj1': {
      'es': 'Telefono',
      'en': 'User',
    },
    '9vg5q5i7': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'fxzxrxdm': {
      'es': 'Email',
      'en': 'User',
    },
    '5vtqar9w': {
      'es': '',
      'en': 'Enter your email here...',
    },
    '7ghh87mg': {
      'es': 'Socio o Empradronamiento',
      'en': 'User',
    },
    '1px4b6vc': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'azrws2b9': {
      'es': 'Datos Ubicacion',
      'en': 'General',
    },
    'qt0agrcb': {
      'es': 'Direccion',
      'en': 'User',
    },
    'kv9shvys': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'jj8t8r6j': {
      'es': 'Codigo Postal',
      'en': 'User',
    },
    'j7f4pj74': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'bjbeol36': {
      'es': 'Localidad',
      'en': 'User',
    },
    'awpch02t': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'pcrsypql': {
      'es': 'Provincia',
      'en': 'User',
    },
    'je7hsvwq': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'h6ok3a23': {
      'es': 'Datos de Juego',
      'en': 'General',
    },
    'zfu26hkz': {
      'es': 'Nivel',
      'en': 'User',
    },
    'kuh9d4fr': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'jrnsje7r': {
      'es': 'Posicion',
      'en': 'User',
    },
    'bjpnamhp': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'pmv3v5n6': {
      'es': 'Pala',
      'en': 'User',
    },
    'rvdtxtfg': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'k0v7mskd': {
      'es': 'Modelo',
      'en': 'User',
    },
    'i59d65au': {
      'es': '',
      'en': 'Enter your email here...',
    },
    't629uwnp': {
      'es': 'Juegos por semana',
      'en': 'User',
    },
    'jiq6hhss': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'ytskprdp': {
      'es': 'Club Favorito',
      'en': 'User',
    },
    'kbp9qyup': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'kvfxwvpp': {
      'es': 'Registro Usuario',
      'en': '',
    },
    'pf2dhz9a': {
      'es': 'Reserva de Pista',
      'en': 'Runway Reservation',
    },
  },
  // RegistroProfesional
  {
    'seie8muw': {
      'es': 'Datos Club',
      'en': 'Account',
    },
    'mwiv5l0l': {
      'es': 'Nombre del Club',
      'en': 'User',
    },
    'bunv5770': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'u3u1tfm7': {
      'es': 'CIF/NIF',
      'en': 'User',
    },
    'd7l1ix3g': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'khtltn0l': {
      'es': 'Persona Responsable',
      'en': 'User',
    },
    'c9a7ep5c': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'aud6pb5c': {
      'es': 'Tipo',
      'en': 'User',
    },
    'gs9h85oa': {
      'es': '',
      'en': 'Enter your email here...',
    },
    '3ne5s7a1': {
      'es': 'Nombre Comercial',
      'en': 'User',
    },
    'wrdedflu': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'nhrqt3a5': {
      'es': 'Telefono',
      'en': 'User',
    },
    'w9okgoos': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'vl8l2lm5': {
      'es': 'Email',
      'en': 'User',
    },
    'fo93elkk': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'haq41rhb': {
      'es': 'Numero de cuenta',
      'en': 'User',
    },
    'mprt31mu': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'jq2y2q0h': {
      'es': 'Certificado de cuenta',
      'en': 'User',
    },
    'g4xzn7ie': {
      'es': '',
      'en': 'Enter your email here...',
    },
    '8m9k01ic': {
      'es': 'Datos Ubicacion',
      'en': 'General',
    },
    'iwa3nt3i': {
      'es': 'Direccion',
      'en': 'User',
    },
    'hbcj9w4h': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'swjcwziq': {
      'es': 'Codigo Postal',
      'en': 'User',
    },
    'oesoevi8': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'k5nbxgi3': {
      'es': 'Localidad',
      'en': 'User',
    },
    'nns07tai': {
      'es': '',
      'en': 'Enter your email here...',
    },
    'c51o19t9': {
      'es': 'Provincia',
      'en': 'User',
    },
    'sgm8osmm': {
      'es': '',
      'en': 'Enter your email here...',
    },
    's04siltn': {
      'es': 'Registro Profesional',
      'en': '',
    },
    'e76kmowm': {
      'es': 'Reserva de Pista',
      'en': 'Runway Reservation',
    },
  },
  // PerfilProfesional
  {
    'vd08j0uh': {
      'es': 'Club Padel',
      'en': 'Julio Fresno Torrado',
    },
    'd43c0hri': {
      'es': 'Cuenta',
      'en': 'Account',
    },
    'y8p10wdt': {
      'es': 'Añadir Pista',
      'en': 'My Reservations',
    },
    '09ry2nfl': {
      'es': 'Mis Pistas',
      'en': 'My Reservations',
    },
    'b7j68e36': {
      'es': 'Banco Virtual',
      'en': 'Virtual Wallet',
    },
    'fsbotww5': {
      'es': 'Datos',
      'en': 'Invite friends',
    },
    '82403e5o': {
      'es': 'General',
      'en': 'General',
    },
    'kew3382d': {
      'es': 'Notificaciones',
      'en': 'Notifications',
    },
    'c7g46abw': {
      'es': 'Términos de servicio',
      'en': 'Terms of Service',
    },
    'ghed7xfz': {
      'es': 'Invitar a amigos',
      'en': 'Invite friends',
    },
    'kumomx4t': {
      'es': 'Cerrar Sesión',
      'en': 'Sign off',
    },
    'w025ml4z': {
      'es': 'Perfil Profesional',
      'en': 'Profile',
    },
    'aeoiup0u': {
      'es': 'Reserva de Pista',
      'en': 'Runway Reservation',
    },
  },
  // MonederoVirtual
  {
    '2w3f50dc': {
      'es': '500,00 €',
      'en': '',
    },
    'etd8s02j': {
      'es': 'Recargar',
      'en': '',
    },
    'wm531z5p': {
      'es': 'Filtrar',
      'en': '',
    },
    'rxj2vtw9': {
      'es': 'Todo',
      'en': '',
    },
    'g0yapamj': {
      'es': 'Recarga',
      'en': '',
    },
    '3rs8cnun': {
      'es': 'Lunes 8 Enero 2024',
      'en': '',
    },
    'yhtwqot0': {
      'es': 'Hora: 11:34',
      'en': '',
    },
    '7fb17ptw': {
      'es': '+ 100,00 €',
      'en': '',
    },
    'ms78u1cd': {
      'es': 'Tarjeta',
      'en': '',
    },
    '3vndv0eb': {
      'es': 'Reserva de pista',
      'en': '',
    },
    '088p3ttw': {
      'es': 'Pista Padel #1',
      'en': '',
    },
    'gz0qmisy': {
      'es': 'Lunes 3 Enero 2024',
      'en': '',
    },
    '3rydlm4r': {
      'es': 'Hora: 11:34',
      'en': '',
    },
    'tgp5papj': {
      'es': '- 1,50 €',
      'en': '',
    },
    'b8mc21qx': {
      'es': 'Monedero\nVirtual',
      'en': '',
    },
    'z7lgky7h': {
      'es': 'Alquiler de Pista',
      'en': '',
    },
    'kr03aj0a': {
      'es': 'Pista Padel #1',
      'en': '',
    },
    'hnbkydz2': {
      'es': 'Hora: 11:34',
      'en': '',
    },
    '7vjia91z': {
      'es': 'Pista Padel #1',
      'en': '',
    },
    'on8f5nj3': {
      'es': '- 1,50 €',
      'en': '',
    },
    'j6jy1gzs': {
      'es': 'Monedero\nVirtual',
      'en': '',
    },
    '1ft2z6fw': {
      'es': 'Home',
      'en': '',
    },
  },
  // BancoVirtual
  {
    '363bzsgo': {
      'es': '500.00 €',
      'en': '',
    },
    'yigsy672': {
      'es': 'Transferir',
      'en': '',
    },
    'ixj01blz': {
      'es': 'Filtrar',
      'en': '',
    },
    'bdghsroe': {
      'es': 'Todo',
      'en': '',
    },
    '6yyijgij': {
      'es': 'Recarga',
      'en': '',
    },
    'hqviv308': {
      'es': 'Lunes 8 Enero 2024',
      'en': '',
    },
    'lmsv2yhg': {
      'es': 'Hora: 11:34',
      'en': '',
    },
    '9590oogf': {
      'es': '+ 100,00 €',
      'en': '',
    },
    'yqo6nqi2': {
      'es': 'Tarjeta',
      'en': '',
    },
    '79goxc5l': {
      'es': 'Reserva de pista',
      'en': '',
    },
    '25j5609z': {
      'es': 'Lunes 3 Enero 2024',
      'en': '',
    },
    'bp9a1059': {
      'es': 'Hora: 11:34',
      'en': '',
    },
    'qlkchptn': {
      'es': '- 1,50 €',
      'en': '',
    },
    'trwmi9k3': {
      'es': 'Monedero\nVirtual',
      'en': '',
    },
    '0hw15yqk': {
      'es': 'Alquiler de Pista',
      'en': '',
    },
    'q8hb46sr': {
      'es': 'Lunes 8 Enero 2024',
      'en': '',
    },
    'n252ydh6': {
      'es': 'Hora: 11:34',
      'en': '',
    },
    '59shwrvz': {
      'es': '- 1,50 €',
      'en': '',
    },
    'f3a4dbb8': {
      'es': 'Monedero\nVirtual',
      'en': '',
    },
    'rvhp64tk': {
      'es': 'Home',
      'en': '',
    },
  },
  // AnadirPista
  {
    'bdecaney': {
      'es': 'Deporte',
      'en': '',
    },
    'y7pf20ni': {
      'es': 'Nº de pista',
      'en': '',
    },
    '4fvyn1y2': {
      'es': 'Techada',
      'en': '',
    },
    '57tk3v6n': {
      'es': 'Iluminación',
      'en': '',
    },
    'h4vpjn9e': {
      'es': 'Tipo',
      'en': '',
    },
    '5u7at27s': {
      'es': 'Cesped',
      'en': '',
    },
    'p92c6y50': {
      'es': 'Automatizada',
      'en': '',
    },
    'n996fel8': {
      'es': 'Duración de la partida',
      'en': '',
    },
    'qg81xd56': {
      'es': 'Hora de inicio',
      'en': '',
    },
    'yugkx3fa': {
      'es': 'Hora de fin',
      'en': '',
    },
    'f7gb964k': {
      'es': 'Socio',
      'en': '',
    },
    '8pec6ngx': {
      'es': 'Tiempo de reserva',
      'en': '',
    },
    'l0qo66bk': {
      'es': 'Tiempo de cancelación',
      'en': '',
    },
    '4pzdtkqo': {
      'es': 'Precio sin luz',
      'en': '',
    },
    '5vh7aqw9': {
      'es': 'Precio con luz',
      'en': '',
    },
    'dgqgr0rg': {
      'es': 'No Socio',
      'en': '',
    },
    'bf80y3yu': {
      'es': 'Tiempo de reserva',
      'en': '',
    },
    'si6q5up2': {
      'es': 'Tiempo de cancelación',
      'en': '',
    },
    'z88hkb7w': {
      'es': 'Precio sin luz',
      'en': '',
    },
    'yyeudctn': {
      'es': 'Precio con luz',
      'en': '',
    },
    '78hdleaa': {
      'es': 'Crear Tarifas',
      'en': '',
    },
    'wj02p7dq': {
      'es': 'Descripción',
      'en': '',
    },
    'idt6ry8s': {
      'es': 'Nombre Patrocinador',
      'en': '',
    },
    'dgg2lyy5': {
      'es': 'Patrocinador',
      'en': '',
    },
    'xr6en8f4': {
      'es': 'Vestuario',
      'en': '',
    },
    'ojju0voi': {
      'es': 'Duchas',
      'en': '',
    },
    'c4kxnwwj': {
      'es': 'Subir Imagen de la Pista',
      'en': '',
    },
    'qc6ozir1': {
      'es': 'Crear Pista',
      'en': '',
    },
    'b0ssnph4': {
      'es': 'Home',
      'en': '',
    },
  },
  // Tarifas
  {
    '52a2pnlj': {
      'es': '1',
      'en': '',
    },
    'pusw3ha9': {
      'es': 'Tarifas',
      'en': '',
    },
    'tp4gw2mj': {
      'es': 'L',
      'en': '',
    },
    'cipatgtm': {
      'es': 'M',
      'en': '',
    },
    'ebcx5e4y': {
      'es': 'X',
      'en': '',
    },
    'g6rgwoj4': {
      'es': 'J',
      'en': '',
    },
    'hkuknz22': {
      'es': 'V',
      'en': '',
    },
    'ccyy1wkw': {
      'es': 'S',
      'en': '',
    },
    'zzbivl3x': {
      'es': 'D',
      'en': '',
    },
    'el670ib1': {
      'es': 'Activado',
      'en': '',
    },
    '6vrqassn': {
      'es': 'Clases',
      'en': '',
    },
    'mxfurkky': {
      'es': 'Luz',
      'en': '',
    },
    '18375olo': {
      'es': 'Hora',
      'en': '',
    },
    'jyzrbpbe': {
      'es': 'Socio',
      'en': '',
    },
    'r687qwj7': {
      'es': 'No Socio',
      'en': '',
    },
    'bn47e2qe': {
      'es': 'Activado',
      'en': '',
    },
    '6xtm0x60': {
      'es': '00:00',
      'en': '',
    },
    '1jjqqyu6': {
      'es': '0.01 €',
      'en': '',
    },
    'gd33e0e4': {
      'es': '0.01 €',
      'en': '',
    },
    'qyhrk7qt': {
      'es': 'Activado',
      'en': '',
    },
    'yrq9ls91': {
      'es': '01:00',
      'en': '',
    },
    'upikzcre': {
      'es': '0.01 €',
      'en': '',
    },
    'avmtwknp': {
      'es': '0.01 €',
      'en': '',
    },
    '9o2dygf7': {
      'es': 'Activado',
      'en': '',
    },
    't0uavwrt': {
      'es': '02:00',
      'en': '',
    },
    'zr8spwvn': {
      'es': '0.01 €',
      'en': '',
    },
    'dc9lp3ob': {
      'es': '0.01 €',
      'en': '',
    },
    't074hmzs': {
      'es': 'Activado',
      'en': '',
    },
    'vx7qumry': {
      'es': '03:00',
      'en': '',
    },
    '23z1b8ls': {
      'es': '0.01 €',
      'en': '',
    },
    'dnt5h3a0': {
      'es': '0.01 €',
      'en': '',
    },
    '7nn67vf4': {
      'es': 'Activado',
      'en': '',
    },
    'ihfdsbk2': {
      'es': '04:00',
      'en': '',
    },
    'uyy36axa': {
      'es': '0.01 €',
      'en': '',
    },
    'ew4vxvyd': {
      'es': '0.01 €',
      'en': '',
    },
    'uw13hvui': {
      'es': 'Home',
      'en': '',
    },
  },
  // MisPistas
  {
    '1rgpc4zy': {
      'es': 'Padel Bel',
      'en': '',
    },
    'vyzrwpob': {
      'es': '# 1',
      'en': '',
    },
    'i5ze63x3': {
      'es': 'Sabado 30',
      'en': '',
    },
    'g8uu3va2': {
      'es': '19:30 - 21:00',
      'en': '',
    },
    'uix6cza2': {
      'es': 'Home',
      'en': '',
    },
  },
  // Notificaciones
  {
    'r7pe5dlp': {
      'es': 'Reserva de Pisa',
      'en': '',
    },
    '35v8vko4': {
      'es': '#7676742',
      'en': '',
    },
    'rplav8al': {
      'es': 'Mar 8, 2023',
      'en': '',
    },
    'zcndx959': {
      'es': 'Reserva de Pisa',
      'en': '',
    },
    '0lln34us': {
      'es': 'Mar 8, 2023',
      'en': '',
    },
    '9cxi6fk3': {
      'es': 'Notificaciones ',
      'en': '',
    },
    '5kuhvj7t': {
      'es': 'Home',
      'en': '',
    },
  },
  // NotificacionesProfesional
  {
    'ik9fown0': {
      'es': 'Pista Agregada',
      'en': '',
    },
    '28qf4mue': {
      'es': '#7676742',
      'en': '',
    },
    'np28hill': {
      'es': 'Mar 8, 2023',
      'en': '',
    },
    'y21kn4ku': {
      'es': 'Reserva de Pista',
      'en': '',
    },
    'zv2jkx1y': {
      'es': 'Mar 8, 2023',
      'en': '',
    },
    'vzd6e2vv': {
      'es': 'Notificaciones',
      'en': '',
    },
    'h4mqr2yu': {
      'es': 'Home',
      'en': '',
    },
  },
  // AlertVersions
  {
    'p61l9kp3': {
      'es': 'Versiones',
      'en': 'Versions',
    },
    'd22021tj': {
      'es': 'Actual: 1.2.3',
      'en': 'Current: 1.1.14',
    },
    'mrij7pfx': {
      'es': '1.2.4',
      'en': '1.1.14',
    },
    '0fklb9ts': {
      'es':
          '- Pantallas: Notificaciones, Notificaciones Profesional.\n- Navegación entre todas las pantallas.\n- BottomBar En profesional y en usuario',
      'en':
          '- Added start and end time buttons with the respective times in order.\n- The classes button was added to the assignment table.\n- Button to clone the days\n- Description the button is bigger.\n- Generate table based on schedules.',
    },
    'rtyba43k': {
      'es': '1.2.3',
      'en': '1.1.14',
    },
    '59nhvg7s': {
      'es':
          '- Todas las pantallas pasadas a FlutterFlow.\n- Pantallas: Añadir Pista, Mis pistas, Reservar Pista, Tarifas.\n- Navegación entre todas las pantallas.',
      'en':
          '- Added start and end time buttons with the respective times in order.\n- The classes button was added to the assignment table.\n- Button to clone the days\n- Description the button is bigger.\n- Generate table based on schedules.',
    },
    'ew0ulvuv': {
      'es': '1.2.2',
      'en': '1.1.14',
    },
    'xu9q1xy8': {
      'es':
          '- Pantallas: Monedero Virtual, Banco Virtual.\n- Navegación entre las pantallas. \n- Uso de Widgets de FlutterFlow.',
      'en':
          '- Added start and end time buttons with the respective times in order.\n- The classes button was added to the assignment table.\n- Button to clone the days\n- Description the button is bigger.\n- Generate table based on schedules.',
    },
    'zw9p3se7': {
      'es': '1.2.1',
      'en': '1.1.14',
    },
    '574ol6ms': {
      'es':
          '- Uso de la tecnología FlutterFlow.\n- Pasar pantallas a FlutterFlow.\n- Pantallas de Login de Usuario y Profesonial.\n- Pantallas de Datos Profesional y Datos usuario.\n- Pantallas de Registro de Usuario y Registro Profesional.',
      'en':
          '- Added start and end time buttons with the respective times in order.\n- The classes button was added to the assignment table.\n- Button to clone the days\n- Description the button is bigger.\n- Generate table based on schedules.',
    },
    'hbndzpog': {
      'es': '1.1.15',
      'en': '1.1.14',
    },
    '8kaci684': {
      'es':
          '- Ajustes en Tarifas y En añadir pista.\n- Input de precio alineados y centrados.\n- Cambio de precio con y sin luz.\n- Columna de Clases y icono de clases.\n- Cuando este desactivado, no se puede apagar la luz ni modificar las clases.',
      'en':
          '- Added start and end time buttons with the respective times in order.\n- The classes button was added to the assignment table.\n- Button to clone the days\n- Description the button is bigger.\n- Generate table based on schedules.',
    },
    'xfxg24tt': {
      'es': '1.1.14',
      'en': '1.1.14',
    },
    '2n8c9350': {
      'es':
          '- Agregacion de botones de horario de inicio, y de fin con los respectivos horarios en orden.\n- En la tabla de tarias se agrego el boton de clases.\n- Boton para clonar los dias\n- Descripcion el boton esta mas grande.\n- Generar tabla en base a los horarios.',
      'en':
          '- Added start and end time buttons with the respective times in order.\n- The classes button was added to the assignment table.\n- Button to clone the days\n- Description the button is bigger.\n- Generate table based on schedules.',
    },
    '5m8wcxg3': {
      'es': '1.1.13',
      'en': '1.1.14',
    },
    'hk3qwmvf': {
      'es':
          '- Agregacion de botones de horario de inicio, y de fin.\n- Los selects deben de ir hacia abajo.\n- Generar tabla en base a los horarios.',
      'en':
          '- Added start and end time buttons with the respective times in order.\n- The classes button was added to the assignment table.\n- Button to clone the days\n- Description the button is bigger.\n- Generate table based on schedules.',
    },
    'kxvso1oi': {
      'es': '1.1.12',
      'en': '1.1.14',
    },
    'uetfcf3y': {
      'es':
          '- Ajustes en anadir pista, precio luz y sin luz, socio y no socio.\n- Ajustes en la tabla de tarifas.\n- Ya quedo todo estructurado en la pantalla de tabla de tarifas.\n- Tiene que rellenar los campos para que el boton se vuelva verde. \n- Un slider para ver la tabla, y que solo se muevan los datos.\n- Logo en todas las pantallas de profesional.\n- Cambios en el banco virtual titulo y logo.',
      'en':
          '- Added start and end time buttons with the respective times in order.\n- The classes button was added to the assignment table.\n- Button to clone the days\n- Description the button is bigger.\n- Generate table based on schedules.',
    },
    '7hrqus3p': {
      'es': '1.1.11',
      'en': '1.1.14',
    },
    'omgipyq9': {
      'es':
          '- Pantallas de pista.\n- Tabla de tarifas de lunes a domingo.\n- Splash duracion 8 segundos.\n- Cambios en el splash verificar si funciona.\n- Arreglo en el perfil de usuario y de profesional.\n- Al pedir una una reserva se suma la hora correctamente.\n- Ya no aparece el nick en los datos del profesional.',
      'en':
          '- Added start and end time buttons with the respective times in order.\n- The classes button was added to the assignment table.\n- Button to clone the days\n- Description the button is bigger.\n- Generate table based on schedules.',
    },
    'zf4z0zyk': {
      'es': '1.1.10',
      'en': '1.1.14',
    },
    'j17him4b': {
      'es': '- Tabla de tarifas, y datos para agregar una nueva pista.',
      'en':
          '- Added start and end time buttons with the respective times in order.\n- The classes button was added to the assignment table.\n- Button to clone the days\n- Description the button is bigger.\n- Generate table based on schedules.',
    },
    'n4szz6xx': {
      'es': '1.1.9',
      'en': '1.1.14',
    },
    '17ksl4u9': {
      'es':
          '- Correciones del word en usuario(titulo reservas, revisar si baja mas o menos bien al momento de ver los horarios y la fecha, codigo de descuento, monedero virtual o tarjeta).\n- Datos Usuario del word (debajo de la foto el nick, sexo cambiar icono, campos empadronamiento y socio, los datos en bloques).\n- En las pantallas ya no bailan los datos.\n- Pagina de nick y la foto debajo, Debajo de apellidos el DNI.\n- Cambio de texto en Olvide Contraseña.\n- Cambios en el Splash resivar si funciona bien.\n- Todos los botones de ir atras ya funcionan.',
      'en':
          '- Added start and end time buttons with the respective times in order.\n- The classes button was added to the assignment table.\n- Button to clone the days\n- Description the button is bigger.\n- Generate table based on schedules.',
    },
    'wvwlcls0': {
      'es': '1.1.8',
      'en': '1.1.14',
    },
    'ala52fy7': {
      'es':
          '- Correciones en el login, para que todo aparezca bien en diferentes dispositivos.\n- Mas pequeño el app bar, para que todo se vea mas bien.\n- Arreglos en el inicio de usuario, que al momento de que de click se vaya hacia abajo.\n- Botones para la informacion al reservar una pista.\n- Confirmación de que desea reservar una pista.\n- Registro de usuario, la selección del nivel se ajusta si la pantalla es mas pequeña.\n- Que el texto aparezca al inicio. ',
      'en':
          '- Added start and end time buttons with the respective times in order.\n- The classes button was added to the assignment table.\n- Button to clone the days\n- Description the button is bigger.\n- Generate table based on schedules.',
    },
    'ggqdpok1': {
      'es': '1.1.7',
      'en': '1.1.14',
    },
    'yvn1gnfn': {
      'es':
          '- Nuevo diseño del inicio.\n- Olvide contraseña el boton y el texto debajo.\n- Animación en el inico de la aplicación.\n- Ajuste de las dimensiones de los botones.\n- En los datos acomodados bien.\n- Logo en inicio y en profesional.\n\' Tambien se modifico el registro de profesional.',
      'en':
          '- Added start and end time buttons with the respective times in order.\n- The classes button was added to the assignment table.\n- Button to clone the days\n- Description the button is bigger.\n- Generate table based on schedules.',
    },
    'bm7o47hj': {
      'es': '1.1.6',
      'en': '1.1.14',
    },
    'twrqovpz': {
      'es':
          '- pantalla de inicio de profesionales.\n- animacion en el inicio del texto del lema.\n- Pantalla de olvide contrasena.\n- Preguntar en monedero si quiere recargar.\n- Lista de recargas(recargas, todo, pago de reserva, pago con tarjeta).\n- Filtros en recargas.\n- Lista de horarios en la fecha.',
      'en':
          '- Added start and end time buttons with the respective times in order.\n- The classes button was added to the assignment table.\n- Button to clone the days\n- Description the button is bigger.\n- Generate table based on schedules.',
    },
    '3sv4nt2g': {
      'es': '1.1.5',
      'en': '1.1.14',
    },
    'rvf98j70': {
      'es':
          '- Login de profesional.\n- Registro de profesional.\n- Splash mas tiempo y lema.\n- Agregación de los botones de el calendario y de la lista de horarios.',
      'en':
          '- Added start and end time buttons with the respective times in order.\n- The classes button was added to the assignment table.\n- Button to clone the days\n- Description the button is bigger.\n- Generate table based on schedules.',
    },
    'ulije4t4': {
      'es': '1.1.4',
      'en': '1.1.14',
    },
    'z2r7zrvo': {
      'es':
          '- Codigo postal rellenar campos con api.\n- Monedero (Nueva Interfaz y ajustes).\n- Ajustes en Registr, botones que se salian de pantalla.\n- Pantalla de datos con todos los datos del usuario.\n- Dialogo centrado',
      'en':
          '- Added start and end time buttons with the respective times in order.\n- The classes button was added to the assignment table.\n- Button to clone the days\n- Description the button is bigger.\n- Generate table based on schedules.',
    },
    'pms2gyu6': {
      'es': '1.1.3',
      'en': '1.1.14',
    },
    'fro1kxe4': {
      'es':
          '- Registro de usuario, (Nuevo diseno, guardar en base de datos local).\n- Monedero (Agregar imagenes de los billetes y ir sumando).\n- Dialogo para cuando se registra un usuario.\n- Aceptar terminos y condiciones, para hacer login.',
      'en':
          '- Added start and end time buttons with the respective times in order.\n- The classes button was added to the assignment table.\n- Button to clone the days\n- Description the button is bigger.\n- Generate table based on schedules.',
    },
    'x4pbsop7': {
      'es': '1.1.2',
      'en': '1.1.14',
    },
    'epby1rqo': {
      'es':
          '- Monedero.\n- Registro del usuario\n- Boton de whatsapp.\n- Boton de numero y de correo.\n- Ajustes en login',
      'en':
          '- Added start and end time buttons with the respective times in order.\n- The classes button was added to the assignment table.\n- Button to clone the days\n- Description the button is bigger.\n- Generate table based on schedules.',
    },
    'eh0oyx4v': {
      'es': '1.1.1',
      'en': '1.1.14',
    },
    '77mra8yk': {
      'es':
          '- Pantalla de login \n- Logos.\n- Boton de whatsapp.\n- Inicio Pantalla reservatupista.',
      'en':
          '- Added start and end time buttons with the respective times in order.\n- The classes button was added to the assignment table.\n- Button to clone the days\n- Description the button is bigger.\n- Generate table based on schedules.',
    },
    'x68ldtdr': {
      'es': 'Cancelar',
      'en': '',
    },
    'cy9t16g6': {
      'es': 'Aceptar',
      'en': '',
    },
  },
  // Historial
  {
    'apj26th3': {
      'es': '\$1.50',
      'en': '',
    },
    'yqi62rb0': {
      'es': 'Tarjeta',
      'en': '',
    },
  },
  // NavBarUsuario
  {
    'wp2wr4dg': {
      'es': 'Inicio',
      'en': '',
    },
    's0urhite': {
      'es': 'Mis Reservas',
      'en': '',
    },
    'hbk5vhto': {
      'es': 'Reservar Pista',
      'en': '',
    },
    'k7nfii5m': {
      'es': 'Monedero Virtual',
      'en': '',
    },
    '71p9jdiq': {
      'es': 'Perfil',
      'en': '',
    },
  },
  // AppBarUsuario
  {
    'nfrl5lo9': {
      'es': '1',
      'en': '',
    },
  },
  // AppBarProfesional
  {
    'p8bhem7p': {
      'es': '1',
      'en': '',
    },
  },
  // NavBarProfesional
  {
    'x6w02hml': {
      'es': 'Inicio',
      'en': '',
    },
    'qaoq9u4w': {
      'es': 'Mis Pistas',
      'en': '',
    },
    'rvipocsl': {
      'es': 'Añadir Pista',
      'en': '',
    },
    'rg88qsyw': {
      'es': 'Banco Virtual',
      'en': '',
    },
    '3k8sopkf': {
      'es': 'Perfil',
      'en': '',
    },
  },
  // AppBarLogin
  {
    'ivccwesy': {
      'es': 'R',
      'en': '',
    },
    'hetjr87d': {
      'es': 'eserva',
      'en': '',
    },
    'aobyf1mm': {
      'es': 't',
      'en': '',
    },
    '6vubu86k': {
      'es': 'u',
      'en': '',
    },
    'w1h8bwbh': {
      'es': 'p',
      'en': '',
    },
    'ehytz4x3': {
      'es': 'ista',
      'en': '',
    },
    'jy9xgxwv': {
      'es': '.com',
      'en': '',
    },
    'uuypek1j': {
      'es': 'Versión 1.2.1',
      'en': 'Version 1.1.15',
    },
  },
  // RichAlert
  {
    '2a90zngi': {
      'es': 'Error',
      'en': '',
    },
    'dxdmmn8o': {
      'es':
          'FlutterFlow is a visual development platform that allows you to easily create beautiful and responsive user interfaces for your mobile and web applications. ',
      'en': '',
    },
    '5b62fszn': {
      'es': 'Cancelar',
      'en': '',
    },
    'kgyb67cu': {
      'es': 'Aceptar',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'b9ck4dvl': {
      'es': '',
      'en': '',
    },
    'siyfq6pj': {
      'es': '',
      'en': '',
    },
    'chqfqm5h': {
      'es': '',
      'en': '',
    },
    'jwtgb4a1': {
      'es': '',
      'en': '',
    },
    '3ulqnupd': {
      'es': '',
      'en': '',
    },
    '3kclisqv': {
      'es': '',
      'en': '',
    },
    'vcbjzmou': {
      'es': '',
      'en': '',
    },
    '3y1ls7s6': {
      'es': '',
      'en': '',
    },
    'v2asf82k': {
      'es': '',
      'en': '',
    },
    'hpdlp9h9': {
      'es': '',
      'en': '',
    },
    'ld9hv0kj': {
      'es': '',
      'en': '',
    },
    'v41m9wvw': {
      'es': '',
      'en': '',
    },
    '2fn7n8jv': {
      'es': '',
      'en': '',
    },
    'peo59493': {
      'es': '',
      'en': '',
    },
    'exa4q504': {
      'es': '',
      'en': '',
    },
    'nwnk61fp': {
      'es': '',
      'en': '',
    },
    'dbsgxdd6': {
      'es': '',
      'en': '',
    },
    '19dd99yd': {
      'es': '',
      'en': '',
    },
    '9vk291vo': {
      'es': '',
      'en': '',
    },
    '6dlby7qi': {
      'es': '',
      'en': '',
    },
    '7vkps4wm': {
      'es': '',
      'en': '',
    },
    '3zfr2d8k': {
      'es': '',
      'en': '',
    },
    '0mjx4x0z': {
      'es': '',
      'en': '',
    },
    'acx721q7': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
