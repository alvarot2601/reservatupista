import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RichAlertType {
  /// Indicates an error dialog by providing an error icon.
  static const int ERROR = 0;

  /// Indicates a success dialog by providing a success icon.
  static const int SUCCESS = 1;

  /// Indicates a warning dialog by providing a warning icon.
  static const int WARNING = 2;

  /// Indicates a warning dialog by providing a warning icon.
  static const int NONE = 3;
}

class RichAlertFlutterFlow extends StatefulWidget {
  /// The title of the dialog is displayed in a large font at the top
  /// of the dialog.
  ///
  /// Usually has a bigger fontSize than the [alertSubtitle].
  final String alertTitle;

  /// The subtitle of the dialog is displayed in a medium-sized font beneath
  /// the title of the dialog.
  ///
  /// Usually has a smaller fontSize than the [alertTitle]
  final String alertSubtitle;

  /// The type of dialog, whether warning, success or error.
  final int alertType;

  /// The (optional) actions to be performed in the dialog is displayed
  /// the subtitle of the dialog. If no values are provided, a default
  /// [Button] widget is rendered.
  ///
  /// Typically a [List<Widget>] widget.
  final List<Widget> actions;

  /// Specifies how blur the screen overlay effect should be.
  /// Higher values mean more blurred overlays.
  final double blurValue;

  // Specifies the opacity of the screen overlay
  final double backgroundOpacity;

  /// (Optional) User defined icon for the dialog. Advisable to use the
  /// default icon matching the dialog type.
  final Icon? dialogIcon;
  final void Function()? onPressed;
  final String textButton;
  final String? precio;

  RichAlertFlutterFlow({
    Key? key,
    required this.alertTitle,
    required this.alertSubtitle,
    required this.alertType,
    required this.textButton,
    this.actions = const [],
    this.precio,
    this.onPressed,
    this.blurValue = 3.0,
    this.backgroundOpacity = 0.2,
    this.dialogIcon,
  }) : super(key: key);
  @override
  _RichAlertFlutterFlowState createState() => _RichAlertFlutterFlowState();
}

class _RichAlertFlutterFlowState extends State<RichAlertFlutterFlow> {
  final Map<int, String> typeAsset = {
    RichAlertType.ERROR: "assets/images/error.png",
    RichAlertType.SUCCESS: "assets/images/success.png",
    RichAlertType.WARNING: "assets/images/warning.png",
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
        color: Colors.transparent,
        child: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Container(
            height: MediaQuery.sizeOf(context).height * 1,
            decoration: BoxDecoration(),
            child: Stack(
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    Navigator.pop(context);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 5,
                        sigmaY: 7,
                      ),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width,
                        height: MediaQuery.sizeOf(context).height * 1,
                        decoration: BoxDecoration(
                          color: Color(0x6B090F13),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(16, 85, 16, 0),
                          child: Container(
                            width: double.infinity,
                            height: 300,
                            constraints: BoxConstraints(
                              maxWidth: 530,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3,
                                  color: Color(0x33000000),
                                  offset: Offset(0, 1),
                                )
                              ],
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 45, 24, 16),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.alertTitle,
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 23,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 0),
                                        child: Text(
                                          widget.alertSubtitle,
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .copyWith(fontSize: 18),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 0),
                                        child: widget.precio == null
                                            ? SizedBox()
                                            : Text(
                                                widget.precio!,
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          fontSize: 23,
                                                        ),
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 12),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 12, 0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                          },
                                          text: 'Cancelar',
                                          options: FFButtonOptions(
                                            height: 40,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 0, 20, 0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 0),
                                            color: const Color.fromARGB(
                                                255, 255, 107, 97),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .override(
                                                      fontFamily: 'Readex Pro',
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                    ),
                                            elevation: 0,
                                            borderRadius:
                                                BorderRadius.circular(40),
                                          ),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: widget.onPressed,
                                        text: widget.textButton,
                                        options: FFButtonOptions(
                                          height: 40,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 20, 0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Readex Pro',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                          elevation: 0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        widget.alertType == 3
                            ? SizedBox()
                            : Align(
                                alignment: AlignmentDirectional(0, -1),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: _defaultIcon()),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Image _defaultIcon() {
    if (typeAsset.containsKey(widget.alertType)) {
      return Image.asset(
        typeAsset[widget.alertType]!,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        alignment: Alignment(0, 0),
      );
    } else {
      throw Exception("Invalid alertType");
    }
  }
}
