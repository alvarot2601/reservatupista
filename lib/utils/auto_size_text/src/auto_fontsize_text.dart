import 'dart:async';

import 'package:flutter/widgets.dart';

/// Flutter widget that automatically resizes text to fit perfectly within its
/// bounds.
///
/// All size constraints as well as maxLines are taken into account. If the text
/// overflows anyway, you should check if the parent widget actually constraints
/// the size of this
class AutoFontSizeText {
  /// Creates a [AutoFontSizeText]
  ///
  /// If the [style] argument is null, the text will use the style from the
  /// closest enclosing [DefaultTextStyle].
  const AutoFontSizeText(
    String this.data, {
    this.textKey,
    this.styleOld,
    this.strutStyle,
    this.minFontSize = 1,
    this.maxFontSize = double.infinity,
    this.stepGranularity = 1,
    this.presetFontSizes,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.wrapWords = true,
    this.overflow,
    this.overflowReplacement,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
  })  : textSpan = null,
        super();

  /// Creates a [AutoFontSizeText] widget with a [TextSpan].
  const AutoFontSizeText.rich(
    TextSpan this.textSpan, {
    this.textKey,
    this.styleOld,
    this.strutStyle,
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.stepGranularity = 1,
    this.presetFontSizes,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.wrapWords = true,
    this.overflow,
    this.overflowReplacement,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
  })  : data = null,
        super();

  /// Sets the key for the resulting [Text]
  ///
  /// This allows you to find the actual `Text` widget built by `AutoFontSizeText`.
  final Key? textKey;

  /// The text to display.
  ///
  /// This will be null if a [textSpan] is provided instead.
  final String? data;

  /// The text to display as a [TextSpan].
  ///
  /// This will be null if [data] is provided instead.
  final TextSpan? textSpan;

  /// If non-null, the style to use for this text.
  ///
  /// If the style's "inherit" property is true, the style will be merged with
  /// the closest enclosing [DefaultTextStyle]. Otherwise, the style will
  /// replace the closest enclosing [DefaultTextStyle].
  final TextStyle? styleOld;

  // The default font size if none is specified.
  static const double _defaultFontSize = 14;

  /// The strut style to use. Strut style defines the strut, which sets minimum
  /// vertical layout metrics.
  ///
  /// Omitting or providing null will disable strut.
  ///
  /// Omitting or providing null for any properties of [StrutStyle] will result
  /// in default values being used. It is highly recommended to at least specify
  /// a font size.
  ///
  /// See [StrutStyle] for details.
  final StrutStyle? strutStyle;

  /// The minimum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double minFontSize;

  /// The maximum text size constraint to be used when auto-sizing text.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double maxFontSize;

  /// The step size in which the font size is being adapted to constraints.
  ///
  /// The Text scales uniformly in a range between [minFontSize] and
  /// [maxFontSize].
  /// Each increment occurs as per the step size set in stepGranularity.
  ///
  /// Most of the time you don't want a stepGranularity below 1.0.
  ///
  /// Is being ignored if [presetFontSizes] is set.
  final double stepGranularity;

  /// Predefines all the possible font sizes.
  ///
  /// **Important:** PresetFontSizes have to be in descending order.
  final List<double>? presetFontSizes;

  /// How the text should be aligned horizontally.
  final TextAlign? textAlign;

  /// The directionality of the text.
  ///
  /// This decides how [textAlign] values like [TextAlign.start] and
  /// [TextAlign.end] are interpreted.
  ///
  /// This is also used to disambiguate how to render bidirectional text. For
  /// example, if the [data] is an English phrase followed by a Hebrew phrase,
  /// in a [TextDirection.ltr] context the English phrase will be on the left
  /// and the Hebrew phrase to its right, while in a [TextDirection.rtl]
  /// context, the English phrase will be on the right and the Hebrew phrase on
  /// its left.
  ///
  /// Defaults to the ambient [Directionality], if any.
  final TextDirection? textDirection;

  /// Used to select a font when the same Unicode character can
  /// be rendered differently, depending on the locale.
  ///
  /// It's rarely necessary to set this property. By default its value
  /// is inherited from the enclosing app with `Localizations.localeOf(context)`.
  final Locale? locale;

  /// Whether the text should break at soft line breaks.
  ///
  /// If false, the glyphs in the text will be positioned as if there was
  /// unlimited horizontal space.
  final bool? softWrap;

  /// Whether words which don't fit in one line should be wrapped.
  ///
  /// If false, the fontSize is lowered as far as possible until all words fit
  /// into a single line.
  final bool wrapWords;

  /// How visual overflow should be handled.
  ///
  /// Defaults to retrieving the value from the nearest [DefaultTextStyle] ancestor.
  final TextOverflow? overflow;

  /// If the text is overflowing and does not fit its bounds, this widget is
  /// displayed instead.
  final Widget? overflowReplacement;

  /// The number of font pixels for each logical pixel.
  ///
  /// For example, if the text scale factor is 1.5, text will be 50% larger than
  /// the specified font size.
  ///
  /// This property also affects [minFontSize], [maxFontSize] and [presetFontSizes].
  ///
  /// The value given to the constructor as textScaleFactor. If null, will
  /// use the [MediaQueryData.textScaleFactor] obtained from the ambient
  /// [MediaQuery], or 1.0 if there is no [MediaQuery] in scope.
  final double? textScaleFactor;

  /// An optional maximum number of lines for the text to span, wrapping if necessary.
  /// If the text exceeds the given number of lines, it will be resized according
  /// to the specified bounds and if necessary truncated according to [overflow].
  ///
  /// If this is 1, text will not wrap. Otherwise, text will be wrapped at the
  /// edge of the box.
  ///
  /// If this is null, but there is an ambient [DefaultTextStyle] that specifies
  /// an explicit number for its [DefaultTextStyle.maxLines], then the
  /// [DefaultTextStyle] value will take precedence. You can use a [RichText]
  /// widget directly to entirely override the [DefaultTextStyle].
  final int? maxLines;

  /// An alternative semantics label for this text.
  ///
  /// If present, the semantics of this widget will contain this value instead
  /// of the actual text. This will overwrite any of the semantics labels applied
  /// directly to the [TextSpan]s.
  ///
  /// This is useful for replacing abbreviations or shorthands with the full
  /// text value:
  ///
  /// ```dart
  /// AutoSizeText(r'$$', semanticsLabel: 'Double dollars')
  /// ```
  final String? semanticsLabel;

  double getFontSize(BuildContext context, size) {
    final defaultTextStyle = DefaultTextStyle.of(context);

    TextStyle? style = styleOld;
    if (style == null || style.inherit) {
      style = defaultTextStyle.style.merge(style);
    }
    if (style.fontSize == null) {
      style = style.copyWith(fontSize: AutoFontSizeText._defaultFontSize);
    }

    final newMaxLines = maxLines ?? defaultTextStyle.maxLines;

    _validateProperties(style, newMaxLines);

    final result = _calculateFontSize(size, style, newMaxLines, context);
    final fontSize = result[0] as double;
    return fontSize;
  }

  void _validateProperties(TextStyle style, int? maxLines) {
    assert(overflow == null || overflowReplacement == null,
        'Either overflow or overflowReplacement must be null.');
    assert(maxLines == null || maxLines > 0,
        'MaxLines must be greater than or equal to 1.');

    if (presetFontSizes == null) {
      assert(
          stepGranularity >= 0.1,
          'StepGranularity must be greater than or equal to 0.1. It is not a '
          'good idea to resize the font with a higher accuracy.');
      assert(
          minFontSize >= 0, 'MinFontSize must be greater than or equal to 0.');
      assert(maxFontSize > 0, 'MaxFontSize has to be greater than 0.');
      assert(minFontSize <= maxFontSize,
          'MinFontSize must be smaller or equal than maxFontSize.');
      assert(minFontSize / stepGranularity % 1 == 0,
          'MinFontSize must be a multiple of stepGranularity.');
      if (maxFontSize != double.infinity) {
        assert(maxFontSize / stepGranularity % 1 == 0,
            'MaxFontSize must be a multiple of stepGranularity.');
      }
    } else {
      assert(presetFontSizes!.isNotEmpty, 'PresetFontSizes must not be empty.');
    }
  }

  List _calculateFontSize(BoxConstraints size, TextStyle? style, int? maxLines,
      BuildContext context) {
    final span = TextSpan(
      style: textSpan?.style ?? style,
      text: textSpan?.text ?? data,
      children: textSpan?.children,
      recognizer: textSpan?.recognizer,
    );

    final userScale = textScaleFactor ?? MediaQuery.textScaleFactorOf(context);

    int left;
    int right;

    final newPresetFontSizes = presetFontSizes?.reversed.toList();
    if (newPresetFontSizes == null) {
      final num defaultFontSize =
          style!.fontSize!.clamp(minFontSize, maxFontSize);
      final defaultScale = defaultFontSize * userScale / style.fontSize!;
      if (_checkTextFits(span, defaultScale, maxLines, size)) {
        return <Object>[defaultFontSize * userScale, true];
      }

      left = (minFontSize / stepGranularity).floor();
      right = (defaultFontSize / stepGranularity).ceil();
    } else {
      left = 0;
      right = newPresetFontSizes.length - 1;
    }

    var lastValueFits = false;
    while (left <= right) {
      final mid = (left + (right - left) / 2).floor();
      double scale;
      if (newPresetFontSizes == null) {
        scale = mid * userScale * stepGranularity / style!.fontSize!;
      } else {
        scale = newPresetFontSizes[mid] * userScale / style!.fontSize!;
      }
      if (_checkTextFits(span, scale, maxLines, size)) {
        left = mid + 1;
        lastValueFits = true;
      } else {
        right = mid - 1;
      }
    }

    if (!lastValueFits) {
      right += 1;
    }

    double fontSize;
    if (newPresetFontSizes == null) {
      fontSize = right * userScale * stepGranularity;
    } else {
      fontSize = newPresetFontSizes[right] * userScale;
    }

    return <Object>[fontSize, lastValueFits];
  }

  bool _checkTextFits(
      TextSpan text, double scale, int? maxLines, BoxConstraints constraints) {
    if (!wrapWords) {
      final words = text.toPlainText().split(RegExp('\\s+'));

      final wordWrapTextPainter = TextPainter(
        text: TextSpan(
          style: text.style,
          text: words.join('\n'),
        ),
        textAlign: textAlign ?? TextAlign.left,
        textDirection: textDirection ?? TextDirection.ltr,
        textScaleFactor: scale,
        maxLines: words.length,
        locale: locale,
        strutStyle: strutStyle,
      );

      wordWrapTextPainter.layout(maxWidth: constraints.maxWidth);

      if (wordWrapTextPainter.didExceedMaxLines ||
          wordWrapTextPainter.width > constraints.maxWidth) {
        return false;
      }
    }

    final textPainter = TextPainter(
      text: text,
      textAlign: textAlign ?? TextAlign.left,
      textDirection: textDirection ?? TextDirection.ltr,
      textScaleFactor: scale,
      maxLines: maxLines,
      locale: locale,
      strutStyle: strutStyle,
    );

    textPainter.layout(maxWidth: constraints.maxWidth);

    return !(textPainter.didExceedMaxLines ||
        textPainter.height > constraints.maxHeight ||
        textPainter.width > constraints.maxWidth);
  }
}
