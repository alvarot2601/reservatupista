import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/utils/colores.dart';
// import 'package:reservatupista/app/utils/dialog/rich_alert.dart';
// import '../utils/resend/resend.dart';

class OlvideContrasenaController extends GetxController {
  int typeUser = Get.arguments;
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey0 = GlobalKey();
  bool validatorForm = false;
  RxBool stateEmail = false.obs;

  late Color lineColor;
  late Color focusedColor;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    if (typeUser == 0) {
      lineColor = Color.fromARGB(160, 43, 120, 220);
      focusedColor = Colores().usuario.primary;
    } else {
      lineColor = Color.fromARGB(160, 70, 239, 152);
      focusedColor = Colores().proveedor.primary;
    }
  }

  void restartValidate(String value) {
    if (value.isEmpty && validatorForm) {
      formKey0.currentState!.validate();
    }
  }

  // final resend = Resend(apiKey: 're_JD38dZYR_MXbwZkGi7MbUaeu7GvJZ8ytd');

  void resendSendEmail() async {
    if (formKey0.currentState!.validate()) {
      print("No esta validadp");
      try {
        // final state = await resend.sendEmail(
        //   from: 'onboarding@resend.dev',
        //   to: [emailController.text],
        //   subject: 'Envio de email desde ap reservatupista',
        //   text: 'Puedes restablecer tu contrasena.',
        // );
        stateEmail.value = true;
        // print(state);
      } catch (e) {
        print("wetyufufui");
        print(e.toString());
        // Get.dialog(RichAlertDialog(
        //   alertTitle: richTitle("Recuperar Contraseña"),
        //   alertSubtitle: richSubtitle(
        //       "Error: Algo ocurrio al enviar el email. Vuelva a intentarlo mas tarde."),
        //   alertType: RichAlertType.WARNING,
        //   textButton: "Cerrar",
        //   onPressed: () => Get.back(),
        // ));
      }
    }
    // resend.sendEmail(
    //   from: 'onboarding@resend.dev',
    //   to: [emailController.text],
    //   subject: 'Envio de email desde ap reservatupista',
    //   text: 'Puedes restablecer tu contrasena.',
    // );
  }
}
