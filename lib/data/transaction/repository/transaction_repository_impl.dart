import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:mamo/data/firestore/data_source/firestore_data_source.dart';
import 'package:mamo/data/transaction/model/new_transaction_dto.dart';
import 'package:mamo/data/transaction/model/transaction_dto.dart';
import 'package:mamo/domain/base/mamo_exception.dart';
import 'package:mamo/domain/base/result.dart';
import 'package:mamo/domain/transaction/model/transaction.dart';
import 'package:mamo/domain/transaction/repository/transaction_repository.dart';
import 'package:mamo/domain/user/model/user.dart';
import 'package:mamo/domain/user/repository/user_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final UserRepository userRepository;
  final FirestoreDataSource firestoreDataSource;

  TransactionRepositoryImpl({
    required this.userRepository,
    required this.firestoreDataSource,
  });

  @override
  Future<Result<void, MamoException>> createUserSendTransaction({
    required String receiverId,
    required int amountToSend,
  }) async {
    try {
      final Result<User, MamoException> loggedInUserResult = await userRepository.getLoggedInUser();

      switch (loggedInUserResult) {
        case Success(value: User user):
          final NewTransactionDto transactionDto = NewTransactionDto(
            sender: user.id,
            receiver: receiverId,
            amount: amountToSend,
            createdAt: firestore.FieldValue.serverTimestamp(),
          );

          await firestoreDataSource.createTransaction(transactionDto);

          return Success(null);
        case Failure(error: MamoException e):
          return Failure(e);
      }
    } catch (e) {
      return Failure(MamoGenericException(message: e.toString()));
    }
  }

  @override
  Future<Result<List<Transaction>, MamoException>> getUserTransactions() async {
    try {
      final Result<User, MamoException> loggedInUserResult = await userRepository.getLoggedInUser();
      final List<Map<String, dynamic>> transactionsResult = await firestoreDataSource.getTransactions();

      switch (loggedInUserResult) {
        case Success(value: User user):
          final List<TransactionDto> transactionDtoList = transactionsResult
              .map(
                TransactionDto.fromJson,
              )
              .toList()
              .where((transactionDto) => transactionDto.sender == user.id || transactionDto.receiver == user.id)
              .toList();

          final List<Transaction> transactionList = transactionDtoList
              .map(
                (transactionDto) => transactionDto.toDomain(),
              )
              .toList();

          return Success(transactionList);
        case Failure(error: MamoException e):
          return Failure(e);
      }
    } catch (e) {
      return Failure(MamoGenericException(message: e.toString()));
    }
  }
}
