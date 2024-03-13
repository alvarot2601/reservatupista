import '/flutter_flow/flutter_flow_util.dart';
import 'seleccionar_imagen_widget.dart' show SeleccionarImagenWidget;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SeleccionarImagenModel extends FlutterFlowModel<SeleccionarImagenWidget> {
  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

// onPressedCamera

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      // imageFile.value = File(pickedFile.path);
      // validatorPickImage.value = false;
      // fotoController.text = imageFile.value!.path;
      // restartValidate(fotoController.text);
    }
  }
}

// class ButtonsSeleecionarImagen {
//   ButtonsSeleecionarImagen.camera() {
//     // Get.offAllNamed(Routes.INICIO);
//   }
//   ButtonsSeleecionarImagen.galeria() {
//     // Get.toNamed(Routes.REGISTRAR_USUARIO);
//   }
//   ButtonsSeleecionarImagen.cancel() {
//     // Get.dialog(TermConditions());
//   }
// }
