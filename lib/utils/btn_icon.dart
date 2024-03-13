import 'package:flutter/material.dart';

class BtnIcon extends StatefulWidget {
  const BtnIcon({
    Key? key,
    required this.icon,
    this.borderColor,
    this.borderRadius,
    this.borderWidth,
    this.buttonSize,
    this.width,
    this.height,
    this.fillColor,
    this.disabledColor,
    this.disabledIconColor,
    this.hoverColor,
    this.hoverIconColor,
    this.onPressed,
    this.padding,
    this.iconSize,
    this.iconColor,
    this.size,
    this.showLoadingIndicator = false,
  }) : super(key: key);

  final Widget icon;
  final double? borderRadius;
  final double? buttonSize;
  final double? width;
  final double? height;
  final Color? fillColor;
  final Color? disabledColor;
  final Color? disabledIconColor;
  final Color? hoverColor;
  final Color? hoverIconColor;
  final Color? borderColor;
  final double? borderWidth;
  final bool showLoadingIndicator;
  final double? iconSize;
  final Color? iconColor;
  final EdgeInsetsGeometry? padding;
  final Size? size;
  final Function()? onPressed;

  @override
  State<BtnIcon> createState() => _BtnIconState();
}

class _BtnIconState extends State<BtnIcon> {
  bool loading = false;
  late double? iconSize;
  late Color? iconColor;
  late Widget effectiveIcon;

  @override
  void initState() {
    super.initState();
    _updateIcon();
  }

  @override
  void didUpdateWidget(BtnIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateIcon();
  }

  void _updateIcon() {
    effectiveIcon = widget.icon;
    iconSize = widget.iconSize;
    iconColor = widget.iconColor;
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle style = ButtonStyle(
        padding: MaterialStatePropertyAll(widget.padding),
        // MaterialStatePropertyAll(padding),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
              side: BorderSide(
                color: widget.borderColor ?? Colors.transparent,
                width: widget.borderWidth ?? 0,
              ),
            );
          },
        ),
        iconColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(MaterialState.disabled) &&
                widget.disabledIconColor != null) {
              return widget.disabledIconColor;
            }
            if (states.contains(MaterialState.hovered) &&
                widget.hoverIconColor != null) {
              return widget.hoverIconColor;
            }
            return iconColor;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(MaterialState.disabled) &&
                widget.disabledColor != null) {
              return widget.disabledColor;
            }
            if (states.contains(MaterialState.hovered) &&
                widget.hoverColor != null) {
              return widget.hoverColor;
            }

            return widget.fillColor;
          },
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          return widget.hoverColor;
        }),
        fixedSize: MaterialStatePropertyAll(widget.size));

    return Container(
      width: widget.width ?? widget.buttonSize,
      height: widget.height ?? widget.buttonSize,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Theme(
        data: Theme.of(context).copyWith(
          useMaterial3: true,
        ),
        child: IgnorePointer(
          ignoring: (widget.showLoadingIndicator && loading),
          child: IconButton(
            icon: (widget.showLoadingIndicator && loading)
                ? SizedBox(
                    width: iconSize,
                    height: iconSize,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        iconColor ?? Colors.white,
                      ),
                    ),
                  )
                : widget.icon,
            onPressed: widget.onPressed == null
                ? null
                : () async {
                    if (loading) {
                      return;
                    }
                    setState(() => loading = true);
                    try {
                      await widget.onPressed!();
                    } finally {
                      if (mounted) {
                        setState(() => loading = false);
                      }
                    }
                  },
            style: style,
          ),
        ),
      ),
    );
  }
}
