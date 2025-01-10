import 'package:mamo/domain/user/model/user.dart';

sealed class TransferConfirmState {}

class TransferConfirmInitialState extends TransferConfirmState {
  final User receiver;
  final double amountToSend;

  TransferConfirmInitialState({
    required this.receiver,
    required this.amountToSend,
  });
}