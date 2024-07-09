import 'package:intl/intl.dart';

class CustomDateFormat {
  static formatToDDMMYYYhhmm(String date) {
    return DateFormat('EEEE, d MMMM y HH:mm').format(DateTime.parse(date));
  }

  static formatTodMMYYYhhmm(String date) {
    return DateFormat('d MMMM y HH:mm').format(DateTime.parse(date));
  }
}
