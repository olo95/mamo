import 'package:mamo/domain/transaction/model/transaction.dart';

class TransactionDto {
  final String sender;
  final String receiver;
  final double amount;

  TransactionDto({
    required this.sender,
    required this.receiver,
    required this.amount,
  });

  static TransactionDto fromJson(Map<String, dynamic> json) => TransactionDto(
        sender: json['sender'] as String,
        receiver: json['receiver'] as String,
        amount: double.parse(json['amount'] as String),
      );

  Map<String, dynamic> toJson() => {
        'sender': sender,
        'receiver': receiver,
        'amount': amount,
      };

  Transaction toDomain() => Transaction(
        sender: sender,
        receiver: receiver,
        amount: amount,
      );
}
