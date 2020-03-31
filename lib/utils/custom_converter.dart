import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class CustomConverter {
  NumberFormat currencyFormatter;
  DateFormat dateFormatter;

  CustomConverter() {
    Intl.defaultLocale = 'pt_BR';
    initializeDateFormatting('pt_BR', null)
        .then((value) => this.dateFormatter = DateFormat('dd/MM/yyyy'));
    this.currencyFormatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$', decimalDigits: 2);
  }

  String formatMoney(int moneyInCents) {
    var firstValue = moneyInCents / 100;
    return this.currencyFormatter.format(firstValue);
  }

  String formatDate(DateTime date) {
    return this.dateFormatter.format(date);
  }
}
