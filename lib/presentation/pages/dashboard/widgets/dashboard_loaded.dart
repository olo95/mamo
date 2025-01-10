import 'package:flutter/material.dart';
import 'package:mamo/domain/dashboard/model/transaction_details.dart';
import 'package:mamo/domain/user/model/user.dart';
import 'package:mamo/presentation/style/dimens.dart';
import 'package:mamo/presentation/style/generated/colors.gen.dart';

class DashboardLoaded extends StatelessWidget {
  final bool isLoading;
  final User? currentUser;
  final List<User> frequentUsers;
  final List<User> allUsers;
  final List<TransactionDetails> recentTransactions;

  final ValueChanged<User> onUserSelected;

  const DashboardLoaded({
    super.key,
    required this.isLoading,
    required this.currentUser,
    required this.frequentUsers,
    required this.allUsers,
    required this.recentTransactions,
    required this.onUserSelected,
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
              child: Padding(
                padding: const EdgeInsets.all(Dimens.l),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (frequentUsers.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Frequent users:'),
                          SizedBox(height: Dimens.m),
                          _DashboardHorizontalUserList(
                            users: frequentUsers,
                            onUserSelected: onUserSelected,
                          ),
                        ],
                      ),
                    SizedBox(height: Dimens.l),
                    if (allUsers.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('All users:'),
                          SizedBox(height: Dimens.m),
                          _DashboardHorizontalUserList(
                            users: allUsers,
                            onUserSelected: onUserSelected,
                          ),
                        ],
                      ),
                    SizedBox(height: Dimens.l),
                    if (recentTransactions.isNotEmpty) ...[
                      Text('Recent transactions'),
                      SizedBox(height: Dimens.m),
                      ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: recentTransactions.length,
                        itemBuilder: (context, index) => _DashboardTile(
                          title:
                              '${recentTransactions[index].senderName} -> ${recentTransactions[index].amount} AED -> ${recentTransactions[index].receiverName}',
                          onTap: () {},
                        ),
                        separatorBuilder: (context, index) => SizedBox(height: Dimens.s),
                      ),
                    ]
                  ],
                ),
              ),
            ),
            if (isLoading)
              Center(
                child: CircularProgressIndicator(),
              ),
          ],
        ),
      );
}

class _DashboardHorizontalUserList extends StatelessWidget {
  final List<User> users;
  final ValueChanged<User> onUserSelected;

  const _DashboardHorizontalUserList({
    required this.users,
    required this.onUserSelected,
  });

  @override
  Widget build(BuildContext context) {
    double dashboardTileSize = MediaQuery.sizeOf(context).width / 4;

    return SizedBox(
      height: dashboardTileSize,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: users.length,
        separatorBuilder: (context, index) => SizedBox(width: Dimens.m),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(bottom: Dimens.m),
          child: SizedBox(
            width: dashboardTileSize,
            child: _DashboardTile(
              title: users[index].name,
              onTap: () => onUserSelected(users[index]),
            ),
          ),
        ),
      ),
    );
  }
}

class _DashboardTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _DashboardTile({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: Dimens.s,
                spreadRadius: Dimens.xs,
              ),
            ],
            color: MamoColors.onPrimary,
            borderRadius: BorderRadius.circular(Dimens.s),
          ),
          child: Padding(
            padding: const EdgeInsets.all(Dimens.s),
            child: Center(child: Text(title)),
          ),
        ),
      );
}
