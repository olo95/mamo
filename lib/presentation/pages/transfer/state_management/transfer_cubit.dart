import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamo/domain/user/model/user.dart';
import 'package:mamo/presentation/pages/transfer/state_management/transfer_state.dart';

final class TransferCubit extends Cubit<TransferState> {
  TransferCubit() : super(TransferInitialState());

  late final User receiver;
  late final double currentBalance;

  double amountToSend = 0;

  void init({required User receiver, required double currentBalance}) {
    this.receiver = receiver;
    this.currentBalance = currentBalance;

    emit(
      TransferLoadedState(
        currentBalance: currentBalance,
        stateVariant: TransferLoadedStateVariant.emptyState,
      ),
    );
  }

  void onSelectedAmountChanged(String amount) {
    final double amountValue = double.tryParse(amount) ?? 0;
    final TransferLoadedStateVariant stateVariant = amountValue > 0
        ? amountValue <= currentBalance
            ? TransferLoadedStateVariant.validState
            : TransferLoadedStateVariant.unsufficentBalanceState
        : TransferLoadedStateVariant.emptyState;

    amountToSend = amountValue;

    emit(
      TransferLoadedState(
        currentBalance: currentBalance,
        stateVariant: stateVariant,
      ),
    );
  }

  void proceedWithTransaction() {
    if (state is TransferLoadedState && (state as TransferLoadedState).stateVariant == TransferLoadedStateVariant.validState) {
      // Proceed with transaction
    }
  }
}
