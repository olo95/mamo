import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamo/domain/base/buildable_state.dart';
import 'package:mamo/domain/base/listenable_state.dart';
import 'package:mamo/domain/user/model/user.dart';
import 'package:mamo/presentation/pages/dashboard/state_management/dashboard_cubit.dart';
import 'package:mamo/presentation/pages/dashboard/state_management/dashboard_state.dart';
import 'package:mamo/presentation/pages/dashboard/widgets/dashboard_loaded.dart';

class DashboardPage extends StatefulWidget {
  final DashboardCubit dashboardCubit;

  const DashboardPage({required this.dashboardCubit, super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    widget.dashboardCubit.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<DashboardCubit, DashboardState>(
        listenWhen: (_, current) => current is ListenableState,
        buildWhen: (_, current) => current is BuildableState,
        listener: (context, state) {
          if (state is DashboardErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Something went wrong'),
              ),
            );
          }
        },
        builder: (context, state) => switch (state) {
          DashboardLoadedState() => DashboardLoaded(
              isLoading: false,
              currentUser: state.currentUser,
              frequentUsers: state.frequentUsers,
              allUsers: state.allUsers,
            ),
          DashboardLoadingState() => DashboardLoaded(
              isLoading: true,
              currentUser: state.currentUser,
              frequentUsers: state.frequentUsers,
              allUsers: state.allUsers,
            ),
          DashboardErrorState() => DashboardLoaded(
              isLoading: false,
              currentUser: state.currentUser,
              frequentUsers: state.frequentUsers,
              allUsers: state.allUsers,
            ),
        },
      );
}
