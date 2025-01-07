import 'package:mamo/domain/user/model/user.dart';

class DashboardData {
  final List<User> frequentUsers;
  final List<User> allUsers;

  DashboardData({
    required this.frequentUsers,
    required this.allUsers,
  });
}
