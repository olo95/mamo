import 'package:mamo/domain/base/mamo_exception.dart';
import 'package:mamo/domain/base/result.dart';
import 'package:mamo/domain/transaction/model/transaction.dart';

abstract interface class TransactionRepository {
  Future<Result<void, MamoException>> createUserSendTransaction({
    required String receiverId,
    required int amountToSend,
  });

  Future<Result<List<Transaction>, MamoException>> getUserTransactions();
}
