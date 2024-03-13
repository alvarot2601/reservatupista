import 'package:get/get.dart';
// import '../../pages/profesional/datos_profesional/datos_profesional_widget.dart';
// import '../../pages/profesional/login_profesional/login_profesional_widget.dart';
// import '../../pages/profesional/registro_profesional/registro_profesional_widget.dart';
// import '../../pages/usuario/datos/datos_widget.dart';
// import '../../pages/usuario/mis_reservas/mis_reservas_widget.dart';
// import '../../pages/usuario/perfil/perfil_widget.dart';
// import '../../pages/usuario/registro_usuario/registro_usuario_widget.dart';
// import '../../pages/usuario/reservar_pista/reservar_pista_widget.dart';
import '../../pages/usuario/datos/ldatos_b.dart';
import '../pages/profesional/anadir_pista/anadir_pista_b.dart';
import '../pages/usuario/login_usuario/login_usuario.dart';
import '../pages/usuario/login_usuario/login_usuario_b.dart';
import '../pages/usuario/registrar_usuario/registrar_usuario.dart';
import '../pages/usuario/registrar_usuario/registrar_usuario_b.dart';
import './index.dart';
import '../pages/profesional/login_profesional/login_profesional.dart';
import '../pages/profesional/login_profesional/login_profesional_b.dart';
import '../pages/usuario/reservar_pista/reservar_pista.dart';
import '../pages/usuario/reservar_pista/reservar_pista_b.dart';
import '../pages/profesional/registro_proveedor/registro_proveedor.dart';
import '../pages/profesional/registro_proveedor/registro_proveedor_b.dart';
import '../pages/Profesional/mis_socios/mis_socios.dart';
import '../pages/Profesional/mis_socios/mis_socios_b.dart';
import '../pages/Profesional/datos_proveedor/datos_proveedor.dart';
import '../pages/Profesional/datos_proveedor/datos_proveedor_b.dart';
import '../pages/Profesional/prueba_proveedor/prueba_proveedor.dart';
import '../pages/Profesional/prueba_proveedor/prueba_proveedor_b.dart';
import '../pages/usuario/chat/chat.dart';
import '../pages/usuario/chat/chat_b.dart';
import '../pages/usuario/resultados_estadisticas/resultados_estadisticas.dart';
import '../pages/usuario/resultados_estadisticas/resultados_estadisticas_b.dart';
import '../pages/profesional/chat_proveedor/chat_proveedor.dart';
import '../pages/profesional/chat_proveedor/chat_proveedor_b.dart';
import '../pages/profesional/mis_pistas/mis_pistas.dart';
import '../pages/profesional/mis_pistas/mis_pistas_b.dart';
import '../pages/profesional/reserva_tu_pista/reserva_tu_pista.dart';
import '../pages/profesional/reserva_tu_pista/reserva_tu_pista_b.dart';
import '../pages/usuario/datos_usuario/datos_usuario.dart';
import '../pages/usuario/datos_usuario/datos_usuario_b.dart';
import '../pages/usuario/olvide_contrasena/olvide_contrasena.dart';
import '../pages/usuario/olvide_contrasena/olvide_contrasena_b.dart';
// End imports

/// Names Routes
abstract class Routes {
  static const LOGIN_USUARIO = '/login_usuario';
  static const REGISTRAR_USUARIO = '/registrar_usuario';
  static const PERFIL = '/perfil';
  static const LOGINPROFESIONAL = '/loginProfesional';
  static const RESERVARPISTA = '/reservarPista';
  static const MISRESERVAS = '/misReservas';
  static const DATOS = '/datos';
  static const DATOSPROFESIONAL = '/datosProfesional';
  static const REGISTROUSUARIO = '/registroUsuario';
  static const REGISTROPROFESIONAL = '/registroProfesional';
  static const PERFILPROFESIONAL = '/perfilProfesional';
  static const MONEDEROVIRTUAL = '/monederoVirtual';
  static const BANCOVIRTUAL = '/bancoVirtual';
  static const ANADIRPISTA = '/anadirPista';
  static const TARIFAS = '/tarifas';
  static const MISPISTAS = '/misPistas';
  static const NOTIFICACIONES = '/notificaciones';
  static const NOTIFICACIONESPROFESIONAL = '/notificacionesProfesional';
  static const INICIOPROFESIONAL = '/inicioProfesional';
  static const INICIO = '/inicio';
  static const LOGIN_PROFESIONAL = '/login_profesional';
  static const RESERVAR_PISTA = '/reservar_pista';
  static const PAGOS_TARJETA = '/pagos_tarjeta';
  static const REGISTRO_PROVEEDOR = '/registro_proveedor';
  static const MIS_SOCIOS = '/mis_socios';
  static const DATOS_PROVEEDOR = '/datos_proveedor';
  static const PRUEBA_PROVEEDOR = '/prueba_proveedor';
  static const CHAT = '/chat';
  static const RESULTADOS_ESTADISTICAS = '/resultados_estadisticas';
  static const CHAT_PROVEEDOR = '/chat_proveedor';
  static const MIS_PISTAS = '/mis_pistas';
  static const RESERVA_TU_PISTA = '/reserva_tu_pista';
  static const DATOS_USUARIO = '/datos_usuario';
  static const OLVIDE_CONTRASENA = '/olvide_contrasena';
}

/// Get Routes
class AppPages {
  static const INITIAL = Routes.LOGIN_USUARIO;
  static final routes = [
    GetPage(
      name: Routes.LOGIN_USUARIO,
      page: () => LoginUsuarioPage(),
      binding: LoginUsuarioBinding(),
    ),
    GetPage(
      name: Routes.REGISTRAR_USUARIO,
      page: () => RegistrarUsuarioPage(),
      binding: RegistrarUsuarioBinding(),
    ),
    GetPage(
      name: Routes.REGISTRAR_USUARIO,
      page: () => RegistrarUsuarioPage(),
      binding: RegistrarUsuarioBinding(),
    ),
    GetPage(
      name: '/perfil',
      page: () => PerfilWidget(),
      transition: Transition.noTransition,
    ),
    // GetPage(
    //   name: '/loginProfesional',
    //   page: () => LoginProfesionalWidget(),
    // ),
    GetPage(
      name: '/reservarPista',
      page: () => ReservarPistaWidget(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: '/misReservas',
      page: () => MisReservasWidget(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: '/datos',
      page: () => DatosWidget(),
      binding: DatosBinding(),
    ),
    GetPage(
      name: '/datosProfesional',
      page: () => DatosProfesionalWidget(),
    ),
    GetPage(
      name: '/registroProfesional',
      page: () => RegistroProfesionalWidget(),
    ),
    GetPage(
      name: '/perfilProfesional',
      page: () => PerfilProfesionalWidget(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: '/monederoVirtual',
      page: () => MonederoVirtualWidget(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: '/bancoVirtual',
      page: () => BancoVirtualWidget(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: '/anadirPista',
      page: () => AnadirPistaWidget(),
      binding: AnadirPistaBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: '/tarifas',
      page: () => TarifasWidget(),
    ),
    GetPage(
      name: '/misPistas',
      page: () => MisPistasWidget(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: '/notificaciones',
      page: () => NotificacionesWidget(),
    ),
    GetPage(
      name: '/notificacionesProfesional',
      page: () => NotificacionesProfesionalWidget(),
    ),
    GetPage(
      name: '/inicioProfesional',
      page: () => InicioProfesionalWidget(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: '/inicio',
      page: () => InicioWidget(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.LOGIN_PROFESIONAL,
      page: () => LoginProfesionalPage(),
      binding: LoginProfesionalBinding(),
    ),
    GetPage(
      name: Routes.RESERVAR_PISTA,
      page: () => ReservarPistaPage(),
      binding: ReservarPistaBinding(),
      transition: Transition.noTransition,
    ),
    // GetPage(
    //    name: Routes.PAGOS_TARJETA,
    //    page: () => PagosTarjetaPage(),
    //    binding: PagosTarjetaBinding(),
    // ),
    GetPage(
      name: Routes.REGISTRO_PROVEEDOR,
      page: () => RegistroProveedorPage(),
      binding: RegistroProveedorBinding(),
    ),
    GetPage(
      name: Routes.MIS_SOCIOS,
      page: () => MisSociosPage(),
      binding: MisSociosBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.DATOS_PROVEEDOR,
      page: () => DatosProveedorPage(),
      binding: DatosProveedorBinding(),
    ),
    GetPage(
      name: Routes.PRUEBA_PROVEEDOR,
      page: () => PruebaProveedorPage(),
      binding: PruebaProveedorBinding(),
    ),
    GetPage(
      name: Routes.CHAT,
      page: () => ChatPage(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: Routes.RESULTADOS_ESTADISTICAS,
      page: () => ResultadosEstadisticasPage(),
      binding: ResultadosEstadisticasBinding(),
    ),
    GetPage(
      name: Routes.CHAT_PROVEEDOR,
      page: () => ChatProveedorPage(),
      binding: ChatProveedorBinding(),
    ),
    GetPage(
      name: Routes.MIS_PISTAS,
      page: () => MisPistasPage(),
      binding: MisPistasBinding(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.RESERVA_TU_PISTA,
      page: () => ReservaTuPistaPage(),
      binding: ReservaTuPistaBinding(),
    ),
    GetPage(
      name: Routes.DATOS_USUARIO,
      page: () => DatosUsuarioPage(),
      binding: DatosUsuarioBinding(),
    ),
    GetPage(
      name: Routes.OLVIDE_CONTRASENA,
      page: () => OlvideContrasenaPage(),
      binding: OlvideContrasenaBinding(),
    ),
  ];
}
