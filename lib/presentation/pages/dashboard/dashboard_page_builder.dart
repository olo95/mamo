import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamo/presentation/app_container_provider.dart';
import 'package:mamo/presentation/pages/dashboard/dashboard_page.dart';
import 'package:mamo/presentation/pages/dashboard/state_management/dashboard_cubit.dart';

class DashboardPageBuilder extends StatelessWidget {
  const DashboardPageBuilder({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => AppContainerProvider.of(context).dashboardCubit,
        child: Builder(
          builder: (context) => DashboardPage(
            dashboardCubit: BlocProvider.of<DashboardCubit>(context),
          ),
        ),
      );
}
