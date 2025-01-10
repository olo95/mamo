import 'package:mamo/domain/base/mamo_exception.dart';
import 'package:mamo/domain/base/result.dart';
import 'package:mamo/domain/transaction/model/transaction.dart';

abstract interface class TransactionRepository {
  Future<Result<Transaction, MamoException>> createUserSendTransaction({
    required String receiverId,
    required double amountToSend,
  });

  Future<Result<List<Transaction>, MamoException>> getUserTransactions();
}
