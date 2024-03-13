import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reservatu_pista/backend/server_node.dart/usuario_existe_nick.dart';
import 'package:reservatu_pista/utils/format_number.dart';
import '../../../../backend/apis/direccion_nominatim.dart';
import '../../../../backend/server_node.dart/subir_image_node.dart';
import '../../../../backend/server_node.dart/usuario_node.dart';
import '../../../../utils/animations/list_animations.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../utils/dialog/rich_alert.dart';
import '../../../../utils/state_getx/state_mixin_demo.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/terminos_condiciones.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:image/image.dart' as img;

import '../../../widgets/text_inputters/inputter_registro.dart';

class RegistrarUsuarioController extends GetxController
    with SingleGetTickerProviderMixin, StateMixin<bool> {
  // Traer datos de la api de codigo postal Nominatim
  StateRx<bool?> apiCodigoPostal = StateRx(Rx<bool?>(null));

  ///  State fields for stateful widgets in this page.
  final unfocusNode = FocusNode();
// State field(s) for nick widget.
  FocusNode nickFocusNode = FocusNode();
  TextEditingController nickController = TextEditingController();
  // State field(s) for nombre widget.
  FocusNode nombreFocusNode = FocusNode();
  TextEditingController nombreController = TextEditingController();
  // State field(s) for apellidos widget.
  FocusNode apellidosFocusNode = FocusNode();
  TextEditingController apellidosController = TextEditingController();
  // State field(s) for sexo widget.
  FocusNode sexoFocusNode = FocusNode();
  TextEditingController sexoController = TextEditingController();
  // State field(s) for dni widget.
  FocusNode dniFocusNode = FocusNode();
  TextEditingController dniController = TextEditingController();
  // State field(s) for telefono widget.
  FocusNode telefonoFocusNode = FocusNode();
  TextEditingController telefonoController = TextEditingController();
  // State field(s) for email widget.
  FocusNode emailFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  // State field(s) for socio widget.
  FocusNode socioFocusNode = FocusNode();
  TextEditingController empadronamientoController = TextEditingController();
  TextEditingController ladaController =
      TextEditingController(text: '🇪🇸 +34');
  TextEditingController fotoController = TextEditingController();
  TextEditingController letraController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController pisoController = TextEditingController();
  TextEditingController comunidadVecinosController = TextEditingController();
  TextEditingController comunidadController = TextEditingController();
  TextEditingController codigoPostalController = TextEditingController();
  TextEditingController localidadController = TextEditingController();
  TextEditingController provinciaController = TextEditingController();
  TextEditingController nivelController = TextEditingController();
  TextEditingController posicionController = TextEditingController();
  TextEditingController palaController = TextEditingController();
  TextEditingController modeloController = TextEditingController();
  TextEditingController juegoPorSemanaController = TextEditingController();
  TextEditingController clubFavoritoController = TextEditingController();
  TextEditingController contrasenaController = TextEditingController();
  TextEditingController contrasenaComprobarController = TextEditingController();
  FocusNode fotoFocusNode = FocusNode();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isValidateForms = false;
  RxBool checkboxTerminos = false.obs;
  RxBool contrasenaVisibility = false.obs;
  RxBool comprobarContrasenaVisibility = false.obs;
  // RxBool validateCheckbox = false.obs;
  RxBool validateExisteNick = false.obs;

  RxString nick = ''.obs;
  late AnimationController animTerminos;
  Rx<String?> imageFile = Rx<String?>(null);
  late ButtonsPage btns;
  bool isFocusNode = false;

  @override
  void onInit() {
    super.onInit();
    llenadoAutomatico();
    change(null, status: RxStatus.empty());
    btns = ButtonsPage(controller: this);
    animTerminos = animVibrate(vsync: this);
    debounce(contrasenaVisibility, (_) => contrasenaVisibility.value = false,
        time: const Duration(seconds: 3, milliseconds: 30));
    debounce(comprobarContrasenaVisibility,
        (_) => comprobarContrasenaVisibility.value = false,
        time: const Duration(seconds: 3, milliseconds: 30));
    debounce(nick, (value) async {
      existeNick(value);
    }, time: const Duration(seconds: 1));
  }

  llenadoAutomatico() {
    nombreController.text = 'Miguel Angel';
    apellidosController.text = 'Hernandez Martinez';
    sexoController.text = 'Hombre';
    dniController.text = '12345678D';
    ladaController.text = '🇪🇸 +34';
    telefonoController.text = '999999999';
    emailController.text = 'xhmigue@hotamil.com';
    direccionController.text = 'Peraleda';
    nickController.text = 'Miguel1';
    contrasenaComprobarController.text = '123456';
    contrasenaController.text = '123456';
  }

  /// Loading Codigo Postal
  void loadingNick(String val) {
    change(null, status: RxStatus.loading());
    nick.value = val;
  }

  /// Existe el Nick
  void existeNick(String nick) async {
    // Muestra el estado de carga
    change(null, status: RxStatus.loading());
    try {
      final existe = await getUsuarioExisteNick(nick);
      change(existe, status: RxStatus.success());
    } catch (error) {
      // En caso de error, muestra el mensaje de error
      change(false, status: RxStatus.success());
    }
  }

  /// Existe el Codigo Postal
  void existeCodigoPostal(String codigoPostal) async {
    if (codigoPostal.length == 5) {
      // Muestra el estado de carga
      apiCodigoPostal.changeStatus(RxStatusDemo.loading());
      try {
        final direccion = await getDireccionNominatim(codigoPostal);
        if (direccion is DireccionNominatim) {
          localidadController.text = direccion.localidad;
          comunidadController.text = direccion.comunidad;
          provinciaController.text = direccion.provincia;
          apiCodigoPostal.change(true, RxStatusDemo.success());
        } else {
          apiCodigoPostal.change(false, RxStatusDemo.success());
        }
      } catch (error) {
        // En caso de error, muestra el mensaje de error
        apiCodigoPostal.change(false, RxStatusDemo.success());
      }
    } else {
      apiCodigoPostal.changeStatus(RxStatusDemo.empty());
    }
  }

  /// Datos de todos los inputs
  DatosPersonalesNamesTextField datosPersonales() =>
      DatosPersonalesNamesTextField(
        nombre: PropertiesTextField(
            labelText: 'Nombre',
            textEditingController: nombreController,
            anim: animVibrate(vsync: this),
            maxLength: 40,
            onValidate: (val) => val!.length < 3 ? '' : null,
            inputFormatters: [SoloLetras()]),
        apellidos: PropertiesTextField(
            labelText: 'Apellidos',
            textEditingController: apellidosController,
            anim: animVibrate(vsync: this),
            maxLength: 40,
            onValidate: (val) => val!.length < 3 ? '' : null,
            inputFormatters: [SoloLetras()]),
        sexo: PropertiesTextField(
            labelText: 'Sexo',
            textEditingController: sexoController,
            isSelect: true,
            anim: animVibrate(vsync: this),
            listSelect: ['Hombre', 'Mujer'],
            maxLength: 10),
        dni: PropertiesTextField(
            labelText: 'DNI',
            // focusNode: dniFocusNode,
            textEditingController: dniController,
            anim: animVibrate(vsync: this),
            maxLength: 9,
            inputFormatters: [SinEspaciosInputFormatter(), DNI8digitos1Letra()],
            onValidate: (val) => val!.length != 9 ? '' : null),
        lada: PropertiesTextField(
          labelText: '',
          textEditingController: ladaController,
          isSelect: true,
          listSelect: ['🇪🇸 +34', '🇵🇹 +351', '🇲🇫 +33', '🇲🇽 +52'],
          anim: animVibrate(vsync: this),
          maxLength: 8,
        ),
        telefono: PropertiesTextField(
            labelText: 'Telefono',
            textEditingController: telefonoController,
            keyboardType: TextInputType.phone,
            anim: animVibrate(vsync: this),
            maxLength: 9,
            inputFormatters: [SinEspaciosInputFormatter(), SoloNumeros()],
            onValidate: (val) => val!.length != 9 ? '' : null),
        email: PropertiesTextField(
            labelText: 'Email',
            textEditingController: emailController,
            anim: animVibrate(vsync: this),
            maxLength: 40,
            inputFormatters: [SinEspaciosInputFormatter()],
            onValidate: (val) {
              // Utilizar una expresión regular para validar el formato de correo electrónico
              if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                  .hasMatch(val!)) {
                return '';
              }
              return null;
            }),
      );
  List<PropertiesTextField> datosUbicacion() => DatosUbicacionNamesTextField(
        socio: PropertiesTextField(
            labelText: 'Empadronamiento',
            textEditingController: empadronamientoController,
            anim: animVibrate(vsync: this),
            maxLength: 40,
            isRequired: false),
        comunidadVecinos: PropertiesTextField(
            labelText: 'Comunidad de vecinos',
            textEditingController: comunidadVecinosController,
            anim: animVibrate(vsync: this),
            maxLength: 9,
            isRequired: false),
        direccion: PropertiesTextField(
            labelText: 'Dirección',
            // focusNode: FocusNode(),
            textEditingController: direccionController,
            anim: animVibrate(vsync: this),
            maxLength: 50),
        codigoPostal: PropertiesTextField(
            labelText: 'Código Postal',
            // focusNode: FocusNode(),
            textEditingController: codigoPostalController,
            anim: animVibrate(vsync: this),
            keyboardType: TextInputType.number,
            maxLength: 5,
            inputFormatters: [SinEspaciosInputFormatter(), SoloNumeros()],
            onValidate: (val) => val!.length != 5 ? '' : null),
        localidad: PropertiesTextField(
            labelText: 'Localidad',
            // focusNode: FocusNode(),
            textEditingController: localidadController,
            anim: animVibrate(vsync: this),
            maxLength: 50),
        comunidad: PropertiesTextField(
            labelText: 'Comunidad',
            // focusNode: FocusNode(),
            textEditingController: comunidadController,
            anim: animVibrate(vsync: this),
            maxLength: 50),
        provincia: PropertiesTextField(
            labelText: 'Provincia',
            // focusNode: FocusNode(),
            textEditingController: provinciaController,
            anim: animVibrate(vsync: this),
            maxLength: 50),
      ).listProperty();
  DatosJuegoNamesTextField datosJuego() => DatosJuegoNamesTextField(
        nick: PropertiesTextField(
            labelText: 'Nick',
            // focusNode: nickFocusNode,
            textEditingController: nickController,
            anim: animVibrate(vsync: this),
            maxLength: 20,
            inputFormatters: [SinEspaciosInputFormatter()],
            onValidate:
                (val) => // Utilizar una expresión regular para validar alfanumérico
                    RegExp(r'^[0-9]+$').hasMatch(val!) ? '' : null),
        nivel: PropertiesTextField(
            labelText: 'Nivel',
            // focusNode: FocusNode(),
            textEditingController: nivelController,
            isSelect: true,
            listSelect: List<String>.generate(
                40,
                (index) => FormatNumber.formatNumberWithTwoDecimals(
                    (0.25 + (index * 0.25)))),
            anim: animVibrate(vsync: this),
            maxLength: 15,
            isRequired: false),
        position: PropertiesTextField(
            labelText: 'Posición',
            // focusNode: FocusNode(),
            textEditingController: posicionController,
            isSelect: true,
            listSelect: ['Drive', 'Reves', 'Ambos'],
            anim: animVibrate(vsync: this),
            maxLength: 50,
            isRequired: false),
        pala: PropertiesTextField(
            labelText: 'Marca de pala',
            // focusNode: FocusNode(),
            textEditingController: palaController,
            anim: animVibrate(vsync: this),
            isSelect: true,
            listSelect: [
              'ADIDAS',
              'AKKERON',
              'AES',
              'BABOLAT',
              'BLACK CROW',
              'BULLPADEL',
              'DROP SHOT',
              'DUNLOP',
              'ECLYPSE',
              'ENEBE',
              'HEAD',
              'J`AYBER',
              'JOMA',
              'KELME'
                  'LEGEND',
              'MUNICH',
              'NOX',
              'SET',
              'SIUX',
              'STARTVIE',
              'STARVIE',
              'VARLION',
              'VIBORA',
              'WILSON'
            ],
            maxLength: 50,
            isRequired: false),
        modelo: PropertiesTextField(
            labelText: 'Modelo de pala',
            // focusNode: FocusNode(),
            textEditingController: modeloController,
            anim: animVibrate(vsync: this),
            maxLength: 50,
            isRequired: false),
        juegoPorSemana: PropertiesTextField(
            labelText: 'Juegos por semana',
            // focusNode: FocusNode(),
            textEditingController: juegoPorSemanaController,
            isSelect: true,
            listSelect: List.generate(10, (index) => (index + 1).toString()),
            anim: animVibrate(vsync: this),
            maxLength: 2,
            isRequired: false),
      );
  DatosContrasenaTextField datosContrasena() => DatosContrasenaTextField.init(
      tick: this,
      contrasenaController2: contrasenaComprobarController,
      contrasenaController: contrasenaController);

  /// Registrar Usuario
  void onPressedRegistrar() async {
    if (formKey.currentState!.validate() && checkboxTerminos.value) {
      try {
        // Obtener la fecha actual
        final DateTime now = DateTime.now();
        // Formatear la fecha en el formato deseado
        final String formattedDate =
            DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
        String nameFoto = now.millisecondsSinceEpoch.toString();
        if (imageFile.value![0] == '@') {
          // Nombre de la foto
          nameFoto = now.millisecondsSinceEpoch.toString();
          // Subir Imagen en nodejs y copiarAssetLocal
          await subirImageNode(
              await copiarAssetAFile(imageFile.value!.substring(1)),
              destination: 'usuarios',
              nameFoto: nameFoto);
        } else {
          // Nombre de la foto
          nameFoto = now.millisecondsSinceEpoch.toString();
          // Subir Imagen en nodejs y reducir su tamano
          await subirImageNode(await imageResize(imageFile.value!),
              destination: 'usuarios', nameFoto: nameFoto);
        }

        /// Insertar los datos en SQL en la tabla
        List<int> bytes = utf8.encode(contrasenaController.text);
        String hashConstrasena = sha1.convert(bytes).toString();
        final nombre = nombreController.text;
        final apellidos = apellidosController.text;
        final sexo = sexoController.text;
        final DNI = dniController.text;
        final lada = ladaController.text.split(" ")[1];
        final telefono = telefonoController.text;
        final email = emailController.text;
        final empadronamiento = empadronamientoController.text;
        final comunidad_de_vecinos = comunidadVecinosController.text;
        final direccion = direccionController.text;
        final codigo_postal = codigoPostalController.text;
        final localidad = localidadController.text;
        final provincia = provinciaController.text;
        final comunidad = comunidadController.text;
        final nick = nickController.text;
        final nivel = nivelController.text;
        final posicion = posicionController.text;
        final marca_pala = palaController.text;
        final modelo_pala = modeloController.text;
        final juegos_semana = juegoPorSemanaController.text;
        final contrasena = hashConstrasena;
        final foto = nameFoto;
        final fecha_registro = formattedDate;

        final datosSQL = [
          nombre,
          apellidos,
          sexo,
          DNI,
          lada,
          telefono,
          email,
          empadronamiento,
          comunidad_de_vecinos,
          direccion,
          codigo_postal,
          localidad,
          provincia,
          comunidad,
          nick,
          nivel,
          posicion,
          marca_pala,
          modelo_pala,
          juegos_semana,
          contrasena,
          foto,
          fecha_registro
        ];
        await anadirUsuarioNode(datosSQL);

        /// Regresar al inicio y enviar el email.
        await Get.dialog(RichAlertDialog(
          //uses the custom alert dialog
          alertTitle: richTitle("Registro usuario"),
          alertSubtitle:
              richSubtitle("Compruebe su correo para finalizar el registro."),
          textButton: "Ir a Login",
          alertType: RichAlertType.SUCCESS,
          onPressed: () {
            Get.offAllNamed(Routes.LOGIN_USUARIO, arguments: 0);
          },
        ));
      } catch (e) {
        print(e);
      }
    } else {
      if (!checkboxTerminos.value) {
        animTerminos.forward();
      }
      // validateCheckbox.value = true;
    }
  }

  /// Reducir imagen
  Future<File> imageResize(String path) async {
    // Imagen decoded
    img.Image image = img.decodeImage(File(path).readAsBytesSync())!;
    // Reducir la calidad de la imagen (ajusta el valor 70 según tus necesidades)
    img.Image compressedImage = img.copyResize(
      image,
      width: 150,
      height: 300,
    );
    // Regresar la imagen comprimida
    return File(path)
      ..writeAsBytesSync(img.encodeJpg(compressedImage, quality: 60));
  }

  Future<File> copiarAssetAFile(String path) async {
    try {
      // Especifica el path relativo del activo
      String pathAsset = 'assets/images/$path.png';
      // Obtiene el contenido del activo como bytes
      List<int> bytes = await rootBundle
          .load(pathAsset)
          .then((byteData) => byteData.buffer.asUint8List());
      // Obtiene el directorio temporal del sistema
      Directory tempDir = await getTemporaryDirectory();
      // Crea un archivo temporal con el contenido del activo
      File tempFile = File('${tempDir.path}/image_asset.png');
      return await tempFile.writeAsBytes(bytes);
    } catch (error) {
      throw ('Error al copiar el activo a un archivo: $error');
    }
  }

  String? validateTextField(BuildContext context, String? text,
      AnimationController anim, FocusNode focusNode, String nameData) {
    if (text == null || text.isEmpty) {
      FocusScope.of(context).requestFocus(focusNode);
      anim.forward();
      return '';
    }
    return null;
  }

  String? validateTextFieldContrasena(
      AnimationController anim, FocusNode focusNode, String nameData) {
    if (contrasenaController.text.isEmpty) {
      if (!isFocusNode) {
        isFocusNode = true;
        focusNode.requestFocus();
      }
      anim.forward();
      return '';
    }
    if (contrasenaController.text.length < 6) {
      if (!isFocusNode) {
        isFocusNode = true;
        focusNode.requestFocus();
      }
      anim.forward();
      return '';
    }
    if (contrasenaController.text != contrasenaComprobarController.text) {
      if (!isFocusNode) {
        isFocusNode = true;
        focusNode.requestFocus();
      }
      anim.forward();
      return '';
    }
    return null;
  }

  String? validateTextFieldContrasenaComprobar(
      AnimationController anim, FocusNode focusNode, String nameData) {
    if (contrasenaController.text.isEmpty) {
      if (!isFocusNode) {
        isFocusNode = true;
        focusNode.requestFocus();
      }
      anim.forward();
      return '';
    }
    if (contrasenaComprobarController.text.length < 6) {
      if (!isFocusNode) {
        isFocusNode = true;
        focusNode.requestFocus();
      }
      anim.forward();
      return 'La contraseña debe tener minimo 6 dígitos.';
    }
    if (contrasenaController.text != contrasenaComprobarController.text) {
      if (!isFocusNode) {
        isFocusNode = true;
        focusNode.requestFocus();
      }
      anim.forward();
      return 'La contraseña no coinciden.';
    }
    return null;
  }

  void onChangeTextField(String text) {
    if (isValidateForms && text.isNotEmpty) {
      isValidateForms = false;
      !formKey.currentState!.validate();
    }
  }

  Future<void> pickImage(ImageSource source, {String? path}) async {
    if (path != null) {
      imageFile.value = '@$path';
    } else {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        imageFile.value = pickedFile.path;
        fotoController.text = 'IMG';
      }
    }
  }

  @override
  void onClose() {
    unfocusNode.dispose();
    nickFocusNode.dispose();
    nickController.dispose();

    nombreFocusNode.dispose();
    nombreController.dispose();

    apellidosFocusNode.dispose();
    apellidosController.dispose();

    sexoFocusNode.dispose();
    sexoController.dispose();

    dniFocusNode.dispose();
    dniController.dispose();

    telefonoFocusNode.dispose();
    telefonoController.dispose();
    emailFocusNode.dispose();
    emailController.dispose();
    socioFocusNode.dispose();
    empadronamientoController.dispose();
    contrasenaController.dispose();
    contrasenaComprobarController.dispose();
    super.onClose();
  }
}

class ButtonsPage {
  late RegistrarUsuarioController controller;
  ButtonsPage({required this.controller});
  camera() {
    controller.pickImage(ImageSource.camera);
    Get.back();
  }

  galeria() {
    controller.pickImage(ImageSource.gallery);
    Get.back();
  }

  imageLocal(String path) {
    controller.pickImage(ImageSource.camera, path: path);
    Get.back();
  }

  ButtonsPage.termsAndConditions() {
    Get.dialog(const TermConditions());
  }
  cancel() {}
}

class PropertiesTextField {
  PropertiesTextField(
      {required this.labelText,
      required this.anim,
      required this.maxLength,
      this.keyboardType,
      required this.textEditingController,
      this.isSelect = false,
      this.onValidate,
      this.listSelect,
      this.inputFormatters,
      this.isRequired = true});

  final String labelText;
  final bool isSelect;
  final AnimationController anim;
  final int maxLength;
  final List<String>? listSelect;
  final TextInputType? keyboardType;
  final FocusNode focusNode = FocusNode();
  final TextEditingController textEditingController;
  final bool isRequired;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? onValidate;

  String? validateTextField(String? text) {
    if (text == null || text.isEmpty) {
      FocusScope.of(Get.context!).requestFocus(focusNode);
      anim.forward();
      return '';
    }
    return onValidate == null ? null : onValidate!(text);
  }
}

class DatosPersonalesNamesTextField {
  DatosPersonalesNamesTextField({
    this.nombre,
    this.apellidos,
    this.sexo,
    this.dni,
    this.lada,
    this.telefono,
    this.email,
  });
  final PropertiesTextField? nombre;
  final PropertiesTextField? apellidos;
  final PropertiesTextField? sexo;
  final PropertiesTextField? lada;
  final PropertiesTextField? dni;
  final PropertiesTextField? telefono;
  final PropertiesTextField? email;
  List<PropertiesTextField> listProperty() {
    return [
      nombre!,
      apellidos!,
      sexo!,
      dni!,
      telefono!,
      email!,
    ];
  }

  List<PropertiesTextField> listTopProperty() {
    return [
      nombre!,
      apellidos!,
    ];
  }
}

class DatosUbicacionNamesTextField {
  DatosUbicacionNamesTextField({
    this.direccion,
    this.codigoPostal,
    this.localidad,
    this.provincia,
    this.socio,
    this.comunidad,
    this.comunidadVecinos,
  });
  final PropertiesTextField? socio;
  final PropertiesTextField? comunidad;
  final PropertiesTextField? direccion;
  final PropertiesTextField? codigoPostal;
  final PropertiesTextField? localidad;
  final PropertiesTextField? provincia;
  final PropertiesTextField? comunidadVecinos;
  List<PropertiesTextField> listProperty() {
    return [
      socio!,
      comunidadVecinos!,
      direccion!,
      codigoPostal!,
      localidad!,
      provincia!,
      comunidad!,
    ];
  }
}

class DatosJuegoNamesTextField {
  DatosJuegoNamesTextField({
    this.nick,
    this.nivel,
    this.position,
    this.pala,
    this.modelo,
    this.juegoPorSemana,
    this.clubFavorito,
  });
  final PropertiesTextField? nick;
  final PropertiesTextField? nivel;
  final PropertiesTextField? position;
  final PropertiesTextField? pala;
  final PropertiesTextField? modelo;
  final PropertiesTextField? juegoPorSemana;
  final PropertiesTextField? clubFavorito;
  List<PropertiesTextField> listProperty() {
    return [
      nivel!,
      position!,
      pala!,
      modelo!,
      juegoPorSemana!,
    ];
  }
}

class DatosContrasenaTextField {
  DatosContrasenaTextField({
    required this.contrasena,
    required this.comprobarContrasena,
  });
  factory DatosContrasenaTextField.init(
      {required TickerProvider tick,
      required TextEditingController contrasenaController,
      required TextEditingController contrasenaController2}) {
    return DatosContrasenaTextField(
      contrasena: PropertiesTextField(
          labelText: 'Contraseña',
          anim: animVibrate(vsync: tick),
          maxLength: 15,
          textEditingController: contrasenaController),
      comprobarContrasena: PropertiesTextField(
          labelText: 'Comprobar contraseña',
          anim: animVibrate(vsync: tick),
          maxLength: 15,
          textEditingController: contrasenaController2),
    );
  }
  final PropertiesTextField contrasena;
  final PropertiesTextField comprobarContrasena;
}
