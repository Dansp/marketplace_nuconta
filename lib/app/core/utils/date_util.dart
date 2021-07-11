import 'package:intl/intl.dart';

class DateUtil {

  static String convertToOnlyDate(date) {
    print(date);
    var d = DateTime.parse(date);
    var formatter = new DateFormat('dd/MM/yyyy');
    return formatter.format(d);
  }

  static String convertToString(date, format) {
    print(date);
    var d = DateTime.parse(date);
    var formatter = new DateFormat(format);
    return formatter.format(d);
  }

  static DateTime convertToDateTime(date) {
    return DateTime.parse(date);
  }
}