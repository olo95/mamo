import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mamo/domain/base/money.dart';
import 'package:mamo/presentation/pages/transfer/state_management/transfer_state.dart';
import 'package:mamo/presentation/style/dimens.dart';
import 'package:mamo/presentation/style/generated/colors.gen.dart';

class TransferLoaded extends StatefulWidget {
  final Money currentBalance;
  final TransferLoadedStateVariant stateVariant;

  final ValueChanged<String> onSelectedAmountChanged;
  final VoidCallback onNextPressed;

  const TransferLoaded({
    required this.currentBalance,
    required this.stateVariant,
    required this.onSelectedAmountChanged,
    required this.onNextPressed,
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
            Text(
              widget.currentBalance.amountFormatted,
              style: DefaultTextStyle.of(context).style.copyWith(
                    color: widget.stateVariant == TransferLoadedStateVariant.unsufficentBalanceState
                        ? MamoColors.error
                        : MamoColors.onSurface,
                  ),
            ),
            Spacer(),
            TextField(
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
              autofocus: true,
              onChanged: widget.onSelectedAmountChanged,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+(,\d{0,2})?$')),
              ],
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
                    onPressed: switch (widget.stateVariant) {
                      TransferLoadedStateVariant.emptyState => null,
                      TransferLoadedStateVariant.validState => widget.onNextPressed,
                      TransferLoadedStateVariant.unsufficentBalanceState => null,
                    },
                    child: Text(
                      switch (widget.stateVariant) {
                        TransferLoadedStateVariant.emptyState => 'Next',
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
