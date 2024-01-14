import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/cubits/cart_cubits/cart_cubit.dart';
import 'package:training/cubits/cart_cubits/cart_cubit_states.dart';

class CustomBottomBuyBar extends StatelessWidget {
  const CustomBottomBuyBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageCartCubit, CartState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${BlocProvider.of<ManageCartCubit>(context).totalPrice}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(140, 40),
                ),
                onPressed: () {
                  BlocProvider.of<ManageCartCubit>(context).buyProducts();
                },
                child: const Text('Buy'),
              ),
            ],
          ),
        );
      },
    );
  }
}
