import 'package:flutter/material.dart';

class TransferConfirmLoaded extends StatelessWidget {
  final VoidCallback onSendTap;

  const TransferConfirmLoaded({required this.onSendTap, super.key});

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
                    onPressed: onSendTap,
                    child: Text('Send'),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
