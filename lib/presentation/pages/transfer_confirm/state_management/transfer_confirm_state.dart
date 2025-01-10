import 'package:mamo/domain/base/buildable_state.dart';
import 'package:mamo/domain/base/listenable_state.dart';

sealed class TransferConfirmState {}

class TransferConfirmInitialState extends TransferConfirmState implements BuildableState {
  final String receiverName;
  final double amountToSend;

  TransferConfirmInitialState({
    required this.receiverName,
    required this.amountToSend,
  });
}

class TransferConfirmLoadingState extends TransferConfirmState implements BuildableState {}

class TransferConfirmSuccessState extends TransferConfirmState implements ListenableState {}

class TransferConfirmErrorState extends TransferConfirmState implements BuildableState, ListenableState {}
