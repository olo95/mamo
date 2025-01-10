import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamo/domain/user/model/user.dart';
import 'package:mamo/presentation/pages/transfer/state_management/transfer_cubit.dart';
import 'package:mamo/presentation/pages/transfer/state_management/transfer_state.dart';
import 'package:mamo/presentation/pages/transfer/widgets/transfer_loaded.dart';
import 'package:mamo/presentation/widgets/mamo_loader.dart';

class TransferPage extends StatefulWidget {
  final TransferCubit transferCubit;
  final User receiver;
  final double currentBalance;

  const TransferPage({
    required this.transferCubit,
    required this.receiver,
    required this.currentBalance,
    super.key,
  });

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  @override
  void initState() {
    widget.transferCubit.init(
      receiver: widget.receiver,
      currentBalance: widget.currentBalance,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text('Enter amount to send'),
        ),
        body: BlocBuilder<TransferCubit, TransferState>(
          builder: (context, state) => switch (state) {
            TransferInitialState() => const MamoLoader(),
            TransferLoadingState() => const MamoLoader(),
            TransferLoadedState(
              currentBalance: double currentBalance,
              stateVariant: TransferLoadedStateVariant stateVariant,
            ) =>
              TransferLoaded(
                currentBalance: currentBalance,
                stateVariant: stateVariant,
                onSelectedAmountChanged: widget.transferCubit.onSelectedAmountChanged,
              ),
          },
        ),
      );
}
