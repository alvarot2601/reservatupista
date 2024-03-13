import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservatu_pista/flutter_flow/flutter_flow_animations.dart';
import 'package:reservatu_pista/utils/colores.dart';
import '../../../../backend/schema/enums/enums.dart';
import '../../../../backend/server_node.dart/get_pistas_node.dart';
import '../../../../components/navbar_y_appbar_profesional.dart';
import '../../../../flutter_flow/flutter_flow_theme.dart';
import '../../../routes/models/pistas_model.dart';
import './mis_pistas_c.dart';

class MisPistasPage extends GetView<MisPistasController> {
  const MisPistasPage({super.key});

  MisPistasController get self => controller;
  @override
  Widget build(BuildContext context) {
    return NavbarYAppbarProfesional(
      title: 'Mis Pistas',
      page: TypePage.MisReservas,
      child: Expanded(
        child: SingleChildScrollView(
            child: self.obx((state) => Column(
                  mainAxisSize: MainAxisSize.max,
                  children: generatePistas(context, state),
                ))),
      ),
    );
  }

  List<Widget> generatePistas(BuildContext context, List<PistasModel>? lista) {
    return lista!
        .map(
          (_) => Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
            child: Container(
              height: 100.0,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Colores().proveedor.primary,
                    offset: const Offset(1.0, 1.0),
                  )
                ],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        2.0, 15.0, 0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(0.0),
                      ),
                      child: Image.asset(
                        'assets/images/logo_reservatupista.png',
                        width: 55.0,
                        height: 55.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        60.0, 0.0, 12.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${_.deporte} #${_.numPista} ${_.nombrePatrocinador}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: const Color(0xFF14181B),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 4.0),
                              child: Text(
                                'Sabado 30',
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: const Color(0xFF57636C),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 4.0),
                              child: Text(
                                '1/11',
                                style: FlutterFlowTheme.of(context)
                                    .labelSmall
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color: const Color(0xFF57636C),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ).animateOnPageLoad(self.anims['anim']!),
        )
        .toList();
  }
}
