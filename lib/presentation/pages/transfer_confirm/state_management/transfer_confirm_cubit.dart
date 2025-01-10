import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamo/domain/base/mamo_exception.dart';
import 'package:mamo/domain/base/result.dart';
import 'package:mamo/domain/transaction/model/transaction.dart';
import 'package:mamo/domain/transaction/repository/transaction_repository.dart';
import 'package:mamo/domain/user/model/user.dart';
import 'package:mamo/presentation/pages/transfer_confirm/state_management/transfer_confirm_state.dart';

final class TransferConfirmCubit extends Cubit<TransferConfirmState> {
  final User receiver;
  final double amountToSend;

  final TransactionRepository transactionRepository;

  TransferConfirmCubit({
    required this.receiver,
    required this.amountToSend,
    required this.transactionRepository,
  }) : super(
          TransferConfirmInitialState(
            receiver: receiver,
            amountToSend: amountToSend,
          ),
        );

  Future<void> sendTransfer() async {
    final Result<Transaction, MamoException> transactionResult = await transactionRepository.createUserSendTransaction(
      receiverId: receiver.id,
      amountToSend: amountToSend,
    );
  }
}
