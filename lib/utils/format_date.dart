import 'package:intl/intl.dart';

class FormatDate {
  static final diasSemanaES = {
    "Monday": "Lunes",
    "Tuesday": "Martes",
    "Wednesday": "Miércoles",
    "Thursday": "Jueves",
    "Friday": "Viernes",
    "Saturday": "Sábado",
    "Sunday": "Domingo",
  };

  static final mesesES = {
    "January": "Enero",
    "February": "Febrero",
    "March": "Marzo",
    "April": "Abril",
    "May": "Mayo",
    "June": "Junio",
    "July": "Julio",
    "August": "Agosto",
    "September": "Septiembre",
    "October": "Octubre",
    "November": "Noviembre",
    "December": "Diciembre",
  };

  static String formatDateString(String inputDate) {
    DateTime date = DateFormat("dd/MM/yyyy").parse(inputDate);
    String formattedDate = DateFormat("EEEE d MMMM y").format(date);
    final splitDate = formattedDate.split(" ");
    final String traduceDate =
        "${diasSemanaES[splitDate[0]]} ${splitDate[1]} ${mesesES[splitDate[2]]} ${splitDate[3]}";
    return traduceDate;
  }

  static String dateToString(DateTime date) {
    String formattedDate = DateFormat("EEEE d MMMM y").format(date);
    final splitDate = formattedDate.split(" ");
    final String traduceDate =
        "${diasSemanaES[splitDate[0]]} ${splitDate[1]} ${mesesES[splitDate[2]]} ${splitDate[3]}";
    return traduceDate;
  }

  static String traduceMes(String mesAndYear) {
    final split = mesAndYear.split(" ");
    return "${split[0].toUpperCase()} ${split[2]}";
  }
}
