import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mamo/domain/base/buildable_state.dart';
import 'package:mamo/domain/base/listenable_state.dart';
import 'package:mamo/presentation/pages/transfer_confirm/state_management/transfer_confirm_cubit.dart';
import 'package:mamo/presentation/pages/transfer_confirm/state_management/transfer_confirm_state.dart';
import 'package:mamo/presentation/pages/transfer_confirm/widgets/transfer_confirm_loaded.dart';
import 'package:mamo/presentation/routing/routes.dart';
import 'package:mamo/presentation/widgets/mamo_loader.dart';
import 'package:mamo/presentation/widgets/mamo_snackbar.dart';

class TransferConfirmPage extends StatelessWidget {
  final TransferConfirmCubit transferConfirmCubit;

  const TransferConfirmPage({
    required this.transferConfirmCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocConsumer<TransferConfirmCubit, TransferConfirmState>(
        buildWhen: (_, current) => current is BuildableState,
        listenWhen: (_, current) => current is ListenableState,
        builder: (context, state) => switch (state) {
          TransferConfirmLoadingState() => Material(child: MamoLoader()),
          TransferConfirmInitialState(
            receiverName: String receiverName,
            amountToSend: String amountToSend,
          ) =>
            TransferConfirmLoaded(
              receiverName: receiverName,
              amountToSend: amountToSend,
              onSendTap: transferConfirmCubit.sendTransfer,
            ),
          TransferConfirmSuccessState() => TransferConfirmLoaded(
              receiverName: '',
              amountToSend: '',
              onSendTap: () {},
            ),
          TransferConfirmErrorState() => TransferConfirmLoaded(
              receiverName: '',
              amountToSend: '',
              onSendTap: () {},
            ),
        },
        listener: (context, state) {
          if (state is TransferConfirmSuccessState) {
            DashboardRoute().replace(context);

            ScaffoldMessenger.of(context).showMamoSnackBar('Transfer successful');
          }

          if (state is TransferConfirmErrorState) {
            ScaffoldMessenger.of(context).showMamoSnackBar('An error occurred. Please try again.');
          }
        },
      );
}
