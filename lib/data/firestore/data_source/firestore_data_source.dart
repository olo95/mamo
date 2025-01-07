import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mamo/data/firestore/model/firestore_collections.dart';
import 'package:mamo/data/firestore/model/logged_in_user_id.dart';

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

  Future<List<Map<String, dynamic>>> getTransactions() => firestore.collection(FirestoreCollections.transactions).get().then(
        (snapshot) => snapshot.docs
            .map(
              (doc) => doc.data(),
            )
            .toList(),
      );
}
