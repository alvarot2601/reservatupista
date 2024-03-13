import 'package:get/route_manager.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'alert_versions_model.dart';
export 'alert_versions_model.dart';

class AlertVersionsWidget extends StatefulWidget {
  const AlertVersionsWidget({Key? key}) : super(key: key);

  @override
  _AlertVersionsWidgetState createState() => _AlertVersionsWidgetState();
}

class _AlertVersionsWidgetState extends State<AlertVersionsWidget> {
  late AlertVersionsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlertVersionsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  Widget buildVersion({required String version, required String descripcion}) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
          child: Text(
            version,
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Readex Pro',
                  color: FlutterFlowTheme.of(context).primary,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(-1, 0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
            child: Text(
              descripcion,
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Readex Pro',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 1,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 24, 16, 24),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'p61l9kp3' /* Versiones */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Outfit',
                        color: FlutterFlowTheme.of(context).primary,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                  child: Text(
                    FFAppState().version,
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          fontFamily: 'Outfit',
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        buildVersion(
                            version: '1.2.32',
                            descripcion:
                                '''
Registro de proveedor.
Validar todos los campos.
Guardar datos en el servidor.
Mostrar datos al momento de hacer login en proveedor.
Pagina de olvidar contrasena.
                '''),
                        buildVersion(
                            version: '1.2.31',
                            descripcion:
                                '''
Datos del usuario.
Mostrar los datos del usuario en los datos, siempre muestra el ultimo registrado.
Poder modificar solo ciertos campos.
Actualizar la foto, o alguno de los campos que se pueda editar.
Modificar los datos en la base de datos.
Mostrar una preview de la imagen, antes de modificarla.
                '''),
                        buildVersion(
                            version: '1.2.30',
                            descripcion:
                                '''
Registro de usuario hay algunos campos obligatorios.
y otros no son obligatorios.
Tambien el registro se guarda en la base de datos y guarda la imagen en el servidor.
Solo te puedes registrar si el nick no existe.

                '''),
                        buildVersion(
                            version: '1.2.29',
                            descripcion:
                                '''
Registro de usuario.
Que al momento de poner el codigo postal te rellene la localidad, providencia y comunidad.
Que sea obligatorio la imagen.
Que empadronamiento, comunidad de vecinos,  nivel, posicion, marca de pala, juegos por semana.
                '''),
                        buildVersion(
                            version: '1.2.28',
                            descripcion:
                                '''
Editar naranja.
Imagen de deporte.

N/D
Datos de juego solo el nick.
Un poco separado lo del telefono.
He leido y acepto termino y condiciones
Tambien terminos en anadir pista.

Click y anadir la imagen de la reserva o reservar todo.
Si la reserva esta abierta la primera estara una persona en ella.
Si la reservas y esta en verde tu cara se posicionara en la primera.
Si esta abierta tu cara aparecera despues de la que ya esta.
los circulos con un + para  agregar nuevos a la pista.
Si esta automatizada.
Tabla de reservar y lista de reservas en nodejs y base de datos.
Las claves en Variables de entorno por seguridad en nodejs.
                '''),
                        buildVersion(
                            version: '1.2.27',
                            descripcion:
                                '''
Click y anadir la imagen de la reserva o reservar todo.
Si la reserva esta abierta la primera estara una persona en ella.
Si la reservas y esta en verde tu cara se posicionara en la primera.
Si esta abierta tu cara aparecera despues de la que ya esta.
los circulos con un + para  agregar nuevos a la pista.
Si esta automatizada.
Tabla de reservar y lista de reservas en nodejs y base de datos.
Las claves en Variables de entorno por seguridad en nodejs.
                '''),
                        buildVersion(
                            version: '1.2.26',
                            descripcion:
                                '''
Anadir una pista a la base de datos.
Mostrar las pistas agregadas en mis pistas.
Ajuste de los inputs en registro de usuario y de profesional.
Solo se pueden crear las tarifas si el usuario, si selecciona los valores que se indican.
Si selecciona una pista el borde se pone azul.
                '''),
                        buildVersion(
                            version: '1.2.25',
                            descripcion:
                                '''
Agregar base de datos.
Base de datos agregadas, servidor en nodejs,
guardar imagenes, ajustes en las pantallas de reserva tu pista,
Errores al momento de mover el scroll
Solo logo de la pista y numero de la pista.
Nada de mover las pistas.

                '''),
                        buildVersion(
                            version: '1.2.24',
                            descripcion:
                                '''
Reservar pista
Ajustes en reserva tu pista.

                '''),
                        buildVersion(
                            version: '1.2.23',
                            descripcion:
                                '''
Reservar pista
Arreglo en los nombres, de los deportes.
Mas datos para que pruebes, el slide.
Arreglo para que cuando seleciones un dia el slide se ajuste en el horario y en las pistas.
Flechas en el horario(Aun no tiene funcionalidad)

Mis Reservas

Pista abierta en naranja
Pista cerrada en verde
cambio del logo de reservatupista.
Total en mis reservas
Ajuste de la pelota del logo a la misma que esta el titulo y la fecha/\.

                '''),
                        buildVersion(
                            version: '1.2.22',
                            descripcion:
                                '''
Reservar Pista:
Botones de las pistas a la izquierda.
Agregar favoritos y que se quede guardado.
Poder seleccionar cualquier pista sin errores.
Cuando seleccionas un dia, automaticamente se selecciona la pista 1.
Obligatorito seleccionar la localidad. 
Si ya hay favoritos, seleccionar entree los clubs que tienes en favoritos.
Mensaje, de reservar pista, si no tiene saldo, le aparecera un mensaje que no tiene saldo (en el caso de monedero virtual). 
Poder seleccionar las pistas y si todas estan ocupadas o reservadas, aparece en rojo.
Si reservas una pista se resta del monedero virtual.
Mis reservas:
Aparece una pista abierta en naranja.
Y pista en rojo de reservada.
El precio debajo de cada usuario que reservo la pista.
Si la pista esta abierta, hay espacios en gris.
Ajustes del movimiento al seleccionar la fecha y el horario.

cambio del logo de reservatupista.

                '''),
                        buildVersion(
                            version: '1.2.21',
                            descripcion:
                                '''
Ajustes en reserva tu pista.
Generar tabla local para los datos.
Ajustes del movimiento al seleccionar la fecha y el horario.
                '''),
                        buildVersion(
                            version: '1.2.20',
                            descripcion:
                                '''
Reservar pista agregar el input de club y poder agregar favoritos
Vista de los patrocinadores
En ofertas cambio del tamano
En el inicio el logo mas grande de reservatupista.
y la version a un lado del correo.
Ajuste del tamano del texto en las pistas.
Cambio en vez de rojo que aparezcan grises las clases.
Quitar titulos cuenta y General.
                '''),
                        buildVersion(
                            version: '1.2.19',
                            descripcion:
                                '''
A:
Registro Proveedor
⦁ Codigo iban como la imagen de Whatsapp.
⦁ Contraseña es requerida y aceptar los terminos y condiciones para poder registrarse.
⦁ Cambiar color a verde en los inputs de contraseña.
⦁ Código iban que cada vez que escribas se vaya moviendo a cada input.
⦁ Agragar portugal y francia debajo de españa en el selector del movil.
⦁ Input mas pequeño de la seleccion del movil, tambien en registro usuario.
Login Usuario
⦁ Texto que se ajuste del lema.
⦁ Logo de a diputacion de caseres transparente. 
Inicio de Usuario y Inicio de Proveedor
⦁ Quitar texto y poner Noticias.
⦁ Quitar la localización.
⦁ Chat en appbar de incio con el icono del chat, solo en usuario.
⦁ Logo y tema en el login.
⦁ Imagenes en el slider de noticias.
⦁ Agregar ofertas con un slider de imagenes.
⦁ Movimiento de las imagenes en el slider de noticias y de ofertas, cada 3 segundos.
Nuevas Paginas
⦁ Pagina de Resultados y Estadísticas.
⦁ Pagina de chat.

B:
⦁ Ajustar el texto en el login.
⦁ Cambio en paginas de usuario y de proveedor, para que la pantalla no se mueva, cuando cambias de pantalla.
⦁ El color de los botones y al darle click cambiados en las paginas de proveedor.
⦁ El boton de cerrar sesion en perfil de usuario y en perfil de proveedor, se queda hasta abajo.
  Añadir Pista
⦁ El boton del deporte y de N° de pista a la mitad.
⦁ Cambio de color de los inputs a verde de proveedor.
                '''),
                        buildVersion(
                            version: '1.2.18',
                            descripcion:
                                '''
Registro Usuario
⦁ Nick mas largo 20 digitos.
⦁	Nombre y apelidos max 40 digitos.
⦁	Nick debajo de Datos de juego.
⦁	DNI y Sexo en una misma columna.
⦁	icono del pais y el movil.
⦁ Email 40 digitos.
⦁ Solo empadronamiento que socio empadronamiento.
⦁ Nuevo input de comunadad de vecinos.
⦁ Codigo postal 5 digitos.
⦁ Provincia en vez de providencia.
⦁ Poner 2 decimales en nivel.
⦁ Marca de pala en vez de pala.
⦁ Revisar marcas de foto por whatsapp y poner en el select de marcas de pala.
⦁ Juegos por semana select del 1 al 10.
⦁ Quitar club favorito.
⦁ Contraseña y confirmar contraseña.
⦁ He leido y acepto terminos y condiciones.
Registro de proveedor
⦁ Contraseña y confirmar contraseña.
⦁ Dirección Fiscal más digitos.
⦁ Código Iban.
⦁ Seleccionar una imagen del certificado.
⦁ Persona responsable cambiar por Nombre y apellidos.
⦁ Separar lada y numero de telefono.
⦁ Email mas largo.
⦁ Nombre comercial mas largo.
⦁ Dirección mas larga.
⦁ Código Postal 5 digitos.
⦁ Localidad mas larga.
⦁ Terminos y condiciones.
⦁ El mismo popup del login del usuario.
Login Usuario y Proveedor
⦁ Whatsapp mas arriba.
⦁ Obligatorio terminos y condiciones.
⦁ Texto de correo mas a la izquierda.
⦁ Un pelin mas grande el tamano del select de usuario y proveedor.
⦁ Iconos del select mas separados.
                '''),
                        buildVersion(
                            version: '1.2.17',
                            descripcion:
                                '''
⦁	Modificacion del login.
⦁	Ajustes del menu para acceder a socios en navbar de proveedor.
⦁	Boton en proveedor de socios.
⦁	Lista de datos en proveedor.
⦁	Imagen cambia en perfil del registro de proveedor.
                '''),
                        buildVersion(
                            version: '1.2.16',
                            descripcion:
                                '''
A: 
⦁	modelo de pala en registro y en datos.
⦁	ajustar en una linea la lista de deportes y numero de pista.
⦁	10 dias tanto en socio como no socio
⦁	Usuario login y profesional
⦁	Que puedas cambiar entre los dos . 
⦁	Que puedas moverte para ver lo de profesional y lo del usuario.
B:
⦁	Cambio de profesional a proveedor.
⦁	Login de proveedor.(Aun falta lo de subir la imagen del certificado, y que los datos se vean dentro de los datos del proveedor)
⦁	Linea debajo de la seleccion en login.
⦁	Colores mejor puestos en el login. 
⦁	Que no se separe la seleccion.
⦁	Poder agregar una imagen del club en el registro.
                '''),
                        buildVersion(
                            version: '1.2.15',
                            descripcion:
                                '''
⦁	Pantalla de pago de tarjeta.
⦁	En datos ya no es obligatorio el socio.
⦁	En mis reservas la imagen se agrega a todos, y aparece el tipo de pago. 
⦁	La pantalla de mis pistas la quite y la voy a adaptar como quedamos hoy.
⦁	Reservar pista dialogo para confirmar el pago, y se resta en monedero y si es pago con tarjeta se pasa a la pasarela de pago. 
⦁	En login los colores ya no aparece verde, solo los botones.
⦁	Color login profesional en verde
                '''),
                        buildVersion(
                            version: '1.2.14',
                            descripcion:
                                '''
⦁	Coma y dos digitos en banco virtual y monedero virtual 
⦁	Popap confimar la recarga y la transferencia
⦁	Filtrar 
⦁	Marca de Pala.  es lo del modelo es escribir,
⦁	Empadronamiento en datos ubicacion es un select 
⦁	En login el correo esta muy junto
⦁	Color login profesional en verde
⦁	nivel aun lado del nick en perfil de usuario
⦁	Que al momento de seleccionar aparezca como boton.
⦁	N° Pista: en reservar pista
⦁	Luz: Si o No
⦁	Color Border en Azul en el calendario y en los horarios
⦁	En mis reservas : La hora pegando al dia y el mes Precio del dia que selecciones 30/01/2024 19:30 - 21:00
⦁	En mis reservas: En donde esta el horario el precio
⦁	Mis Reservas Border en verde, y la pelota mas pequena
⦁	Check en login, cuadrado azul y el check en blanco
⦁	En banco virtual: Transferencia, es transferencia.
⦁	1/11 SOn las solicitudes de la pista por horarios
⦁	Deporte y numero de pista y el patrocinador y las solicitudes
⦁	En tarifas boton para atras
⦁	Quitar los bordes de activar y desactivar.
⦁	Y al dar activado del titulo actiar y descativar todos
⦁	Socio no socio quitar para hora y lo de clases para luz, en la tablaquitar.
⦁	Clonar dias. Seleccionar muchos.
⦁	Dos bortones de cancelar y confirmar.
                '''),
                        buildVersion(
                            version: '1.2.13',
                            descripcion:
                                '''- Monedero Virtual ajustes de colores.
                                - Monedero que le dinero se vaya sumando.
- Registro de usuario seleccionar imagen local o foto o imagen en el dispositivo.
- Autorellenado en Reservar pista, y que al momento de seleccionar cada uno la pantalla baje.
- Botones para terminos y condiciones, y para invitar amigos.
- Perfil Usuario visualizar los cambios al momento de registrarse.
                '''),
                        buildVersion(
                            version: '1.2.12',
                            descripcion:
                                '''- Monedero Virtual ajustes de colores.
- Registro de Usuario y que los datos se vean reflejados en el inicio, y en los datos.
- Guardar la imagen.
- Validaciones de los inputs.
- Terminos y Condiciones.
- Share link.
- Perfil Usuario visualizar los cambios al momento de registrarse.
                '''),
                        buildVersion(
                            version: '1.2.11',
                            descripcion:
                                '''- Monedero Virtual y banco virtual poder recargar y transferir.
- Las pantallas ya no tienen boton para ir para atras.
- Navegacion arreglada del navbar.
- Arreglo de la pantalla de perfil y de notificaciones.
- Botones para contactar, whatsapp, telefono y correo.
                '''),
                        buildVersion(
                            version: '1.2.10',
                            descripcion:
                                '''- Monedero Virtual y banco virtual poder recargar y transferir.
- Las pantallas ya no tienen boton para ir para atras.
- Navegacion arreglada del navbar.
- Arreglo de la pantalla de perfil y de notificaciones.
- Botones para contactar, whatsapp, telefono y correo.
                '''),
                        buildVersion(
                            version: '1.2.9',
                            descripcion:
                                '''- Navegación en usuario profesional, a todas las pantallas de cada uno.
- Pantalla de inicio en usuario y en profesional.
- Pantalla de perfil responsiva en profesional y en usaurio.
- Tiempo de cancelación en horas.
- Tiempo de reserva en días.
- Que si la pantalla esta completa no haya movimiento en ninguna pantalla.
                '''),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                              child: Text(
                                '1.2.8',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Text(
                                  '''- Selects ya no vacios.
- Pantalla para reservar pista.
- Seleccionar pista numero y localidad.
- Elegir en el calendario el dia.
- seleccionar la hora.
- Mostrar la información de la reserva de pista.
                ''',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                              child: Text(
                                '1.2.7',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Text(
                                  '''- Frangas en azul.
- Selección para copiar dia.
- Guardar la lista de horarios.
- Tabla con bordes azul.
- Que la pantalla no se mueva, solo los datos de la tabla.
- Seleccionar hora de inicio y hora de fin, ya sea en 60 minutos o en 90 minutos.
                ''',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                              child: Text(
                                '1.2.6',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Text(
                                  '''- Pasar toda la funcionalidad de vscode a flutterflow.
- Selección, iconos en deporte, autogenerar el numero de pista.
- Creación de horarios.
- Pasar los datos del socio y no socio a la tabla de tarifas.
- Funcionalidad en la tabla de tarifas.
- Seleccionar clases, luz, activar o desactivar el horario''',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                              child: Text(
                                '1.2.5',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Text(
                                  '''- Arreglos en navegación entre pantallas.
- Funcionalidad en añadir pista.
- Pantallas de notificaciones.
- Errores al contruir el apk, por uso de firebase.''',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                              child: Text(
                                '1.2.4',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Text(
                                  '''- Pantallas: Notificaciones, Notificaciones Profesional.
- Navegación entre todas las pantallas.
- BottomBar En profesional y en usuario.''',
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'rtyba43k' /* 1.2.3 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '59nhvg7s' /* - Todas las pantallas pasadas ... */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'ew0ulvuv' /* 1.2.2 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'xu9q1xy8' /* - Pantallas: Monedero Virtual,... */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'zw9p3se7' /* 1.2.1 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '574ol6ms' /* - Uso de la tecnología Flutter... */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'hbndzpog' /* 1.1.15 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '8kaci684' /* - Ajustes en Tarifas y En añad... */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'xfxg24tt' /* 1.1.14 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '2n8c9350' /* - Agregacion de botones de hor... */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '5m8wcxg3' /* 1.1.13 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'hk3qwmvf' /* - Agregacion de botones de hor... */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'kxvso1oi' /* 1.1.12 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'uetfcf3y' /* - Ajustes en anadir pista, pre... */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '7hrqus3p' /* 1.1.11 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'omgipyq9' /* - Pantallas de pista.
                - Tabla ... */
                                    ,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'zf4z0zyk' /* 1.1.10 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'j17him4b' /* - Tabla de tarifas, y datos pa... */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'n4szz6xx' /* 1.1.9 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '17ksl4u9' /* - Correciones del word en usua... */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'wvwlcls0' /* 1.1.8 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'ala52fy7' /* - Correciones en el login, par... */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'ggqdpok1' /* 1.1.7 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'yvn1gnfn' /* - Nuevo diseño del inicio.
                - O... */
                                    ,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'bm7o47hj' /* 1.1.6 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'twrqovpz' /* - pantalla de inicio de profes... */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '3sv4nt2g' /* 1.1.5 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'rvf98j70' /* - Login de profesional.
                - Regi... */
                                    ,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'ulije4t4' /* 1.1.4 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'z2r7zrvo' /* - Codigo postal rellenar campo... */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'pms2gyu6' /* 1.1.3 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'fro1kxe4' /* - Registro de usuario, (Nuevo ... */,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'x4pbsop7' /* 1.1.2 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'epby1rqo' /* - Monedero.
                - Registro del usu... */
                                    ,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 8, 0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'eh0oyx4v' /* 1.1.1 */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '77mra8yk' /* - Pantalla de login 
                - Logos.
                ... */
                                    ,
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0, 1),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 50,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: FFLocalizations.of(context).getText(
                        'x68ldtdr' /* Cancelar */,
                      ),
                      options: FFButtonOptions(
                        height: 40,
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: FFLocalizations.of(context).getText(
                        'cy9t16g6' /* Aceptar */,
                      ),
                      options: FFButtonOptions(
                        height: 40,
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                ),
                        elevation: 3,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
