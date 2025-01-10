import 'package:mamo/domain/transaction/model/transaction.dart';

class TransactionDetails {
  final String? senderName;
  final String? receiverName;
  final double amount;

  TransactionDetails({
    required this.senderName,
    required this.receiverName,
    required this.amount,
  });
}