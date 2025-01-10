import 'package:mamo/domain/base/buildable_state.dart';
import 'package:mamo/domain/base/listenable_state.dart';
import 'package:mamo/domain/base/money.dart';

enum TransferLoadedStateVariant {
  emptyState,
  validState,
  unsufficentBalanceState,
}

sealed class TransferState {}

class TransferInitialState extends TransferState implements BuildableState {}

class TransferLoadingState extends TransferState implements BuildableState {}

class TransferLoadedState extends TransferState implements BuildableState {
  final Money currentBalance;
  final TransferLoadedStateVariant stateVariant;

  TransferLoadedState({
    required this.currentBalance,
    required this.stateVariant,
  });
}

class TransferProceedState extends TransferState implements ListenableState {
  final String receiverId;
  final String receiverName;
  final int amountToSend;

  TransferProceedState({
    required this.receiverId,
    required this.receiverName,
    required this.amountToSend,
  });
}
