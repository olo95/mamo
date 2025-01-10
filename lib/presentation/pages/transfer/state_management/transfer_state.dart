enum TransferLoadedStateVariant {
  defaultState,
  validState,
  unsufficentBalanceState,
}

sealed class TransferState {}

class TransferInitialState extends TransferState {}

class TransferLoadingState extends TransferState {}

class TransferLoadedState extends TransferState {
  final double currentBalance;
  final TransferLoadedStateVariant stateVariant;

  TransferLoadedState({
    required this.currentBalance,
    required this.stateVariant,
  });
}
