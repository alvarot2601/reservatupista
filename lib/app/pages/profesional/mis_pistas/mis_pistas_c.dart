import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../../../backend/server_node.dart/get_pistas_node.dart';
import '../../../../flutter_flow/flutter_flow_animations.dart';
import '../../../routes/models/pistas_model.dart';

class MisPistasController extends GetxController
    with SingleGetTickerProviderMixin, StateMixin<List<PistasModel>> {
  final anims = {
    'anim': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 800.ms,
          begin: const Offset(50.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };
  List<PistasModel> pistas = [];

  @override
  void onReady() {
    cargarDatos();
    // TODO: implement onReady
    super.onReady();
  }

  /// Initialization and disposal methods.
  @override
  void onInit() async {
    super.onInit();
    // debounce(
    //     pistas,
    //     (callback) => callback.isNotEmpty
    //         ? SchedulerBinding.instance.addPostFrameCallback((_) async =>
    //             await animationsMap['containerOnPageLoadAnimation']!
    //                 .controller
    //                 .forward(from: 0.0))
    //         : null,
    //     time: const Duration(milliseconds: 100));
    print("---------------------------");

    setupAnimations(
      anims.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
    // print(pistas);
  }

  // Método para cargar datos
  void cargarDatos() async {
    // Muestra el estado de carga
    change(null, status: RxStatus.loading());

    try {
      pistas = await getPistas();
      print("SDjdkpd");
      print(pistas);
      change(pistas, status: RxStatus.success());
    } catch (error) {
      // En caso de error, muestra el mensaje de error
      change(null, status: RxStatus.error('Error al cargar datos: $error'));
    }
  }
}
