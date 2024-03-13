import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../backend/apis/direccion_nominatim.dart';
import '../../../../backend/server_node.dart/proveedor_node.dart';
import '../../../../backend/server_node.dart/subir_image_node.dart';
import '../../../../utils/animations/list_animations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

import '../../../../utils/loader/color_loader.dart';
import '../../../../utils/state_getx/state_mixin_demo.dart';
import '../../../routes/database.dart';
import '../../../routes/models/proveedor_model.dart';
import '../../../widgets/terminos_condiciones.dart';
import '../../../widgets/text_inputters/inputter_registro.dart';

class DatosProveedorController extends GetxController
    with SingleGetTickerProviderMixin {
  // Datos de la api datos del usuario
  StateRx<bool?> apiDatosProveedor = StateRx(Rx<bool?>(null));
  // Traer datos de la api de codigo postal Nominatim
  StateRx<bool?> apiCodigoPostalFiscal = StateRx(Rx<bool?>(null));
  // Traer datos de la api de codigo postal Nominatim
  StateRx<bool?> apiCodigoPostal = StateRx(Rx<bool?>(null));
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Rx<String?> imageFile = Rx<String?>(null);
  Rx<String?> imageFileCertificado = Rx<String?>(null);
  late ButtonsPage btns;
  late AnimationController animTerminos;

  TextEditingController tipoController = TextEditingController();
  TextEditingController cifNifController = TextEditingController();
  TextEditingController direccionFiscalController = TextEditingController();
  TextEditingController codigoPostalFiscalController = TextEditingController();
  TextEditingController localidadFiscalController = TextEditingController();
  TextEditingController provinciaFiscalController = TextEditingController();
  TextEditingController comunidadFiscalController = TextEditingController();
  TextEditingController codigoIbanController = TextEditingController();
  TextEditingController certificadoCuentaController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidosController = TextEditingController();
  TextEditingController fijoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ladaController =
      TextEditingController(text: '🇪🇸 +34');
  TextEditingController telefonoController = TextEditingController();
  TextEditingController nombreComercialController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  TextEditingController codigoPostalController = TextEditingController();
  TextEditingController localidadController = TextEditingController();
  TextEditingController provinciaController = TextEditingController();
  TextEditingController comunidadController = TextEditingController();
  TextEditingController fotoController = TextEditingController();
  TextEditingController fechaRegistroController = TextEditingController();
  // El texto se guarda en un array en codigo Iban, de acuerdo al Widget
  List<String> listCodigoIban = ['', '', '', '', '', ''];

  /// Initialization and disposal methods.
  @override
  void onInit() {
    super.onInit();
    getDatosProveedor();
    btns = ButtonsPage(controller: this);
    animTerminos = animVibrate(vsync: this);
  }

  getDatosProveedor() async {
    apiDatosProveedor.initStatus(RxStatusDemo.loading());
    try {
      final result = await getProveedorNode('1');
      if (result is ProveedorModel) {
        final List<String> ListLada = [
          '🇪🇸 +34',
          '🇵🇹 +351',
          '🇲🇫 +33',
          '🇲🇽 +52'
        ];
        String lada = '';
        for (var element in ListLada) {
          if (result.lada == element.split(' ')[1]) {
            lada = element;
          }
        }
        tipoController.text = result.tipo;
        cifNifController.text = result.cifNif;
        direccionFiscalController.text = result.direccionFiscal;
        codigoPostalFiscalController.text =
            result.codigoPostalFiscal.toString();
        localidadFiscalController.text = result.localidadFiscal;
        provinciaFiscalController.text = result.provinciaFiscal;
        comunidadFiscalController.text = result.comunidadFiscal;
        codigoIbanController.text = result.codigoIban;
        certificadoCuentaController.text = result.certificadoCuenta;
        nombreController.text = result.nombre;
        apellidosController.text = result.apellidos;
        fijoController.text = result.fijo;
        emailController.text = result.email;
        ladaController.text = lada;
        telefonoController.text = result.telefono;
        nombreComercialController.text = result.nombreComercial;
        direccionController.text = result.direccion;
        codigoPostalController.text = result.codigoPostal.toString();
        localidadController.text = result.localidad;
        provinciaController.text = result.provincia;
        comunidadController.text = result.comunidad;
        fotoController.text = result.foto;
        imageFile.value = result.foto;
        imageFileCertificado.value = result.certificadoCuenta;
        apiDatosProveedor.change(true, RxStatusDemo.success());
      }
    } catch (e) {
      apiDatosProveedor.change(
          null, RxStatusDemo.error('No se encontraron datos.'));
    }
  }

  DatosFacturacionTextField datosFacturacion() => DatosFacturacionTextField(
        tipo: PropertiesTextField(
            labelText: 'Tipo',
            controller: tipoController,
            anim: animVibrate(vsync: this),
            maxLength: 20,
            isSelect: true,
            listSelect: ['Club', 'Ayuntamiento', 'Comunidad', 'Asociación']),
        cifNif: PropertiesTextField(
          labelText: 'CIF/NIF',
          controller: cifNifController,
          anim: animVibrate(vsync: this),
          maxLength: 9,
        ),
        direccionFiscal: PropertiesTextField(
          labelText: 'Dirección fiscal',
          controller: direccionFiscalController,
          anim: animVibrate(vsync: this),
          maxLength: 50,
        ),
        cp: PropertiesTextField(
          labelText: 'Código Postal',
          controller: codigoPostalFiscalController,
          anim: animVibrate(vsync: this),
          maxLength: 5,
          keyboardType: TextInputType.number,
          suffixIcon: apiCodigoPostalFiscal.obx(
              (state) => state!
                  ? const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    )
                  : const Icon(
                      Icons.cancel,
                      color: Colors.red,
                    ),
              onLoading: SizedBox(
                  width: 20,
                  child: ColorLoader(
                    radius: 8,
                    padding: const EdgeInsets.only(right: 1),
                  )),
              onEmpty: const SizedBox.shrink()),
        ),
        localidad: PropertiesTextField(
          labelText: 'Localidad',
          controller: localidadFiscalController,
          anim: animVibrate(vsync: this),
          maxLength: 50,
        ),
        provincia: PropertiesTextField(
          labelText: 'Provincia',
          controller: provinciaFiscalController,
          anim: animVibrate(vsync: this),
          maxLength: 50,
        ),
        comunidad: PropertiesTextField(
          labelText: 'Comunidad',
          controller: comunidadFiscalController,
          anim: animVibrate(vsync: this),
          maxLength: 50,
        ),
      );
  DatosPagoTextField datosPago() => DatosPagoTextField(
        numeroCuenta: PropertiesTextField(
            labelText: 'Número de cuenta',
            controller: codigoIbanController,
            anim: animVibrate(vsync: this),
            maxLength: 20,
            isSelect: true,
            listSelect: ['Club', 'Ayuntamiento', 'Comunidad', 'Asociación']),
        certificadoCuenta: PropertiesTextField(
          labelText: 'Certificado de cuenta',
          controller: certificadoCuentaController,
          anim: animVibrate(vsync: this),
          maxLength: 20,
          isImage: true,
        ),
      );
  DatosContactoTextField datosContacto() => DatosContactoTextField(
        nombre: PropertiesTextField(
            labelText: 'Nombre',
            controller: nombreController,
            anim: animVibrate(vsync: this),
            maxLength: 40),
        apellidos: PropertiesTextField(
          labelText: 'Apellidos',
          controller: apellidosController,
          anim: animVibrate(vsync: this),
          maxLength: 40,
        ),
        fijo: PropertiesTextField(
          labelText: 'Fijo',
          controller: fijoController,
          anim: animVibrate(vsync: this),
          keyboardType: TextInputType.number,
          maxLength: 9,
        ),
        lada: PropertiesTextField(
          labelText: '',
          controller: ladaController,
          isSelect: true,
          listSelect: ['🇪🇸 +34', '🇵🇹 +351', '🇲🇫 +33', '🇲🇽 +52'],
          anim: animVibrate(vsync: this),
          maxLength: 8,
        ),
        movil: PropertiesTextField(
          labelText: 'Telefono',
          controller: telefonoController,
          anim: animVibrate(vsync: this),
          keyboardType: TextInputType.number,
          maxLength: 9,
        ),
        email: PropertiesTextField(
          labelText: 'Email',
          controller: emailController,
          anim: animVibrate(vsync: this),
          maxLength: 40,
          keyboardType: TextInputType.emailAddress,
        ),
      );
  List<PropertiesTextField> datosUbicacion() => DatosUbicacionTextField(
        nombreComercial: PropertiesTextField(
          labelText: 'Nombre comercial',
          controller: nombreComercialController,
          anim: animVibrate(vsync: this),
          maxLength: 40,
        ),
        direccion: PropertiesTextField(
          labelText: 'Dirección',
          controller: direccionController,
          anim: animVibrate(vsync: this),
          maxLength: 40,
        ),
        cp: PropertiesTextField(
            labelText: 'Código Postal',
            controller: codigoPostalController,
            anim: animVibrate(vsync: this),
            maxLength: 5,
            keyboardType: TextInputType.number,
            suffixIcon: apiCodigoPostal.obx(
                (state) => state!
                    ? const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      )
                    : const Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                onLoading: SizedBox(
                    width: 20,
                    child: ColorLoader(
                      radius: 8,
                      padding: const EdgeInsets.only(right: 1),
                    )),
                onEmpty: const SizedBox.shrink()),
            inputFormatters: [SinEspaciosInputFormatter(), SoloNumeros()]),
        localidad: PropertiesTextField(
          labelText: 'Localidad',
          controller: localidadController,
          anim: animVibrate(vsync: this),
          maxLength: 40,
        ),
        provincia: PropertiesTextField(
          labelText: 'Provincia',
          controller: provinciaController,
          anim: animVibrate(vsync: this),
          maxLength: 30,
        ),
        comunidad: PropertiesTextField(
          labelText: 'Comunidad',
          controller: comunidadController,
          anim: animVibrate(vsync: this),
          maxLength: 50,
        ),
      ).listProperty();

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

  Future<void> pickImageCertificado(ImageSource source, {String? path}) async {
    if (path != null) {
      imageFileCertificado.value = '@$path';
    } else {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        imageFileCertificado.value = pickedFile.path;
      }
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

  String? validateTextField(BuildContext context, String? text,
      AnimationController anim, FocusNode focusNode, String nameData) {
    if (text == null || text.isEmpty) {
      FocusScope.of(context).requestFocus(focusNode);
      anim.forward();
      return '';
    }
    return null;
  }
}

class ButtonsPage {
  late DatosProveedorController controller;
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

  cameraCertificado() {
    controller.pickImageCertificado(ImageSource.camera);
    Get.back();
  }

  galeriaCertificado() {
    controller.pickImageCertificado(ImageSource.gallery);
    Get.back();
  }

  imageLocalCertificado(String path) {
    controller.pickImageCertificado(ImageSource.camera, path: path);
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
      required this.controller,
      this.keyboardType,
      this.isSelect = false,
      this.isImage = false,
      this.listSelect,
      this.onValidate,
      this.onChange,
      this.inputFormatters,
      this.suffixIcon});
  final String labelText;
  final bool isSelect;
  final bool isImage;
  final AnimationController anim;
  final int maxLength;
  final List<String>? listSelect;
  final TextInputType? keyboardType;
  final FocusNode focusNode = FocusNode();
  final TextEditingController controller;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? onValidate;
  final void Function(String)? onChange;

  String? validateTextField(String? text) {
    if (text == null || text.isEmpty) {
      FocusScope.of(Get.context!).requestFocus(focusNode);
      anim.forward();
      return '';
    }
    return onValidate == null ? null : onValidate!(text);
  }
}

class DatosFacturacionTextField {
  DatosFacturacionTextField({
    required this.cifNif,
    required this.tipo,
    required this.direccionFiscal,
    required this.cp,
    required this.localidad,
    required this.provincia,
    required this.comunidad,
  });
  final PropertiesTextField cifNif;
  final PropertiesTextField tipo;
  final PropertiesTextField direccionFiscal;
  final PropertiesTextField cp;
  final PropertiesTextField localidad;
  final PropertiesTextField provincia;
  final PropertiesTextField comunidad;
  List<PropertiesTextField> listProperty() {
    return [tipo, cifNif, direccionFiscal, cp, localidad, provincia, comunidad];
  }
}

class DatosPagoTextField {
  DatosPagoTextField({
    required this.numeroCuenta,
    required this.certificadoCuenta,
  });
  final PropertiesTextField numeroCuenta;
  final PropertiesTextField certificadoCuenta;
  List<PropertiesTextField> listProperty() {
    return [
      numeroCuenta,
      certificadoCuenta,
    ];
  }
}

class DatosContactoTextField {
  DatosContactoTextField({
    required this.nombre,
    required this.apellidos,
    required this.fijo,
    required this.lada,
    required this.movil,
    required this.email,
  });
  final PropertiesTextField nombre;
  final PropertiesTextField apellidos;
  final PropertiesTextField fijo;
  final PropertiesTextField movil;
  final PropertiesTextField lada;
  final PropertiesTextField email;
  List<PropertiesTextField> listProperty() {
    return [nombre, apellidos, fijo, email];
  }
}

class DatosUbicacionTextField {
  DatosUbicacionTextField({
    required this.nombreComercial,
    required this.direccion,
    required this.cp,
    required this.localidad,
    required this.provincia,
    required this.comunidad,
  });
  final PropertiesTextField nombreComercial;
  final PropertiesTextField direccion;
  final PropertiesTextField cp;
  final PropertiesTextField localidad;
  final PropertiesTextField provincia;
  final PropertiesTextField comunidad;
  List<PropertiesTextField> listProperty() {
    return [
      nombreComercial,
      direccion,
      cp,
      localidad,
      provincia,
      comunidad,
    ];
  }
}
