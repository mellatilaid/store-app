import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/cubits/cart_cubits/cart_cubit_states.dart';

import '../cubits/cart_cubits/cart_cubit.dart';
import '../helper/const.dart';
import '../views/cart_view.dart';

class CustomBudgeCount extends StatelessWidget {
  const CustomBudgeCount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageCartCubit, CartState>(
      builder: (context, state) {
        return Badge.count(
          count: BlocProvider.of<ManageCartCubit>(context).productsCount,
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, CartPage.id);
            },
            icon: Icon(
              Icons.shopping_cart,
              color: kTextColor,
            ),
          ),
        );
      },
    );
  }
}
