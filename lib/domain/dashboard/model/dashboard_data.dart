import 'package:mamo/domain/dashboard/model/transaction_details.dart';
import 'package:mamo/domain/user/model/user.dart';

class DashboardData {
  final User? currentUser;
  final List<User> frequentUsers;
  final List<User> allUsers;
  final List<TransactionDetails> recentTransactions;

  DashboardData({
    required this.currentUser,
    required this.frequentUsers,
    required this.allUsers,
    required this.recentTransactions,
  });
}
