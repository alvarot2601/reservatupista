import 'package:get/get.dart';
import '../../../../utils/animations/list_animations.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/terminos_condiciones.dart';
import 'package:flutter/material.dart';

extension getInputName on Name {
  String get n => toString().substring('Name.'.length);
}

enum Name {
  nombreClub,
  cifNif,
  personaResponsable,
  tipo,
  nombreComercial,
  telefono,
  email,
  numeroCuenta,
  certificadoCuenta
}

class LoginProfesionalController extends GetxController
    with SingleGetTickerProviderMixin {
  final unfocusNode = FocusNode();
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  RxBool passwordVisibility = false.obs;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for Checkbox widget.
  RxBool checkboxValue1 = false.obs;
  // State field(s) for Checkbox widget.
  RxBool checkboxValue2 = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isValidateForms = false;

  /// Animations
  late AnimationController animUsuario;
  late AnimationController animContrasena;

  /// Initialization and disposal methods.
  @override
  void onInit() {
    super.onInit();
    animUsuario = animVibrate(vsync: this);
    animContrasena = animVibrate(vsync: this);
    debounce(passwordVisibility, (_) => passwordVisibility.value = false,
        time: const Duration(seconds: 3, milliseconds: 30));
  }

  void onPressedAcceder() async {
    isValidateForms = true;
    !formKey.currentState!.validate();
    ButtonsPage.acceder();
  }

  String? validateTextField(String? text, AnimationController anim) {
    if (text!.isEmpty) {
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

  @override
  void onClose() {
    // Limpiar y liberar recursos
    unfocusNode.dispose();
    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();
    super.onClose();
  }
}

class ButtonsPage {
  ButtonsPage.acceder() {
    Get.toNamed(Routes.INICIOPROFESIONAL);
  }
  ButtonsPage.registrarte() {
    Get.toNamed(Routes.REGISTRO_PROVEEDOR);
  }

  ButtonsPage.usuario() {
    Get.offAllNamed(Routes.LOGIN_USUARIO);
  }
  ButtonsPage.termsAndConditions() {
    Get.dialog(TermConditions());
  }
}
