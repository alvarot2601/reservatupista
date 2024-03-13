import 'package:get/get.dart';
import '../../../../utils/animations/list_animations.dart';
import '../../../routes/app_pages.dart';
import '../../../routes/database.dart';
import '../../../widgets/terminos_condiciones.dart';
import 'package:flutter/material.dart';

class LoginUsuarioController extends GetxController
    with SingleGetTickerProviderMixin {
  int? initialPage = Get.arguments;
  PageController pageViewController = PageController(
      initialPage: Get.arguments == null ? 0 : Get.arguments as int);
  final unfocusNode = FocusNode();
  // State field(s) for emailAddress widget.
  FocusNode emailAddressFocusNode = FocusNode();
  TextEditingController emailAddressController = TextEditingController();
  // State field(s) for password widget.
  FocusNode passwordFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();
  // State field(s) for emailAddress widget.
  FocusNode emailProfesionalAddressFocusNode = FocusNode();
  TextEditingController emailProfesionalAddressController =
      TextEditingController();
  // State field(s) for password widget.
  FocusNode passwordProfesionalFocusNode = FocusNode();
  TextEditingController passwordProfesionalController = TextEditingController();
  RxBool passwordProfesionalVisibility = false.obs;
  RxBool passwordVisibility = false.obs;
  String? Function(BuildContext, String?)?
      passwordProfesionalControllerValidator;
  // State field(s) for Checkbox widget.
  RxBool checkboxValueRecordarUsuario = false.obs;
  // State field(s) for Checkbox widget.
  RxBool checkboxValueTerminosUsuario = false.obs;
  // State field(s) for Checkbox widget.
  RxBool checkboxValueProveedor = false.obs;
  // State field(s) for Checkbox widget.
  RxBool checkboxValueTerminosProveedor = false.obs;

  RxBool validateTerminosUsuario = false.obs;
  RxBool validateTerminosProveedor = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isValidateForms = false;

  /// Animations
  late AnimationController animUsuario;
  late AnimationController animContrasena;
  late AnimationController animTerminosUsuario;
  late AnimationController animTerminosProveedor;

  DatabaseController db = Get.find();

  @override
  void onInit() {
    super.onInit();
    animUsuario = animVibrate(vsync: this);
    animContrasena = animVibrate(vsync: this);
    animTerminosUsuario = animVibrate(vsync: this);
    animTerminosProveedor = animVibrate(vsync: this);
    debounce(passwordVisibility, (_) => passwordVisibility.value = false,
        time: const Duration(seconds: 3, milliseconds: 30));
  }

  void onPressedUsuario() async {
    if (!checkboxValueTerminosUsuario.value) {
      validateTerminosUsuario.value = true;
      animTerminosUsuario.forward();
    } else {
      if (await db.getDatosUsuario()) {
        Get.offAllNamed(Routes.INICIO);
      } else {
        print("No se puede iniciar Usuario");
      }
    }
    isValidateForms = true;
    // chec
    // !formKey.currentState!.validate();
    // Get.offAllNamed(Routes.INICIO);
    // ButtonsPage.acceder();
  }

  void onPressedProveedor() async {
    if (!checkboxValueTerminosProveedor.value) {
      validateTerminosProveedor.value = true;
      animTerminosProveedor.forward();
    } else {
      if (await db.getDatosProveedor()) {
        Get.offAllNamed(Routes.INICIOPROFESIONAL);
      } else {
        print("No se puede iniciar Proveedor");
      }
    }
    isValidateForms = true;
    // chec
    // !formKey.currentState!.validate();
    // Get.offAllNamed(Routes.INICIO);
    // ButtonsPage.acceder();
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
  void dispose() {
    // Limpiar y liberar recursos
    unfocusNode.dispose();
    emailAddressFocusNode.dispose();
    emailAddressController.dispose();
    passwordFocusNode.dispose();
    passwordController.dispose();
    emailProfesionalAddressFocusNode.dispose();
    emailProfesionalAddressController.dispose();
    passwordProfesionalFocusNode.dispose();
    passwordProfesionalController.dispose();
    super.dispose();
  }
}

class ButtonsPage {
  ButtonsPage.acceder() {
    Get.offAllNamed(Routes.INICIO);
  }
  ButtonsPage.registrarte(String namePage) {
    Get.toNamed(namePage);
  }

  ButtonsPage.profesional() {
    Get.toNamed(Routes.LOGIN_PROFESIONAL);
  }
  ButtonsPage.termsAndConditions() {
    Get.dialog(TermConditions());
  }
}
