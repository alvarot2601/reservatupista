import 'package:flutter/services.dart';

class SinEspaciosInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String newText = newValue.text.replaceAll(RegExp(' '), '');
    TextSelection textSelection;
    if (newText == oldValue.text) {
      textSelection = oldValue.selection;
    } else {
      textSelection = newValue.selection;
    }

    return TextEditingValue(text: newText, selection: textSelection);
  }
}

class SoloNumeros extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text == '') {
      return newValue;
    }
    final RegExp regex = RegExp(r'^[0-9]+$');
    final bool isNumber = regex.hasMatch(newValue.text);
    return isNumber ? newValue : oldValue;
  }
}

class SoloLetras extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text == '') {
      return newValue;
    }
    final RegExp regex = RegExp(r'^[a-zA-Z\u00C0-\u017F\s]+$');
    final bool soloLetras = regex.hasMatch(newValue.text);
    return soloLetras ? newValue : oldValue;
  }
}

class DNI8digitos1Letra extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length < 9) {
      if (newValue.text == '') {
        return newValue;
      }
      final RegExp regex = RegExp(r'^[0-9]+$');
      final bool isNumber = regex.hasMatch(newValue.text);
      return isNumber ? newValue : oldValue;
    } else {
      newValue = TextEditingValue(
          text: newValue.text.toUpperCase(),
          selection: newValue.selection,
          composing: newValue.composing);
      final RegExp regex = RegExp(r'^[A-Z]+$');
      final bool isLetra = regex.hasMatch(newValue.text[8]);

      return isLetra ? newValue : oldValue;
    }
  }
}

class CIFNIFFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      TextEditingValue dniValue = TextEditingValue(
          text: newValue.text.toUpperCase(),
          selection: newValue.selection,
          composing: newValue.composing);
      final RegExp regexNumero = RegExp(r'^[0-9]+$');
      final RegExp regexLetra = RegExp(r'^[A-Z]+$');
      final bool isNumber = regexNumero.hasMatch(dniValue.text[0]);
      final bool isLetra = regexLetra.hasMatch(dniValue.text[0]);
      if (isNumber || isLetra) {
        final lengthDNI = dniValue.text.length;
        if (lengthDNI > 1) {
          final RegExp regexNumero = RegExp(r'^[0-9]+$');
          final bool isNumber =
              regexNumero.hasMatch(dniValue.text.substring(1, lengthDNI));
          if (isNumber && lengthDNI < 9) {
            return dniValue;
          } else {
            if (lengthDNI == 9) {
              final RegExp regexLetra = RegExp(r'^[A-Z]+$');
              final bool isLetra = regexLetra.hasMatch(dniValue.text[8]);
              if (isLetra) {
                return dniValue;
              }
            }
            return oldValue;
          }
        }
        return dniValue;
      }
      return oldValue;
    }
    return newValue;
  }
}
