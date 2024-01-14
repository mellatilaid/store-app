import 'package:flutter/material.dart';

import '../widgets/cart_view_body.dart';
import '../widgets/custom_bottom_buy_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  static String id = 'cartPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: const CartViewBody(),
      bottomNavigationBar: const CustomBottomBuyBar(),
    );
  }
}
