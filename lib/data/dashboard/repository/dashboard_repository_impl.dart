import 'package:mamo/domain/base/mamo_exception.dart';
import 'package:mamo/domain/base/result.dart';
import 'package:mamo/domain/dashboard/model/dashboard_data.dart';
import 'package:mamo/domain/dashboard/repository/dashboard_repository.dart';
import 'package:mamo/domain/transaction/model/transaction.dart';
import 'package:mamo/domain/transaction/repository/transaction_repository.dart';
import 'package:mamo/domain/user/model/user.dart';
import 'package:mamo/domain/user/repository/user_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final UserRepository userRepository;
  final TransactionRepository transactionRepository;

  DashboardRepositoryImpl({
    required this.userRepository,
    required this.transactionRepository,
  });

  @override
  Future<Result<DashboardData, MamoException>> getDashboardData() async {
    final Result<User, MamoException> loggedInUserResult = await userRepository.getLoggedInUser();
    final Result<List<User>, MamoException> allUsersResult = await userRepository.getUsers();
    final Result<List<Transaction>, MamoException> userTransactionsResult =
        await transactionRepository.getUserTransactions();

    switch (loggedInUserResult) {
      case Success(value: User loggedInUser):
        switch (allUsersResult) {
          case Success(value: List<User> allUsers):
            switch (userTransactionsResult) {
              case Success(value: List<Transaction> userTransactions):
                List<User> frequentUsers = getFiveFrequentUsersFromTransactions(
                  userTransactions: userTransactions,
                  allUsers: allUsers..removeWhere((user) => user.id == loggedInUser.id),
                  userId: loggedInUser.id,
                );

                return Success(
                  DashboardData(
                    currentUser: loggedInUser,
                    frequentUsers: frequentUsers,
                    allUsers: allUsers,
                  ),
                );
              case Failure(error: MamoException e):
                return Failure(e);
            }
          case Failure(error: MamoException e):
            return Failure(e);
        }
      case Failure(error: MamoException e):
        return Failure(e);
    }
  }

  List<User> getFiveFrequentUsersFromTransactions({
    required List<Transaction> userTransactions,
    required List<User> allUsers,
    required String userId,
  }) {
    List<User?> userPerTransaction = userTransactions.map((transaction) {
      if (transaction.sender == userId) {
        final int userIndexInAllUsers = allUsers.indexWhere((user) => user.id == transaction.receiver);

        if (userIndexInAllUsers != -1) {
          return allUsers[userIndexInAllUsers];
        } else {
          return null;
        }
      }

      if (transaction.receiver == userId) {
        final int userIndexInAllUsers = allUsers.indexWhere((user) => user.id == transaction.sender);

        if (userIndexInAllUsers != -1) {
          return allUsers[userIndexInAllUsers];
        } else {
          return null;
        }
      }
    }).toList();

    List<User> frequentUsers = userPerTransaction.where((user) => user != null).map((user) => user!).toList();

    Map<User, int> userTransactionCount = {};

    for (User user in frequentUsers) {
      if (userTransactionCount.containsKey(user)) {
        userTransactionCount[user] = userTransactionCount[user]! + 1;
      } else {
        userTransactionCount[user] = 1;
      }
    }

    userTransactionCount.entries.toList().sort((a, b) => b.value.compareTo(a.value));

    return userTransactionCount.keys.toList().take(5).toList();
  }
}
