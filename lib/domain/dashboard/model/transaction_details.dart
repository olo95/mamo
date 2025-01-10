import 'package:mamo/domain/base/money.dart';

class TransactionDetails {
  final String? senderName;
  final String? receiverName;
  final Money amount;

  TransactionDetails({
    required this.senderName,
    required this.receiverName,
    required this.amount,
  });
}