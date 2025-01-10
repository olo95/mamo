import 'package:flutter/material.dart';
import 'package:mamo/presentation/style/dimens.dart';

class TransferConfirmLoaded extends StatelessWidget {
  final String receiverName;
  final String amountToSend;
  final VoidCallback onSendTap;

  const TransferConfirmLoaded({
    required this.receiverName,
    required this.amountToSend,
    required this.onSendTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Confirm transfer'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(Dimens.l),
          child: Column(
            children: [
              Text('Send money to'),
              Text(receiverName),
              SizedBox(height: Dimens.m),
              Text(amountToSend),
              Spacer(),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: onSendTap,
                      child: Text('Send'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
