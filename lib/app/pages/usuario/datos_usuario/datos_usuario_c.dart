import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reservatu_pista/utils/format_number.dart';
import '../../../../backend/apis/direccion_nominatim.dart';
import '../../../../backend/server_node.dart/subir_image_node.dart';
import '../../../../backend/server_node.dart/usuario_node.dart';
import '../../../../utils/animations/list_animations.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../utils/dialog/rich_alert.dart';
import '../../../../utils/state_getx/state_mixin_demo.dart';
import '../../../routes/database.dart';
import '../../../routes/models/usuario_model.dart';
import '../../../widgets/terminos_condiciones.dart';
import 'package:image/image.dart' as img;

enum ImagenType { network, file }

class TiposImagenes {
  String pathOrUrl;
  ImagenType type;
  TiposImagenes(this.pathOrUrl, this.type);
}

class DatosUsuarioController extends GetxController
    with SingleGetTickerProviderMixin {
  // Traer datos de la api de codigo postal Nominatim
  StateRx<bool?> apiCodigoPostal = StateRx(Rx<bool?>(null));
  // Datos de la api datos del usuario
  StateRx<bool?> apidatosUsuario = StateRx(Rx<bool?>(null));

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
  FocusNode fotoFocusNode = FocusNode();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isValidateForms = false;
  RxBool checkboxTerminos = false.obs;
  RxBool validateCheckbox = false.obs;
  RxBool validateExisteNick = false.obs;
  bool modificarDatos = false;

  RxString nick = ''.obs;
  late AnimationController animTerminos;
  Rx<TiposImagenes?> imageFile = Rx<TiposImagenes?>(null);
  late ButtonsPage btns;
  bool isFocusNode = false;

  /// Variable usada para ver los cambios en la lista
  UsuarioModel? usuarioModel;
  DatabaseController db = Get.find();

  @override
  void onInit() {
    super.onInit();
    apidatosUsuario.initStatus(RxStatusDemo.loading());
    getDatosUsuario();
    btns = ButtonsPage(controller: this);
    animTerminos = animVibrate(vsync: this);
  }

  getDatosUsuario() async {
    try {
      final result = await getUsuarioNode('1');
      if (result is UsuarioModel) {
        final List<String> listLada = [
          '🇪🇸 +34',
          '🇵🇹 +351',
          '🇲🇫 +33',
          '🇲🇽 +52'
        ];
        String lada = '';
        for (var element in listLada) {
          if (result.lada == element.split(' ')[1]) {
            lada = element;
          }
        }
        nombreController.text = result.nombre;
        apellidosController.text = result.apellidos;
        sexoController.text = result.sexo;
        dniController.text = result.dni;
        ladaController.text = lada;
        telefonoController.text = result.telefono;
        emailController.text = result.email;
        empadronamientoController.text = result.empadronamiento;
        comunidadVecinosController.text = result.comunidadDeVecinos;
        direccionController.text = result.direccion;
        codigoPostalController.text = result.codigoPostal.toString();
        localidadController.text = result.localidad;
        provinciaController.text = result.provincia;
        comunidadController.text = result.comunidad;
        nickController.text = result.nick;
        nivelController.text = result.nivel;
        posicionController.text = result.posicion;
        palaController.text = result.marcaPala;
        modeloController.text = result.modeloPala;
        juegoPorSemanaController.text = result.juegosSemana;
        imageFile.value = result.foto[0] == '@'
            ? TiposImagenes(result.foto, ImagenType.file)
            : TiposImagenes(result.foto, ImagenType.network);
        // datosUsuario.value.change(true, RxStatusDemo.success());
        apidatosUsuario.change(true, RxStatusDemo.success());
        // datosUsuario.refresh();
        usuarioModel = result;
      }
    } catch (e) {
      apidatosUsuario.change(
          null, RxStatusDemo.error('No se encontraron datos.'));
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
            maxLength: 40),
        apellidos: PropertiesTextField(
            labelText: 'Apellidos',
            textEditingController: apellidosController,
            anim: animVibrate(vsync: this),
            maxLength: 40),
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
            maxLength: 9),
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
            maxLength: 9),
        email: PropertiesTextField(
            labelText: 'Email',
            textEditingController: emailController,
            anim: animVibrate(vsync: this),
            maxLength: 40),
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
            maxLength: 50,
            isRequired: false),
        codigoPostal: PropertiesTextField(
            labelText: 'Código Postal',
            // focusNode: FocusNode(),
            textEditingController: codigoPostalController,
            anim: animVibrate(vsync: this),
            keyboardType: TextInputType.number,
            maxLength: 5,
            isRequired: false),
        localidad: PropertiesTextField(
            labelText: 'Localidad',
            // focusNode: FocusNode(),
            textEditingController: localidadController,
            anim: animVibrate(vsync: this),
            maxLength: 50,
            isRequired: false),
        comunidad: PropertiesTextField(
            labelText: 'Comunidad',
            // focusNode: FocusNode(),
            textEditingController: comunidadController,
            anim: animVibrate(vsync: this),
            maxLength: 50,
            isRequired: false),
        provincia: PropertiesTextField(
            labelText: 'Provincia',
            // focusNode: FocusNode(),
            textEditingController: provinciaController,
            anim: animVibrate(vsync: this),
            maxLength: 50,
            isRequired: false),
      ).listProperty();
  DatosJuegoNamesTextField datosJuego() => DatosJuegoNamesTextField(
        nick: PropertiesTextField(
            labelText: 'Nick',
            // focusNode: nickFocusNode,
            textEditingController: nickController,
            anim: animVibrate(vsync: this),
            maxLength: 20),
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

  /// Modificar Usuario
  void onPressedGuardarCambios() async {
    if (formKey.currentState!.validate()) {
      try {
        final Map verModificaciones = {
          "empadronamiento": {
            "seModifico":
                usuarioModel!.empadronamiento != empadronamientoController.text,
            "valorModificado": empadronamientoController.text
          },
          "comunidad_de_vecinos": {
            "seModifico": usuarioModel!.comunidadDeVecinos !=
                comunidadVecinosController.text,
            "valorModificado": comunidadVecinosController.text
          },
          "direccion": {
            "seModifico": usuarioModel!.direccion != direccionController.text,
            "valorModificado": direccionController.text
          },
          "codigo_postal": {
            "seModifico": usuarioModel!.codigoPostal.toString() !=
                codigoPostalController.text,
            "valorModificado": codigoPostalController.text
          },
          "localidad": {
            "seModifico": usuarioModel!.localidad != localidadController.text,
            "valorModificado": localidadController.text
          },
          "provincia": {
            "seModifico": usuarioModel!.provincia != provinciaController.text,
            "valorModificado": provinciaController.text
          },
          "comunidad": {
            "seModifico": usuarioModel!.comunidad != comunidadController.text,
            "valorModificado": comunidadController.text
          },
          "nivel": {
            "seModifico": usuarioModel!.nivel != nivelController.text,
            "valorModificado": nivelController.text
          },
          "posicion": {
            "seModifico": usuarioModel!.posicion != posicionController.text,
            "valorModificado": posicionController.text
          },
          "marca_pala": {
            "seModifico": usuarioModel!.marcaPala != palaController.text,
            "valorModificado": palaController.text
          },
          "modelo_pala": {
            "seModifico": usuarioModel!.modeloPala != modeloController.text,
            "valorModificado": modeloController.text
          },
          "juegos_semana": {
            "seModifico":
                usuarioModel!.juegosSemana != juegoPorSemanaController.text,
            "valorModificado": juegoPorSemanaController.text
          },
          "foto": {
            "seModifico": usuarioModel!.foto != imageFile.value!.pathOrUrl,
            "valorModificado": imageFile.value!.pathOrUrl
          },
        };

        List listModificaciones = verModificaciones.keys.toList();
        List datosSQL = [];
        List<String> datosModificados = [];

        for (String _ in listModificaciones) {
          if (verModificaciones[_]['seModifico']) {
            datosSQL.add(verModificaciones[_]['valorModificado']);
            datosModificados.add(_);
          }
        }

        if (datosModificados.isNotEmpty) {
          await modificarUsuarioNode(
              usuarioModel!.idUsuario, datosSQL, datosModificados);
        }

        /// Regresar al inicio y enviar el email.
        await Get.dialog(RichAlertDialog(
          //uses the custom alert dialog
          alertTitle: richTitle("Datos usuario"),
          alertSubtitle: richSubtitle(
              "Los datos del usuario\nse han modificado correctamente."),
          textButton: "Aceptar",
          alertType: RichAlertType.SUCCESS,
          onPressed: () {
            Get.back();
          },
        ));
      } catch (e) {
        print(e);
      }
    } else {
      validateCheckbox.value = true;
      animTerminos.forward();
    }
  }

  /// Reducir imagen
  Future<File> imageResize() async {
    // Imagen decoded
    img.Image image =
        img.decodeImage(File(imageFile.value!.pathOrUrl).readAsBytesSync())!;
    // Reducir la calidad de la imagen (ajusta el valor 70 según tus necesidades)
    img.Image compressedImage = img.copyResize(
      image,
      width: 150,
      height: 300,
    );
    // Regresar la imagen comprimida
    return File(imageFile.value!.pathOrUrl)
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

  void onChangeTextField(String text) {
    if (isValidateForms && text.isNotEmpty) {
      isValidateForms = false;
      !formKey.currentState!.validate();
    }
  }

  Future<void> pickImage(ImageSource source, {String? path}) async {
    if (path != null) {
      imageFile.value = TiposImagenes('@$path', ImagenType.file);
    } else {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        imageFile.value = TiposImagenes(pickedFile.path, ImagenType.file);
        fotoController.text = 'IMG';
      }
    }
  }

  Future<void> subirImage() async {
    try {
      // Es una imagen local
      if (imageFile.value!.pathOrUrl[0] == '@') {
        // Subir Imagen en nodejs y copiarAssetLocal
        await subirImageNode(
            await copiarAssetAFile(imageFile.value!.pathOrUrl.substring(1)),
            destination: 'usuarios',
            nameFoto: usuarioModel!.foto);
      } else {
        // Subir Imagen en nodejs y ajustar tamano
        await subirImageNode(await imageResize(),
            destination: 'usuarios', nameFoto: usuarioModel!.foto);
      }

      /// Actualizar Image
      db.imageServer =
          '${db.imageServer}?timestamp=${DateTime.now().millisecondsSinceEpoch}';
    } catch (e) {
      print(e);
    }
  }

  camera() async {
    try {
      await pickImage(ImageSource.camera);
      await subirImage();
    } catch (e) {
      print(e);
    } finally {
      Get.back();
    }
  }

  galeria() async {
    try {
      await pickImage(ImageSource.gallery);
      await subirImage();
    } catch (e) {
      print(e);
    } finally {
      Get.back();
    }
  }

  imageLocal(String path) async {
    try {
      await pickImage(ImageSource.camera, path: path);
      await subirImage();
    } catch (e) {
      print(e);
    } finally {
      Get.back();
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
    super.onClose();
  }
}

class ButtonsPage {
  late DatosUsuarioController controller;
  ButtonsPage({required this.controller});
  // camera() {
  //   controller.pickImage(ImageSource.camera);
  //   Get.back();
  // }

  // galeria() {
  //   controller.pickImage(ImageSource.gallery);
  //   Get.back();
  // }

  // imageLocal(String path) {
  //   controller.pickImage(ImageSource.camera, path: path);
  //   Get.back();
  // }

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
  final Function(String?)? onValidate;
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
