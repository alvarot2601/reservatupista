import 'dart:async';

import 'package:reservatu_pista/components/navbar_y_appbar_usuario.dart';

import '../../../backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'inicio_model.dart';
export 'inicio_model.dart';

class InicioWidget extends StatefulWidget {
  const InicioWidget({Key? key}) : super(key: key);

  @override
  _InicioWidgetState createState() => _InicioWidgetState();
}

class _InicioWidgetState extends State<InicioWidget> {
  late InicioModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Timer timerCarousel;
  late Timer timerCarouselOfertas;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InicioModel());

    timerCarousel = Timer.periodic(new Duration(seconds: 3), (timer) {
      _model.carouselController.nextPage();
    });
    timerCarouselOfertas = Timer.periodic(new Duration(seconds: 3), (timer) {
      _model.carouselOfertasController.nextPage();
    });
  }

  @override
  void dispose() {
    _model.dispose();
    timerCarousel.cancel();
    timerCarouselOfertas.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return NavbarYAppbarUsuario(
      title: 'Inicio',
      page: TypePage.Inicio,
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: 570,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Text(
                            'Noticias',
                            style: FlutterFlowTheme.of(context).headlineMedium,
                          ),
                        ),
                        // Generated code for this Carousel Widget...
                        Container(
                          width: double.infinity,
                          height: 180,
                          child: CarouselSlider(
                            items: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://padelmagazine.fr/wp-content/uploads/2022/10/coello-bela-galan-lebron.jpg.webp',
                                  width: 400,
                                  height: 400,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://www.onlytenis.com/blog/wp-content/uploads/2022/02/diferencias-entre-padel-y-tenis.jpg',
                                  width: 300,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://s3.abcstatics.com/media/bienestar/2019/09/17/futbol-1-kU3C--1248x698@abc.jpg',
                                  width: 300,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://images.ecestaticos.com/1FAPqiOIh610jHE6bKH1j6TIcQo=/0x0:2272x1515/1200x900/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2Fd81%2Fa9a%2F1b1%2Fd81a9a1b1066ab4e2e7ab8bde399fdc6.jpg',
                                  width: 300,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                            carouselController: _model.carouselController,
                            options: CarouselOptions(
                              initialPage: 1,
                              viewportFraction: 0.8,
                              disableCenter: true,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.25,
                              enableInfiniteScroll: true,
                              scrollDirection: Axis.horizontal,
                              autoPlay: false,
                              onPageChanged: (index, _) =>
                                  _model.carouselCurrentIndex = index,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Text(
                            'Padel',
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            'Martes, Enero 18th  ||  12:30pm',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                          child: Text(
                            'Partido de Basketball',
                            style: FlutterFlowTheme.of(context).labelMedium,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                          child: Text(
                            'Ofertas',
                            style: FlutterFlowTheme.of(context).headlineMedium,
                          ),
                        ),
                        // Generated code for this Carousel Widget...
                        Container(
                          width: double.infinity,
                          height: 180,
                          child: CarouselSlider(
                            items: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://i8.amplience.net/i/jpl/desktop-mobile-site-offer-spot-408x408-22-3e16bb7a28bf44e339d2c29691b882a5?qlt=800&fmt=auto',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://www.padeladdict.com/wp-content/uploads/2019/07/ofertas-de-palas-de-padel-por-menos-de-130-euros.jpg',
                                  width: 300,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  'https://www.cmdsport.com/app/uploads/2018/11/black-friday-duet-sports.jpg',
                                  width: 300,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                            carouselController:
                                _model.carouselOfertasController,
                            options: CarouselOptions(
                              initialPage: 1,
                              viewportFraction: 0.8,
                              disableCenter: true,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.25,
                              enableInfiniteScroll: true,
                              scrollDirection: Axis.horizontal,
                              autoPlay: false,
                              onPageChanged: (index, _) =>
                                  _model.carouselCurrentIndex = index,
                            ),
                          ),
                        ),
                        Text(
                          'Amigos ',
                          style: FlutterFlowTheme.of(context).labelLarge,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 32),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 2, 12, 2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 2, 12, 2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1614436163996-25cee5f54290?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 2, 12, 2),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 12),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).accent1,
                      width: 2,
                    ),
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: Text(
                    'Reservar',
                    style: FlutterFlowTheme.of(context).titleSmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
