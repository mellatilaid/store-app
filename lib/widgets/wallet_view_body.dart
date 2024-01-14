import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/widgets/wallet_action_button.dart';

import '../cubits/transaction_cubit/transaction_cubit.dart';
import '../helper/const.dart';
import 'charge_wallet_show_alert.dart';
import 'send_money_alert.dart';

class WalletViewBody extends StatefulWidget {
  const WalletViewBody({super.key});

  @override
  State<WalletViewBody> createState() => _WalletViewBodyState();
}

class _WalletViewBodyState extends State<WalletViewBody> {
  final Stream _amountStream = FirebaseFirestore.instance
      .collection(kUsersColRef)
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

  final _chargeMondyController = TextEditingController();
  final _receiverMeneyController = TextEditingController();
  double balance = 0;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Card(
          elevation: 3,
          child: Container(
            padding: const EdgeInsets.all(24),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: StreamBuilder(
              stream: _amountStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  roundNumber(snapshot.data[kAmount]);
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Your Balance',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        r'$' '$balance',
                        style: const TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: Text('oops there was a problm with your amount'),
                  );
                }
              },
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            WalletActionButton(
              iconData: Icons.arrow_downward,
              iconName: 'استقبال',
              onTap: () {},
            ),
            WalletActionButton(
              iconData: Icons.add,
              iconName: 'Charge Wallet',
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (context) {
                    return ChargeWalletAlert(
                        amountController: _chargeMondyController);
                  },
                );

                _chargeMondyController.clear();
              },
            ),
            WalletActionButton(
              iconData: Icons.arrow_upward,
              iconName: 'Send',
              onTap: () {
                BlocProvider.of<TransactionCubit>(context).resetState();
                showDialog(
                  context: context,
                  builder: (context) {
                    return SendMoneyAlert(
                      receiverController: _receiverMeneyController,
                      amountController: _chargeMondyController,
                    );
                  },
                );

                _chargeMondyController.clear();
                _receiverMeneyController.clear();
              },
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  roundNumber(num value) {
    num val = pow(10.0, 2);
    balance = ((value * val).round().toDouble() / val);
  }
}
