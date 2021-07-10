import 'package:intl/intl.dart';

class MoneyFormat {

  ///Convert money in double to string of current country
  static String changeToCurrent(symbol, number) {
    if(number != null) {
      double n = 0;
      if (number is double) {
        n = number;
      } else {
        n = double.parse('$number');
      }
      // final String defaultLocale = Platform.localeName;
      final String defaultLocale = 'pt_BR';
      var formatter = new NumberFormat.currency(
          locale: defaultLocale, symbol: symbol);
      return formatter.format(n);
    }
    return '$symbol 0,00';
  }
}