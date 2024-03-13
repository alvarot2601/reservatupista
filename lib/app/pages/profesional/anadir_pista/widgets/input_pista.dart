import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import '../../../../../utils/colores.dart';
import '/flutter_flow/flutter_flow_theme.dart';

enum TypeInputPista { select, input }

class InputPista extends FormField<String> {
  InputPista({
    Key? key,
    this.controller,
    this.icon,
    this.changeIcon = false,
    this.labelText,
    this.labelStyle,
    this.errorStyle,
    this.hintText,
    this.dialogTitle,
    this.dialogSearchHint,
    this.dialogCancelBtn,
    this.enableSearch = false,
    this.itemsDD,
    this.hint,
    this.itemTextstyle,
    this.itemWidth,
    this.boxHeight,
    this.boxWidth,
    this.boxPadding,
    this.boxTextstyle,
    this.onBoxStateChanged,
    this.boxDecoration,
    this.dropdownColor,
    this.elevation = 8,
    this.enableInput,
    this.isError = false,
    this.isDense = false,
    this.readOnly = true,
    this.enableInteractiveSelection = false,
    required this.context,
    this.onValidator,
    this.inputFormatters,
    this.typeInputPista = TypeInputPista.select,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    int? maxLength,
    String? Function(String?)? validator,
    this.onChanged,
  }) : super(
          key: key,
          initialValue: controller!.text,
          builder: (FormFieldState<String> field) {
            final _InputPistaState state = field as _InputPistaState;

            void onChangedHandler(String value) {
              if (onChanged != null) {
                onChanged(value);
              }
              field.didChange(value);
            }

            Widget buildField(lfOnTap) {
              return SizedBox(
                height: 45,
                child: TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  obscureText: false,
                  decoration: InputDecoration(
                    counterText: '',
                    labelText: labelText,
                    hintStyle: FlutterFlowTheme.of(context).labelMedium,
                    labelStyle: enableInput == null
                        ? FlutterFlowTheme.of(context).labelMedium
                        : enableInput
                            ? FlutterFlowTheme.of(context).labelMedium
                            : GoogleFonts.getFont(
                                'Readex Pro',
                                color: const Color.fromARGB(165, 117, 117, 117),
                                fontWeight: FontWeight.normal,
                                fontSize: 14.0,
                              ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colores().proveedor.primary69,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    enabledBorder: isError
                        ? OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).error,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          )
                        : OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colores().proveedor.primary,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colores().proveedor.primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    contentPadding: const EdgeInsetsDirectional.fromSTEB(
                        16.0, 12.0, 16.0, 12.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium,
                  cursorColor: FlutterFlowTheme.of(context).primary,
                  maxLength: maxLength,
                  keyboardType: keyboardType,
                  onChanged: onChangedHandler,
                  onTap: lfOnTap,
                  readOnly: readOnly,
                  enableInteractiveSelection: enableInteractiveSelection,
                  enabled: enableInput,
                  inputFormatters: inputFormatters,
                  validator: onValidator,
                ),
              );
            }

            if (typeInputPista == TypeInputPista.input) {
              return buildField(null);
            } else {
              return buildField(state._handleTap);
            }
          },
        );
  final String? Function(String?)? onValidator;
  final BuildContext context;
  final bool? enableInput;
  final TypeInputPista typeInputPista;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;

  final Widget? icon;

  final bool changeIcon;
  final bool isError;
  final bool readOnly;
  final bool enableInteractiveSelection;

  final String? labelText;

  final String? hintText;

  final TextStyle? labelStyle;
  final TextStyle? errorStyle;

  /// The title of the dialog window.
  final String? dialogTitle;

  /// The search field hint text
  final String? dialogSearchHint;

  /// The cancel button label on dialog
  final String? dialogCancelBtn;

  final bool enableSearch;

  final ValueChanged<String>? onChanged;
  final List<String>? itemsDD;

  /// printed value

  final double? itemWidth;

  /// each item width

  final double? boxHeight;

  /// whole box height

  final double? boxWidth;

  /// whole box width

  final EdgeInsetsGeometry? boxPadding;

  /// default box padding

  final TextStyle? boxTextstyle;

  /// default box text style

  final TextStyle? itemTextstyle;

  /// default each item's text style

  final Widget? hint;

  final Function(bool)? onBoxStateChanged;

  /// click item then, function triggered

  final BoxDecoration? boxDecoration;

  /// box decoration like border, borderRadius, color

  final int elevation;

  final bool isDense;

  /// The background color of the dropdown.
  ///
  /// If it is not provided, the theme's [Colors.white] will be used
  /// instead.
  final Color? dropdownColor;

  @override
  _InputPistaState createState() => _InputPistaState();
}

class _InputPistaState extends FormFieldState<String> {
  TextEditingController? _stateController;

  @override
  InputPista get widget => super.widget as InputPista;

  TextEditingController? get _effectiveController =>
      widget.controller ?? _stateController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _handleTap() {
    final RenderBox itemBox = context.findRenderObject() as RenderBox;
    final Rect itemRect = itemBox.localToGlobal(Offset.zero) & itemBox.size;
    final TextDirection textDirection = Directionality.of(context);
    final EdgeInsetsGeometry menuMargin =
        ButtonTheme.of(context).alignedDropdown
            ? _kAlignedMenuMargin
            : _kUnalignedMenuMargin;

    final dropdownRoute = _DropdownRoute<String>(
      itemWidth: itemBox.size.width,
      onChanged: (val) {
        _effectiveController!.text = val;
        didChange(_effectiveController?.text);
        didChange(val);
        if (widget.onChanged != null) {
          widget.onChanged!(val);
        }
      },
      items: List.generate(
          widget.itemsDD!.length,
          (index) => DropdownMenuItem<String>(
                value: widget.itemsDD![index],
                child: Text(widget.itemsDD![index],
                    style: FlutterFlowTheme.of(context).labelMedium),
              )),
      buttonRect: menuMargin.resolve(textDirection).inflateRect(itemRect),
      padding: _kMenuItemPadding.resolve(textDirection),
      selectedIndex: -1,
      elevation: widget.elevation,
      dropdownColor: widget.dropdownColor,
      style: widget.itemTextstyle ?? TextStyle(),
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    );

    Navigator.push(context, dropdownRoute);
  }
}

const Duration _kDropdownMenuDuration = Duration(milliseconds: 300);

/// *[_kDropdownMenuDuration] which is dropdown button's drop down duration.

const double _kMenuItemHeight = 48.0;

/// *[_kMenuItemHeight] which is dropdown item's default height

const EdgeInsets _kMenuItemPadding = EdgeInsets.symmetric(horizontal: 16.0);

/// *[_kMenuItemPadding] which is dropdown item's default padding.

const EdgeInsets _kAlignedMenuMargin = EdgeInsets.zero;

/// *[_kAlignedMenuMargin] which is dropdown item's default margin

const EdgeInsetsGeometry _kUnalignedMenuMargin =
    EdgeInsetsDirectional.only(start: 16.0, end: 24.0);

/// *[_kAlignedMenuMargin] which is dropdown item's default margin for align rule.

class _DropdownMenuPainter extends CustomPainter {
  _DropdownMenuPainter({
    this.color,
    this.elevation,
    this.selectedIndex,
    this.resize,
  })  : _painter = BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(5),
                boxShadow: kElevationToShadow[elevation!])
            .createBoxPainter(),
        super(repaint: resize);

  final Color? color;

  /// *[color] which is dropdown item's background color

  final int? elevation;

  /// *[elevation] which is dropdown whole item list's elevation

  final int? selectedIndex;

  /// *[selectedIndex] which is selected item's index

  final Animation<double>? resize;

  /// *[resize] which is resized animation value

  final BoxPainter _painter;

  /// *[_painter] which is panting value

  @override
  void paint(Canvas canvas, Size size) {
    final double selectedItemOffset =
        selectedIndex! * _kMenuItemHeight + kMaterialListPadding.top;
    final Tween<double> top = Tween<double>(
      begin: selectedItemOffset.clamp(0.0, size.height - _kMenuItemHeight),
      end: 0.0,
    );

    final Tween<double> bottom = Tween<double>(
      begin:
          (top.begin! + _kMenuItemHeight).clamp(_kMenuItemHeight, size.height),
      end: size.height,
    );

    final Rect rect = Rect.fromLTRB(
        0.0, top.evaluate(resize!), size.width, bottom.evaluate(resize!));

    _painter.paint(canvas, rect.topLeft, ImageConfiguration(size: rect.size));
  }

  @override
  bool shouldRepaint(_DropdownMenuPainter oldPainter) {
    return oldPainter.color != color ||
        oldPainter.elevation != elevation ||
        oldPainter.selectedIndex != selectedIndex ||
        oldPainter.resize != resize;
  }
}

class _DropdownMenu<T> extends StatefulWidget {
  const _DropdownMenu({
    Key? key,
    this.padding,
    this.dropdownColor,
    this.route,
    this.isScroll = false,
    required this.onChanged,
  }) : super(key: key);

  final ValueChanged<T> onChanged;
  final _DropdownRoute<T>? route;
  final bool isScroll;
  final EdgeInsets? padding;
  final Color? dropdownColor;

  @override
  _DropdownMenuState<T> createState() => _DropdownMenuState<T>();
}

class _DropdownMenuState<T> extends State<_DropdownMenu<T>> {
  late CurvedAnimation _fadeOpacity;
  CurvedAnimation? _resize;

  @override
  void initState() {
    super.initState();
    _fadeOpacity = CurvedAnimation(
      parent: widget.route!.animation!,
      curve: Interval(0.0, 0.25),
      reverseCurve: Interval(0.75, 1.0),
    );
    _resize = CurvedAnimation(
      parent: widget.route!.animation!,
      curve: Interval(0.25, 0.5),
      reverseCurve: Threshold(0.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _DropdownRoute<T> route = widget.route!;
    final double unit = 0.5 / (route.items!.length + 1.5);
    final List<Widget> children = <Widget>[];
    for (int itemIndex = 0; itemIndex < route.items!.length; ++itemIndex) {
      CurvedAnimation opacity;
      if (itemIndex == route.selectedIndex) {
        opacity =
            CurvedAnimation(parent: route.animation!, curve: Threshold(0.0));
      } else {
        final double start = (0.5 + (itemIndex + 1) * unit).clamp(0.0, 1.0);
        final double end = (start + 1.5 * unit).clamp(0.0, 1.0);
        opacity = CurvedAnimation(
            parent: route.animation!, curve: Interval(start, end));
      }
      children.add(FadeTransition(
        opacity: opacity,
        child: InkWell(
          child: Container(
            padding: widget.padding,
            child: route.items![itemIndex],
          ),
          onTap: () => {
            widget.onChanged(route.items![itemIndex].value!),
            Navigator.pop(
              context,
            )
          },
        ),
      ));
    }
    return FadeTransition(
      opacity: _fadeOpacity,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: FlutterFlowTheme.of(context).alternate, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: CustomPaint(
          painter: _DropdownMenuPainter(
            color: widget.dropdownColor ??
                const Color.fromARGB(255, 255, 255, 255),
            elevation: 2,
            selectedIndex: route.selectedIndex,
            resize: _resize,
          ),
          child: Material(
            type: MaterialType.transparency,
            textStyle: route.style,
            child: widget.isScroll
                ? SizedBox(
                    height: 200,
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        child: Column(
                          children: children,
                        ),
                      ),
                    ))
                : ListView(
                    padding: kMaterialListPadding,
                    itemExtent: _kMenuItemHeight,
                    shrinkWrap: true,
                    children: children,
                  ),
          ),
        ),
      ),
    );
  }
}

class _DropdownMenuRouteLayout<T> extends SingleChildLayoutDelegate {
  _DropdownMenuRouteLayout({
    required this.buttonRect,
    required this.menuTop,
    required this.menuHeight,
    required this.textDirection,
    required this.itemWidth,
  });

  final double? itemWidth;

  /// dropdown button's each item's width

  final Rect? buttonRect;

  /// dropdown button's whole list rect.

  final double menuTop;
  final double menuHeight;
  final TextDirection textDirection;

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    final double maxHeight =
        math.max(0.0, constraints.maxHeight - 2 * _kMenuItemHeight);
    return BoxConstraints(
      minWidth: itemWidth!,
      maxWidth: itemWidth!,
      minHeight: 0.0,
      maxHeight: maxHeight,
    );
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    assert(() {
      final Rect container = Offset.zero & size;
      if (container.intersect(buttonRect!) == buttonRect) {
        assert(menuTop >= 0.0);
        assert(menuTop + menuHeight <= size.height);
      }
      return true;
    }());
    late double left;
    switch (textDirection) {
      case TextDirection.rtl:
        left = buttonRect!.right.clamp(0.0, size.width) - childSize.width;
        break;
      case TextDirection.ltr:
        left = buttonRect!.left.clamp(0.0, size.width - childSize.width);
        break;
    }
    if (left >= 10) {
      return Offset(left + 15, menuTop + 13);
    } else {
      return Offset(left + 3, menuTop + 13);
    }
  }

  @override
  bool shouldRelayout(_DropdownMenuRouteLayout<T> oldDelegate) {
    return buttonRect != oldDelegate.buttonRect ||
        menuTop != oldDelegate.menuTop ||
        menuHeight != oldDelegate.menuHeight ||
        textDirection != oldDelegate.textDirection;
  }
}

class _DropdownRouteResult<T> {
  const _DropdownRouteResult(this.result);

  final T result;

  @override
  bool operator ==(dynamic other) {
    if (other is! _DropdownRouteResult<T>) return false;
    final _DropdownRouteResult<T> typedOther = other;
    return result == typedOther.result;
  }

  @override
  int get hashCode => result.hashCode;
}

class _DropdownRoute<T> extends PopupRoute<_DropdownRouteResult<T>> {
  _DropdownRoute({
    this.items,
    this.itemWidth,
    this.padding,
    this.buttonRect,
    this.selectedIndex,
    this.dropdownColor,
    this.elevation = 8,
    required this.onChanged,
    required this.style,
    this.barrierLabel,
  });

  final List<DropdownMenuItem<T>>? items;

  /// item's list

  final ValueChanged<T> onChanged;
  final EdgeInsetsGeometry? padding;

  final Rect? buttonRect;

  /// buttons rectangle

  final int? selectedIndex;

  /// selected Index

  final int elevation;

  final TextStyle style;
  final Color? dropdownColor;

  ScrollController? scrollController;

  @override
  Duration get transitionDuration => _kDropdownMenuDuration;

  @override
  bool get barrierDismissible => true;

  @override
  Color? get barrierColor => null;

  @override
  final String? barrierLabel;

  final double? itemWidth;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    assert(debugCheckHasDirectionality(context));
    final double screenHeight = MediaQuery.of(context).size.height;
    final double maxMenuHeight = screenHeight - 2.0 * _kMenuItemHeight;
    final double preferredMenuHeight =
        (items!.length * _kMenuItemHeight) + kMaterialListPadding.vertical;
    final double menuHeight = math.min(maxMenuHeight, preferredMenuHeight);

    final double buttonTop = buttonRect!.top;
    final double selectedItemOffset =
        selectedIndex! * _kMenuItemHeight + kMaterialListPadding.top;
    double menuTop = (buttonTop - selectedItemOffset) -
        (_kMenuItemHeight - buttonRect!.height) / 2.0;
    const double topPreferredLimit = _kMenuItemHeight;
    if (menuTop < topPreferredLimit) {
      menuTop = math.min(buttonTop, topPreferredLimit);
    }
    double bottom = menuTop;
    final double bottomPreferredLimit = screenHeight - _kMenuItemHeight;
    if (bottom > bottomPreferredLimit) {
      bottom = math.max(buttonTop + _kMenuItemHeight, bottomPreferredLimit);
      menuTop = bottom;
    }
    print(menuHeight);
    if (scrollController == null) {
      double scrollOffset = 0.0;
      if (preferredMenuHeight > maxMenuHeight) {
        scrollOffset = selectedItemOffset - (buttonTop - menuTop);
      }
      scrollController = ScrollController(initialScrollOffset: scrollOffset);
    }

    final TextDirection textDirection = Directionality.of(context);
    Widget menu = _DropdownMenu<T>(
      route: this,
      padding: padding!.resolve(textDirection),
      onChanged: onChanged,
      dropdownColor: dropdownColor,
      isScroll: menuHeight >= 300,
    );

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      removeLeft: true,
      removeRight: true,
      child: Builder(
        builder: (BuildContext context) {
          return CustomSingleChildLayout(
            delegate: _DropdownMenuRouteLayout<T>(
              itemWidth: itemWidth,
              buttonRect: buttonRect,
              menuTop: menuTop - 6,
              menuHeight: menuHeight,
              textDirection: textDirection,
            ),
            child: menu,
          );
        },
      ),
    );
  }

  void _dismiss() {
    navigator?.removeRoute(this);
  }
}
