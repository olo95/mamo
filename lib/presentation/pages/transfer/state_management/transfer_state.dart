import 'package:mamo/domain/base/buildable_state.dart';
import 'package:mamo/domain/base/listenable_state.dart';
import 'package:mamo/domain/user/model/user.dart';

enum TransferLoadedStateVariant {
  emptyState,
  validState,
  unsufficentBalanceState,
}

sealed class TransferState {}

class TransferInitialState extends TransferState implements BuildableState {}

class TransferLoadingState extends TransferState implements BuildableState {}

class TransferLoadedState extends TransferState implements BuildableState {
  final double currentBalance;
  final TransferLoadedStateVariant stateVariant;

  TransferLoadedState({
    required this.currentBalance,
    required this.stateVariant,
  });
}

class TransferProceedState extends TransferState implements ListenableState {
  final User receiver;
  final double amountToSend;

  TransferProceedState({
    required this.receiver,
    required this.amountToSend,
  });
}
