import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamo/domain/base/default_currency_string_value.dart';
import 'package:mamo/domain/base/money.dart';
import 'package:mamo/domain/user/model/user.dart';
import 'package:mamo/presentation/pages/transfer/state_management/transfer_state.dart';

final class TransferCubit extends Cubit<TransferState> {
  TransferCubit() : super(TransferInitialState());

  late final User receiver;
  late final Money currentBalance;

  int amountToSend = 0;

  void init({required User receiver, required int currentBalance}) {
    this.receiver = receiver;
    this.currentBalance = Money(amount: currentBalance);

    emit(
      TransferLoadedState(
        currentBalance: Money(
          amount: currentBalance,
        ),
        stateVariant: TransferLoadedStateVariant.emptyState,
      ),
    );
  }

  void onSelectedAmountChanged(String amount) {
    final List<String> amountParts = amount.split(',');

    if (amountParts.length > 2) {
      assert(false, 'Amount split result should not have more than 2 parts');

      return;
    }

    late final int amountValue;

    switch (amountParts.length) {
      case 1:
        int? mayorPart = int.tryParse(amountParts[0]);
        amountValue = mayorPart != null ? mayorPart * 100 : 0;
        break;
      case 2:
        int? mayorPart = int.tryParse(amountParts[0]);
        int? minorPart = int.tryParse(amountParts[1]);

        amountValue = (mayorPart != null ? mayorPart * 100 : 0) + (minorPart ?? 0);
        break;
      default:
        amountValue = 0;
    }

    final TransferLoadedStateVariant stateVariant = amountValue > 0
        ? amountValue <= currentBalance.amount
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
    if (state is TransferLoadedState &&
        (state as TransferLoadedState).stateVariant == TransferLoadedStateVariant.validState) {
      emit(
        TransferProceedState(
          receiverId: receiver.id,
          receiverName: receiver.name,
          amountToSend: amountToSend,
        ),
      );
    }
  }
}
