import 'package:flutter/material.dart';
import 'package:mamo/presentation/pages/transfer_confirm/state_management/transfer_confirm_cubit.dart';

class TransferConfirmPage extends StatelessWidget {
  final TransferConfirmCubit transferConfirmCubit;

  const TransferConfirmPage({
    required this.transferConfirmCubit,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Confirm transfer'),
        ),
        body: Column(
          children: [
            Text('Send money to'),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      transferConfirmCubit.sendTransfer();
                    },
                    child: Text('Send'),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
