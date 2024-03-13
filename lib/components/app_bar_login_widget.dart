import '/components/alert_versions_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_bar_login_model.dart';
export 'app_bar_login_model.dart';

class AppBarLoginWidget extends StatefulWidget {
  const AppBarLoginWidget({Key? key}) : super(key: key);

  @override
  _AppBarLoginWidgetState createState() => _AppBarLoginWidgetState();
}

class _AppBarLoginWidgetState extends State<AppBarLoginWidget> {
  late AppBarLoginModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBarLoginModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        height: 100.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 1.0,
              color: Color(0x33000000),
              offset: Offset(0.0, 2.0),
            )
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 0.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  RichText(
                    textScaleFactor: MediaQuery.of(context).textScaleFactor,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            'ivccwesy' /* R */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).titleLogo,
                                fontSize: 35.0,
                                fontWeight: FontWeight.w900,
                              ),
                        ),
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            'hetjr87d' /* eserva */,
                          ),
                          style: TextStyle(
                              color: FlutterFlowTheme.of(context).titleLogo,
                              fontWeight: FontWeight.w100,
                              fontSize: 25),
                        ),
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            'aobyf1mm' /* t */,
                          ),
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).titleLogo,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            '6vubu86k' /* u */,
                          ),
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).titleLogo,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            'w1h8bwbh' /* p */,
                          ),
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).titleLogo,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        TextSpan(
                          text: FFLocalizations.of(context).getText(
                            'ehytz4x3' /* ista */,
                          ),
                          style: TextStyle(
                            color: FlutterFlowTheme.of(context).titleLogo,
                            fontWeight: FontWeight.w100,
                          ),
                        )
                      ],
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 25.0,
                          ),
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'jy9xgxwv' /* .com */,
                      ),
                      textAlign: TextAlign.end,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).titleLogo,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w300,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 10.0),
                child: Container(
                  decoration: BoxDecoration(),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/logo_min_size.gif',
                        width: 80.0,
                        height: 80.0,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
