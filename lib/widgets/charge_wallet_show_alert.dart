import 'package:flutter/material.dart';

import '../firabase/charge_wallet.dart';
import 'custom_auth_form_field.dart';
import 'custom_text_button.dart';

class ChargeWalletAlert extends StatelessWidget {
  final TextEditingController amountController;
  const ChargeWalletAlert({super.key, required this.amountController});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      title: const Text('Charge Wallet:'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomAuthTextField(
            textInputType: TextInputType.number,
            controller: amountController,
            labelText: 'amount of money',
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () async {
            await chargeWallet(amount: amountController.text);
          },
          child: const Text('Charge'),
        ),
        CustomTextButton(
          onTap: () {
            Navigator.pop(context);
          },
          actionText: 'Cancel',
        ),
      ],
    );
  }
}
