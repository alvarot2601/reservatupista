import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../utils/animations/list_animations.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../utils/dialog/rich_alert.dart';

// import '../../../../utils/dialog/rich_alert.dart';
// import '../../../routes/app_pages.dart';

class DatosController extends GetxController with SingleGetTickerProviderMixin {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode1;
  TextEditingController? emailAddressController1;
  String? Function(BuildContext, String?)? emailAddressController1Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode2;
  TextEditingController? emailAddressController2;
  String? Function(BuildContext, String?)? emailAddressController2Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode3;
  TextEditingController? emailAddressController3;
  String? Function(BuildContext, String?)? emailAddressController3Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode4;
  TextEditingController? emailAddressController4;
  String? Function(BuildContext, String?)? emailAddressController4Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode5;
  TextEditingController? emailAddressController5;
  String? Function(BuildContext, String?)? emailAddressController5Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode6;
  TextEditingController? emailAddressController6;
  String? Function(BuildContext, String?)? emailAddressController6Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode7;
  TextEditingController? emailAddressController7;
  String? Function(BuildContext, String?)? emailAddressController7Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode8;
  TextEditingController? emailAddressController8;
  String? Function(BuildContext, String?)? emailAddressController8Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode9;
  TextEditingController? emailAddressController9;
  String? Function(BuildContext, String?)? emailAddressController9Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode10;
  TextEditingController? emailAddressController10;
  String? Function(BuildContext, String?)? emailAddressController10Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode11;
  TextEditingController? emailAddressController11;
  String? Function(BuildContext, String?)? emailAddressController11Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode12;
  TextEditingController? emailAddressController12;
  String? Function(BuildContext, String?)? emailAddressController12Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode13;
  TextEditingController? emailAddressController13;
  String? Function(BuildContext, String?)? emailAddressController13Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode14;
  TextEditingController? emailAddressController14;
  String? Function(BuildContext, String?)? emailAddressController14Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode15;
  TextEditingController? emailAddressController15;
  String? Function(BuildContext, String?)? emailAddressController15Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode16;
  TextEditingController? emailAddressController16;
  String? Function(BuildContext, String?)? emailAddressController16Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode17;
  TextEditingController? emailAddressController17;
  String? Function(BuildContext, String?)? emailAddressController17Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode18;
  TextEditingController? emailAddressController18;
  String? Function(BuildContext, String?)? emailAddressController18Validator;
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
  TextEditingController socioController = TextEditingController();
  TextEditingController fotoController = TextEditingController();
  TextEditingController letraController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController pisoController = TextEditingController();
  TextEditingController codigoPostalController = TextEditingController();
  TextEditingController localidadController = TextEditingController();
  TextEditingController providenciaController = TextEditingController();
  TextEditingController nivelController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController palaController = TextEditingController();
  TextEditingController modeloController = TextEditingController();
  TextEditingController juegoPorSemanaController = TextEditingController();
  TextEditingController clubFavoritoController = TextEditingController();
  TextEditingController contrasenaController = TextEditingController();
  TextEditingController contrasenaController2 = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isValidateForms = false;

  Rx<String?> imageFile = Rx<String?>(null);
  late ButtonsSeleecionarImagen btns;
  bool isFocusNode = false;
  Map<String, String> saveData = {};

  /// Initialization and disposal methods.
  ///

  List<PropertiesTextField> listTextFieldDatosPersonales = [];
  List<PropertiesTextField> listTextFieldDatosUbicacion = [];
  List<PropertiesTextField> listTextFieldDatosJuego = [];
  @override
  void onInit() {
    super.onInit();
    llenadoInputsAutomatico();

    btns = ButtonsSeleecionarImagen(controller: this);
    final datosPersonales = DatosPersonalesNamesTextField(
      nick: PropertiesTextField(
          labelText: 'Nick',
          focusNode: nickFocusNode,
          textEditingController: nickController,
          anim: animVibrate(vsync: this),
          maxLength: 15),
      nombre: PropertiesTextField(
          labelText: 'Nombre',
          focusNode: nombreFocusNode,
          textEditingController: nombreController,
          anim: animVibrate(vsync: this),
          maxLength: 50),
      apellidos: PropertiesTextField(
          labelText: 'Apellidos',
          focusNode: apellidosFocusNode,
          textEditingController: apellidosController,
          anim: animVibrate(vsync: this),
          maxLength: 50),
      sexo: PropertiesTextField(
          labelText: 'Sexo',
          focusNode: sexoFocusNode,
          textEditingController: sexoController,
          isSelect: true,
          anim: animVibrate(vsync: this),
          listSelect: ['Hombre', 'Mujer'],
          maxLength: 50),
      dni: PropertiesTextField(
          labelText: 'DNI',
          focusNode: dniFocusNode,
          textEditingController: dniController,
          anim: animVibrate(vsync: this),
          maxLength: 8),
      telefono: PropertiesTextField(
          labelText: 'Telefono',
          focusNode: telefonoFocusNode,
          textEditingController: telefonoController,
          keyboardType: TextInputType.phone,
          anim: animVibrate(vsync: this),
          maxLength: 9),
      email: PropertiesTextField(
          labelText: 'Email',
          focusNode: emailFocusNode,
          textEditingController: emailController,
          anim: animVibrate(vsync: this),
          maxLength: 50),
    );
    final datosUbicacion = DatosUbicacionNamesTextField(
      socio: PropertiesTextField(
          labelText: 'Socio o Empadronamiento',
          focusNode: socioFocusNode,
          textEditingController: socioController,
          anim: animVibrate(vsync: this),
          maxLength: 50),
      direccion: PropertiesTextField(
          labelText: 'Dirección',
          focusNode: FocusNode(),
          textEditingController: direccionController,
          isSelect: true,
          listSelect: List<String>.generate(
              20, (index) => (0.25 * index + 1).toString()),
          anim: animVibrate(vsync: this),
          maxLength: 15),
      codigoPostal: PropertiesTextField(
          labelText: 'Codido Postal',
          focusNode: FocusNode(),
          textEditingController: codigoPostalController,
          anim: animVibrate(vsync: this),
          keyboardType: TextInputType.number,
          maxLength: 50),
      localidad: PropertiesTextField(
          labelText: 'Localidad',
          focusNode: FocusNode(),
          textEditingController: localidadController,
          anim: animVibrate(vsync: this),
          maxLength: 50),
      providencia: PropertiesTextField(
          labelText: 'Providencia',
          focusNode: FocusNode(),
          textEditingController: providenciaController,
          anim: animVibrate(vsync: this),
          maxLength: 50),
    );
    final datosJuego = DatosJuegoNamesTextField(
      nivel: PropertiesTextField(
          labelText: 'Nivel',
          focusNode: FocusNode(),
          textEditingController: nivelController,
          isSelect: true,
          listSelect: List<String>.generate(
              40, (index) => (0.25 + (index * 0.25)).toString()),
          anim: animVibrate(vsync: this),
          maxLength: 15),
      position: PropertiesTextField(
          labelText: 'Posición',
          focusNode: FocusNode(),
          textEditingController: positionController,
          isSelect: true,
          listSelect: ['Drive', 'Reves', 'Ambos'],
          anim: animVibrate(vsync: this),
          maxLength: 50),
      pala: PropertiesTextField(
          labelText: 'Pala',
          focusNode: FocusNode(),
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
            'LEGEND',
            'MUNICH',
            'NOX',
            'STARVIE',
            'VARLION',
            'WILSON'
          ],
          maxLength: 50),
      modelo: PropertiesTextField(
          labelText: 'Modelo de pala',
          focusNode: FocusNode(),
          textEditingController: modeloController,
          anim: animVibrate(vsync: this),
          maxLength: 50),
      juegoPorSemana: PropertiesTextField(
          labelText: 'Juegos por semana',
          focusNode: FocusNode(),
          textEditingController: juegoPorSemanaController,
          keyboardType: TextInputType.number,
          anim: animVibrate(vsync: this),
          maxLength: 1),
      clubFavorito: PropertiesTextField(
          labelText: 'Club favorito',
          focusNode: FocusNode(),
          textEditingController: clubFavoritoController,
          keyboardType: TextInputType.phone,
          anim: animVibrate(vsync: this),
          maxLength: 9),
    );
    listTextFieldDatosPersonales = datosPersonales.listProperty();
    listTextFieldDatosUbicacion = datosUbicacion.listProperty();
    listTextFieldDatosJuego = datosJuego.listProperty();
  }

  void llenadoInputsAutomatico() async {
    // if (GetStorage().read(
    //       'pathPhoto',
    //     ) !=
    //     null) {
    //   imageFile.value = GetStorage().read(
    //     'pathPhoto',
    //   );
    // }
    // final readData = GetStorage().read(
    //   'dataUser',
    // );
    final readData = {};
    if (readData is Map<String, String>) {
      nombreController.text = readData['Nombre']!;
      apellidosController.text = readData['Apellidos']!;
      sexoController.text = readData['Sexo']!;
      nickController.text = readData['Nick']!;
      socioController.text = readData['Socio o Empadronamiento']!;
      // fotoController.text = readData['']!;
      dniController.text = readData['DNI']!;
      letraController.text = "A";
      telefonoController.text = readData['Telefono']!;
      emailController.text = readData['Email']!;
      direccionController.text = readData['Dirección']!;
      numeroController.text = readData['Nombre']!;
      pisoController.text = readData['Nombre']!;
      codigoPostalController.text = readData['Codido Postal']!;
      localidadController.text = readData['Localidad']!;
      providenciaController.text = readData['Providencia']!;
      nivelController.text = readData['Nivel']!;
      positionController.text = readData['Posición']!;
      palaController.text = readData['Pala']!;
      modeloController.text = readData['Modelo de pala']!;
      juegoPorSemanaController.text = readData['Juegos por semana']!;
      clubFavoritoController.text = readData['Club favorito']!;
    } else {
      nombreController.text = "Miguel Angel";
      apellidosController.text = "Hernandez Martinez";
      socioController.text = 'Socio';
      sexoController.text = "Hombre";
      nickController.text = "migue";
      fotoController.text = "foto";
      dniController.text = "12345678";
      letraController.text = "A";
      telefonoController.text = "157894652";
      emailController.text = "xhpedro@gmail.com";
      direccionController.text = "avenida rosario";
      numeroController.text = "1";
      pisoController.text = "2";
      codigoPostalController.text = "30689";
      localidadController.text = "Peraleda de la Mata";
      providenciaController.text = "Extremadura";
      nivelController.text = "0.25";
      positionController.text = "Drive";
      palaController.text = "pala";
      modeloController.text = "modelo";
      juegoPorSemanaController.text = "1";
      clubFavoritoController.text = "club 1";
      contrasenaController.text = "123456";
      contrasenaController2.text = "123456";
    }
  }

  String? validateTextField(String? text, AnimationController anim,
      FocusNode? focusNode, String nameData) {
    if (text == null) {
      if (!isFocusNode) {
        isFocusNode = true;
        focusNode!.requestFocus();
      }
      anim.forward();
      return '';
    }
    if (text.isEmpty) {
      if (!isFocusNode) {
        isFocusNode = true;
        focusNode!.requestFocus();
      }
      anim.forward();
      return '';
    }
    saveData[nameData] = text;
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
      }
    }
  }

  void onPressedGuardar() async {
    isValidateForms = true;
    isFocusNode = false;
    if (formKey.currentState!.validate()) {
      try {
        // await GetStorage().write('dataUser', saveData);
        // if (imageFile.value != null) {
        //   await GetStorage().write('pathPhoto', imageFile.value!);
        // }
        await Get.dialog(RichAlertDialog(
          //uses the custom alert dialog
          alertTitle: richTitle("Datos modificados"),
          alertSubtitle: richSubtitle("Los datos se modificaron correctamente"),
          textButton: "Aceptar",
          alertType: RichAlertType.SUCCESS,
          onPressed: () {
            Get.back();
          },
        ));
      } catch (e) {}
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
    socioController.dispose();
    emailAddressFocusNode1?.dispose();
    emailAddressController1?.dispose();

    emailAddressFocusNode2?.dispose();
    emailAddressController2?.dispose();

    emailAddressFocusNode3?.dispose();
    emailAddressController3?.dispose();

    emailAddressFocusNode4?.dispose();
    emailAddressController4?.dispose();

    emailAddressFocusNode5?.dispose();
    emailAddressController5?.dispose();

    emailAddressFocusNode6?.dispose();
    emailAddressController6?.dispose();

    emailAddressFocusNode7?.dispose();
    emailAddressController7?.dispose();

    emailAddressFocusNode8?.dispose();
    emailAddressController8?.dispose();

    emailAddressFocusNode9?.dispose();
    emailAddressController9?.dispose();

    emailAddressFocusNode10?.dispose();
    emailAddressController10?.dispose();

    emailAddressFocusNode11?.dispose();
    emailAddressController11?.dispose();

    emailAddressFocusNode12?.dispose();
    emailAddressController12?.dispose();

    emailAddressFocusNode13?.dispose();
    emailAddressController13?.dispose();

    emailAddressFocusNode14?.dispose();
    emailAddressController14?.dispose();

    emailAddressFocusNode15?.dispose();
    emailAddressController15?.dispose();

    emailAddressFocusNode16?.dispose();
    emailAddressController16?.dispose();

    emailAddressFocusNode17?.dispose();
    emailAddressController17?.dispose();

    emailAddressFocusNode18?.dispose();
    emailAddressController18?.dispose();
    super.onClose();
  }
}

class ButtonsSeleecionarImagen {
  late DatosController controller;
  ButtonsSeleecionarImagen({required this.controller});
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

  cancel() {
    // Get.dialog(TermConditions());
  }
}

class PropertiesTextField {
  PropertiesTextField({
    required this.labelText,
    required this.anim,
    required this.maxLength,
    this.keyboardType,
    this.focusNode,
    required this.textEditingController,
    this.isSelect = false,
    this.listSelect,
  });

  final String labelText;
  final bool isSelect;
  final AnimationController anim;
  final int maxLength;
  final List<String>? listSelect;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final TextEditingController textEditingController;
}

class DatosPersonalesNamesTextField {
  DatosPersonalesNamesTextField({
    this.nick,
    this.nombre,
    this.apellidos,
    this.sexo,
    this.dni,
    this.telefono,
    this.email,
  });
  final PropertiesTextField? nick;
  final PropertiesTextField? nombre;
  final PropertiesTextField? apellidos;
  final PropertiesTextField? sexo;
  final PropertiesTextField? dni;
  final PropertiesTextField? telefono;
  final PropertiesTextField? email;
  List<PropertiesTextField> listProperty() {
    return [
      nick!,
      nombre!,
      apellidos!,
      sexo!,
      dni!,
      telefono!,
      email!,
    ];
  }
}

class DatosUbicacionNamesTextField {
  DatosUbicacionNamesTextField({
    this.direccion,
    this.codigoPostal,
    this.localidad,
    this.providencia,
    this.socio,
  });
  final PropertiesTextField? socio;
  final PropertiesTextField? direccion;
  final PropertiesTextField? codigoPostal;
  final PropertiesTextField? localidad;
  final PropertiesTextField? providencia;
  List<PropertiesTextField> listProperty() {
    return [socio!, direccion!, codigoPostal!, localidad!, providencia!];
  }
}

class DatosJuegoNamesTextField {
  DatosJuegoNamesTextField({
    this.nivel,
    this.position,
    this.pala,
    this.modelo,
    this.juegoPorSemana,
    this.clubFavorito,
  });
  final PropertiesTextField? nivel;
  final PropertiesTextField? position;
  final PropertiesTextField? pala;
  final PropertiesTextField? modelo;
  final PropertiesTextField? juegoPorSemana;
  final PropertiesTextField? clubFavorito;
  List<PropertiesTextField> listProperty() {
    return [nivel!, position!, pala!, modelo!, juegoPorSemana!, clubFavorito!];
  }
}
