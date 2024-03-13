import 'package:flutter/material.dart';
import 'package:reservatu_pista/utils/btn_icon.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'package:url_launcher/url_launcher.dart';

import 'alert_versions_widget.dart';

extension SizedBoxExt on double {
  SizedBox get sh => SizedBox(height: this);
  SizedBox get sw => SizedBox(width: this);
}

class NavBarLogin extends StatelessWidget {
  const NavBarLogin({super.key});

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  void _sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'info@reservatupista.com',
      queryParameters: {
        'subject': 'Contacto ReservatuPista',
      },
    );

    _launchInBrowser(emailLaunchUri);
  }

  void launchWhatsApp() async {
    String url = "https://wa.me/34653483483";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir WhatsApp.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 90,
          left: 75,
          child: SizedBox(
            width: MediaQuery.of(context).size.width - (155),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                'Premio a la Creación en la Industria del\nSoftware para la Provincia de Cáceres',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).labelSmall,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 75,
          left: 5,
          child: Container(
            width: 60.0,
            height: 60.0,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(),
            child: Image.asset(
              'assets/images/logo_diputacion_caseres.png',
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Positioned(
          bottom: 75,
          right: 5,
          child: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Color(0xFF00E676),
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: BtnIcon(
              hoverColor: Color.fromARGB(117, 0, 0, 0),
              borderRadius: 30,
              onPressed: () =>
                  _launchInBrowser(Uri.parse("https://wa.me/34653483483")),
              icon: Container(
                width: 45.0,
                height: 45.0,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/icon_whatsapp.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: const AlignmentDirectional(0.0, 1.0),
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: 70.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Builder(
                        builder: (context) => InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return const Material(
                                  color: Colors.transparent,
                                  child: AlertVersionsWidget(),
                                );
                              },
                            );
                          },
                          child: Text(
                            'Version 1.2.20',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 10,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                        ),
                      ),
                      BtnIcon(
                        hoverColor: const Color.fromARGB(144, 255, 255, 255),
                        padding: const EdgeInsets.all(0),
                        onPressed: _sendEmail,
                        icon: Row(
                          children: [
                            Icon(
                              Icons.email,
                              color: FlutterFlowTheme.of(context)
                                  .bottomBarLoginText,
                              size: 20.0,
                            ),
                            Text(
                              'info@reservatupista.com',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 12,
                                    color: FlutterFlowTheme.of(context)
                                        .bottomBarLoginText,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      BtnIcon(
                        hoverColor: const Color.fromARGB(144, 255, 255, 255),
                        padding: const EdgeInsets.all(0),
                        onPressed: () =>
                            _launchInBrowser(Uri.parse("tel:34653483483")),
                        icon: Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: FlutterFlowTheme.of(context)
                                  .bottomBarLoginText,
                              size: 20.0,
                            ),
                            1.0.sw,
                            Text(
                              '653483483',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    fontSize: 12,
                                    color: FlutterFlowTheme.of(context)
                                        .bottomBarLoginText,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '© 2023 MODULARBOX S.L.\nTODOS LOS DERECHOS RESERVADOS',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Readex Pro',
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
