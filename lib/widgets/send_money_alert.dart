import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/cubits/transaction_cubit/transaction_cubit.dart';
import 'package:training/cubits/transaction_cubit/transaction_cubit_states.dart';
import 'package:training/widgets/transaction_resault.dart';

import 'transaction_form_diaog.dart';

class SendMoneyAlert extends StatelessWidget {
  final TextEditingController receiverController;
  final TextEditingController amountController;
  const SendMoneyAlert({
    super.key,
    required this.receiverController,
    required this.amountController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TransactionCubit, TransactionState>(
      listener: (context, state) {
        if (state is SucseedTransactionState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is NotEnoughAmountTransactionState) {
          return const TransactionResaultDialage(
            content:
                "you don't have that amount of balance , please recharge your wallet and try again",
          );
        } else if (state is NoEmailState) {
          return const TransactionResaultDialage(
              content: 'This email does not exist');
        } else if (state is ErrorTransactionState) {
          return TransactionResaultDialage(
              content: 'oops there was a problem ${state.errMessage}');
        }
        return TransactionFormDialog(
          emailController: receiverController,
          amountController: amountController,
        );
      },
    );
  }
}


/*BlocListener<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is SucseedTransactionState ||
              state is FailedTransactionState) {
            Navigator.pop(context);
          }
        },
        child: BlocBuilder<TransactionCubit, TransactionState>(
          builder: (context, state) {
            if (state is InitialState) {
              return AlertDialog(
                actionsPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                title: const Text('Charge Wallet:'),
                content: Form(
                  key: formKey,
                  child: Column(
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
                      CustomAuthTextField(
                        textInputType: TextInputType.number,
                        controller: receiverController,
                        labelText: 'Receiver Email',
                      ),
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<TransactionCubit>(context)
                            .sendMoneyCubit(
                                receiverEmail: receiverController.text,
                                amount: amountController.text);
                      }
                    },
                    child: const Text('Send'),
                  ),
                  CustomTextButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    actionText: 'Cancel',
                  ),
                ],
              );
            } else if (state is SucseedTransactionState) {
              return const TransactionResaultDialage();
            } else if (state is FailedTransactionState) {
              return const Center(
                child: Text('you do not have that amount of money'),
              );
            } else if (state is NoEmailState) {
              return const Center(
                child: Text('the email you provided does not exist'),
              );
            } else {
              return const Center(
                child: Text('oops there was a problem'),
              );
            }
          },
        ),
      );*/