import 'package:mamo/domain/user/model/user.dart';

class DashboardData {
  final User? currentUser;
  final List<User> frequentUsers;
  final List<User> allUsers;

  DashboardData({
    required this.currentUser,
    required this.frequentUsers,
    required this.allUsers,
  });
}
