import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamo/domain/base/mamo_exception.dart';
import 'package:mamo/domain/base/money.dart';
import 'package:mamo/domain/base/result.dart';
import 'package:mamo/domain/transaction/repository/transaction_repository.dart';
import 'package:mamo/presentation/pages/transfer_confirm/state_management/transfer_confirm_state.dart';

final class TransferConfirmCubit extends Cubit<TransferConfirmState> {
  final String receiverId;
  final String receiverName;
  final int amountToSend;

  final TransactionRepository transactionRepository;

  TransferConfirmCubit({
    required this.receiverId,
    required this.receiverName,
    required this.amountToSend,
    required this.transactionRepository,
  }) : super(
          TransferConfirmInitialState(
            receiverName: receiverName,
            amountToSend: Money(amount: amountToSend).amountFormatted,
          ),
        );

  Future<void> sendTransfer() async {
    _emitLoadingState();
    final Result<void, MamoException> transactionResult = await transactionRepository.createUserSendTransaction(
      receiverId: receiverId,
      amountToSend: amountToSend,
    );

    switch (transactionResult) {
      case Success():
        emit(TransferConfirmSuccessState());
        break;
      case Failure(error: MamoException exception):
        emit(TransferConfirmErrorState());
        _emitInitialState();
        break;
    }
  }

  void _emitInitialState() => emit(
        TransferConfirmInitialState(
          receiverName: receiverName,
          amountToSend: Money(amount: amountToSend).amountFormatted,
        ),
      );

  void _emitLoadingState() => emit(
        TransferConfirmLoadingState(
          receiverName: receiverName,
          amountToSend: Money(amount: amountToSend).amountFormatted,
        ),
      );
}
