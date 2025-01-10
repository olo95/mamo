import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mamo/data/firestore/model/firestore_collections.dart';
import 'package:mamo/data/firestore/model/logged_in_user_id.dart';
import 'package:mamo/data/transaction/model/new_transaction_dto.dart';
import 'package:mamo/data/transaction/model/transaction_dto.dart';

class FirestoreDataSource {
  final FirebaseFirestore firestore;

  FirestoreDataSource({required this.firestore});

  Future<List<Map<String, dynamic>>> getUsers() => firestore.collection(FirestoreCollections.users).get().then(
        (snapshot) => snapshot.docs
            .map(
              (doc) => doc.data(),
            )
            .toList(),
      );

  Future<Map<String, dynamic>> getLoggedInUser() =>
      firestore.collection(FirestoreCollections.users).doc(loggedInUserId).get().then(
            (doc) => doc.data()!,
          );

  Future<List<Map<String, dynamic>>> getTransactions() =>
      firestore.collection(FirestoreCollections.transactions).get().then(
            (snapshot) => snapshot.docs
                .map(
                  (doc) => doc.data(),
                )
                .toList(),
          );

  Future<void> createTransaction(NewTransactionDto transactionDto) async {
    final userCollection = firestore.collection(FirestoreCollections.users);
    final transactionCollection = firestore.collection(FirestoreCollections.transactions);
    final senderDoc = userCollection.doc(transactionDto.sender);
    final receiverDoc = userCollection.doc(transactionDto.receiver);

    await firestore.runTransaction((Transaction transaction) async {
      final senderSnapshot = await transaction.get(senderDoc);
      final receiverSnapshot = await transaction.get(receiverDoc);

      final double senderBalance = double.parse( senderSnapshot.get('balance') as String);
      final double receiverBalance = double.parse(receiverSnapshot.get('balance') as String);
      final double senderBalanceAfterTransaction = senderBalance - transactionDto.amount;
      final double receiverBalanceAfterTransaction = receiverBalance + transactionDto.amount;

      transaction.update(senderDoc, {'balance': senderBalanceAfterTransaction.toString()});
      transaction.update(receiverDoc, {'balance': receiverBalanceAfterTransaction.toString()});

      transaction.set(transactionCollection.doc(), transactionDto.toJson());
    });
  }
}
