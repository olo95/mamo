import 'package:flutter/material.dart';
import 'package:mamo/domain/user/model/user.dart';

class DashboardLoaded extends StatelessWidget {
  final bool isLoading;
  final User? currentUser;
  final List<User> frequentUsers;
  final List<User> allUsers;

  const DashboardLoaded({
    super.key,
    required this.isLoading,
    required this.currentUser,
    required this.frequentUsers,
    required this.allUsers,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            currentUser != null ? 'Hello ${currentUser!.name}!' : '',
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  if (frequentUsers.isNotEmpty)
                    Column(
                      children: [
                        Text('Frequent users:'),
                        for (final user in frequentUsers) Text(user.name),
                      ],
                    ),
                  SizedBox(
                    height: 16,
                  ),
                  if (allUsers.isNotEmpty)
                    Column(
                      children: [
                        Text('All users:'),
                        for (final user in allUsers) Text(user.name),
                      ],
                    ),
                ],
              ),
            ),
            if (isLoading) Center(child: CircularProgressIndicator(),),
          ],
        ),
      );
}
