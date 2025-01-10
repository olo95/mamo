import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:mamo/domain/transaction/model/transaction.dart';

class TransactionDto {
  final String sender;
  final String receiver;
  final double amount;
  final firestore.Timestamp createdAt;

  TransactionDto({
    required this.sender,
    required this.receiver,
    required this.amount,
    required this.createdAt,
  });

  static TransactionDto fromJson(Map<String, dynamic> json) => TransactionDto(
        sender: json['sender'] as String,
        receiver: json['receiver'] as String,
        amount: double.parse(json['amount'] as String),
        createdAt: json['createdAt'] as firestore.Timestamp,
      );

  Map<String, dynamic> toJson() => {
        'sender': sender,
        'receiver': receiver,
        'amount': amount.toString(),
        'createdAt': createdAt,
      };

  Transaction toDomain() => Transaction(
        senderId: sender,
        receiverId: receiver,
        amount: amount,
        createdAt: createdAt.toDate(),
      );
}
