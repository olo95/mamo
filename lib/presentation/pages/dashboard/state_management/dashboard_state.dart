import 'package:mamo/domain/base/buildable_state.dart';
import 'package:mamo/domain/base/listenable_state.dart';
import 'package:mamo/domain/dashboard/model/transaction_details.dart';
import 'package:mamo/domain/user/model/user.dart';

sealed class DashboardState {
  final User? currentUser;
  final List<User> frequentUsers;
  final List<User> allUsers;
  final List<TransactionDetails> recentTransactions;

  DashboardState({
    required this.currentUser,
    required this.frequentUsers,
    required this.allUsers,
    required this.recentTransactions,
  });
}

class DashboardLoadingState extends DashboardState implements BuildableState {
  DashboardLoadingState({
    required super.currentUser,
    required super.frequentUsers,
    required super.allUsers,
    required super.recentTransactions,
  });
}

class DashboardLoadedState extends DashboardState implements BuildableState {
  DashboardLoadedState({
    required super.currentUser,
    required super.frequentUsers,
    required super.allUsers,
    required super.recentTransactions,
  });
}

class DashboardErrorState extends DashboardState implements ListenableState {
  DashboardErrorState({
    required super.currentUser,
    required super.frequentUsers,
    required super.allUsers,
    required super.recentTransactions,
  });
}
