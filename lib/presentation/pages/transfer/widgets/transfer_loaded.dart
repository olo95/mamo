import 'package:flutter/material.dart';
import 'package:mamo/presentation/pages/transfer/state_management/transfer_state.dart';
import 'package:mamo/presentation/style/dimens.dart';
import 'package:mamo/presentation/style/generated/colors.gen.dart';

class TransferLoaded extends StatefulWidget {
  final double currentBalance;
  final TransferLoadedStateVariant stateVariant;

  final ValueChanged<String> onSelectedAmountChanged;

  const TransferLoaded({
    required this.currentBalance,
    required this.stateVariant,
    required this.onSelectedAmountChanged,
    super.key,
  });

  @override
  State<TransferLoaded> createState() => _TransferLoadedState();
}

class _TransferLoadedState extends State<TransferLoaded> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(Dimens.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Balance',
              style: DefaultTextStyle.of(context).style.copyWith(color: MamoColors.onSurface.withAlpha(150)),
            ),
            Text(widget.currentBalance.toString()),
            Spacer(),
            TextField(
              keyboardType: TextInputType.number,
              autofocus: true,
              onChanged: widget.onSelectedAmountChanged,
              decoration: InputDecoration(
                labelText: 'Enter amount',
                suffixText: 'AED',
                suffixStyle: DefaultTextStyle.of(context).style.copyWith(color: MamoColors.onSurface.withAlpha(150)),
              ),
            ),
            SizedBox(height: Dimens.l),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {},
                    child: Text(
                      switch (widget.stateVariant) {
                        TransferLoadedStateVariant.defaultState => 'Send',
                        TransferLoadedStateVariant.validState => 'Next',
                        TransferLoadedStateVariant.unsufficentBalanceState => 'Top-up wallet',
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
