import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mamo/presentation/app_container_provider.dart';
import 'package:mamo/presentation/pages/transfer/state_management/transfer_cubit.dart';
import 'package:mamo/presentation/pages/transfer/transfer_page.dart';
import 'package:mamo/presentation/routing/routes.dart';

class TransferPageBuilder extends StatelessWidget {
  final TransferRouteArguments transferRouteArguments;

  const TransferPageBuilder({required this.transferRouteArguments, super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<TransferCubit>(
        create: (_) => AppContainerProvider.of(context).transferCubit,
        child: Builder(
          builder: (context) => TransferPage(
            transferCubit: BlocProvider.of<TransferCubit>(context),
            receiver: transferRouteArguments.receiver,
            currentBalance: transferRouteArguments.currentBalance,
          ),
        ),
      );
}
