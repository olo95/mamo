import 'package:cloud_firestore/cloud_firestore.dart';

class NewTransactionDto {
  final String sender;
  final String receiver;
  final double amount;
  final FieldValue createdAt;

  NewTransactionDto({
    required this.sender,
    required this.receiver,
    required this.amount,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
    'sender': sender,
    'receiver': receiver,
    'amount': amount.toString(),
    'createdAt': createdAt,
  };
}
