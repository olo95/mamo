import 'package:mamo/domain/base/buildable_state.dart';
import 'package:mamo/domain/base/listenable_state.dart';
import 'package:mamo/domain/user/model/user.dart';

sealed class DashboardState {
  final User? currentUser;
  final List<User> frequentUsers;
  final List<User> allUsers;

  DashboardState({
    required this.currentUser,
    required this.frequentUsers,
    required this.allUsers,
  });
}

class DashboardLoadingState extends DashboardState implements BuildableState {
  DashboardLoadingState({
    required super.currentUser,
    required super.frequentUsers,
    required super.allUsers,
  });
}

class DashboardLoadedState extends DashboardState implements BuildableState {
  DashboardLoadedState({
    required super.currentUser,
    required super.frequentUsers,
    required super.allUsers,
  });
}

class DashboardErrorState extends DashboardState implements ListenableState {
  DashboardErrorState({
    required super.currentUser,
    required super.frequentUsers,
    required super.allUsers,
  });
}
