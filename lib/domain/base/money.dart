import 'package:mamo/domain/base/default_currency_string_value.dart';

class Money {
  final int amount;
  final String currency;

  final String amountFormatted;

  Money({
    required this.amount,
  })  : amountFormatted = _formatAmount(amount, defaultCurrencyStringValue),
        currency = defaultCurrencyStringValue;

  static String _formatAmount(int amount, String currency) {
    final int mayorUnit = amount ~/ 100;
    final int minorUnit = amount % 100;

    final String mayorUnitFormatted = mayorUnit.toString();
    final String minorUnitFormatted = minorUnit.toString().padLeft(2, '0');

    return '$mayorUnitFormatted.$minorUnitFormatted $currency';
  }
}
