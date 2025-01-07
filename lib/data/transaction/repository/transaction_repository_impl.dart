import 'package:mamo/domain/base/mamo_exception.dart';
import 'package:mamo/domain/base/result.dart';
import 'package:mamo/domain/transaction/model/transaction.dart';
import 'package:mamo/domain/transaction/repository/transaction_repository.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  @override
  Future<Result<Transaction, MamoException>> createTransaction(Transaction transaction) {
    // TODO: implement createTransation
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Transaction>, MamoException>> getTransactions() {
    // TODO: implement getTransactions
    throw UnimplementedError();
  }
}
