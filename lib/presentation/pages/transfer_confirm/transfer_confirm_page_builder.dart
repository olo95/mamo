import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamo/presentation/app_container_provider.dart';
import 'package:mamo/presentation/pages/transfer_confirm/state_management/transfer_confirm_cubit.dart';
import 'package:mamo/presentation/pages/transfer_confirm/transfer_confirm_page.dart';

class TransferConfirmPageBuilder extends StatelessWidget {
  final String receiverId;
  final String receiverName;
  final double amountToSend;

  const TransferConfirmPageBuilder({
    required this.receiverId,
    required this.receiverName,
    required this.amountToSend,
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocProvider<TransferConfirmCubit>(
        create: (_) => AppContainerProvider.of(context).transferConfirmCubit(
          receiverId: receiverId,
          receiverName: receiverName,
          amountToSend: amountToSend,
        ),
        child: Builder(
          builder: (context) => TransferConfirmPage(
            transferConfirmCubit: BlocProvider.of<TransferConfirmCubit>(context),
          ),
        ),
      );
}
