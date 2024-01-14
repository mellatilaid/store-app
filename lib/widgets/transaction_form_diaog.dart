// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/cubits/transaction_cubit/transaction_cubit_states.dart';

import '../cubits/transaction_cubit/transaction_cubit.dart';
import 'custom_auth_form_field.dart';
import 'custom_text_button.dart';

class TransactionFormDialog extends StatefulWidget {
  TransactionFormDialog({
    super.key,
    required this.emailController,
    required this.amountController,
  });
  TextEditingController emailController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  State<TransactionFormDialog> createState() => _TransactionFormDialogState();
}

class _TransactionFormDialogState extends State<TransactionFormDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        return AlertDialog(
          actionsPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          title: const Text('Charge Wallet:'),
          content: Form(
            key: _formKey,
            autovalidateMode: autovalidateMode,
            child: AbsorbPointer(
              absorbing: state is OnProgressTransactionState ? true : false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomAuthTextField(
                    textInputType: TextInputType.number,
                    controller: widget.amountController,
                    labelText: 'amount of money',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomAuthTextField(
                    controller: widget.emailController,
                    labelText: 'Receiver Email',
                  ),
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  BlocProvider.of<TransactionCubit>(context).sendMoneyCubit(
                      receiverEmail: widget.emailController.text,
                      amount: widget.amountController.text);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              child: state is OnProgressTransactionState
                  ? const SizedBox(
                      height: 17,
                      width: 17,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : const Text('Send'),
            ),
            CustomTextButton(
              onTap: () {
                Navigator.pop(context);
              },
              actionText: 'Cancel',
            ),
          ],
        );
      },
    );
  }
}
