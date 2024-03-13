import 'package:intl/intl.dart';

class FormatNumber {
  static String formatNumberWithTwoDecimals(double number) {
    NumberFormat numberFormat = NumberFormat('0.00');
    return numberFormat.format(number);
  }

  static String eliminarWithTwoDecimals(double number) {
    NumberFormat numberFormat = NumberFormat('00.00');
    return numberFormat.format(number);
  }
}

extension FormatNumberExt on double {
  String get twoDecimals => NumberFormat('0.00').format(this);
}
