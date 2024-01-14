import 'package:flutter/material.dart';
import 'package:training/widgets/wallet_view_body.dart';

import '../helper/const.dart';
import '../widgets/custom_budge_count.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});
  static String id = 'walletPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            )),
        title: Text(
          'My Wallet',
          style: TextStyle(color: kTextColor),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomBudgeCount(),
          ),
        ],
      ),
      body: const WalletViewBody(),
    );
  }
}
