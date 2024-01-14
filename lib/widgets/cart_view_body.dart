import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cart_cubits/cart_cubit.dart';
import '../cubits/cart_cubits/cart_cubit_states.dart';
import 'custom_cart_product.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageCartCubit, CartState>(
      builder: (context, state) {
        if (state is CartIniatialState) {
          return const Center(
            child: Text('There is no products'),
          );
        } else if (state is CartProductsState) {
          return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return CustomCartProduct(product: state.products[index]);
            },
          );
        } else if (state is BuySuccessState) {
          return const Center(
            child: Text('enjoy your products'),
          );
        } else if (state is NotEnoughBalanceState) {
          return const Center(
            child: Text(
              'You do not have that amount of money please recharge your wallet',
              textAlign: TextAlign.center,
            ),
          );
        } else if (state is BuyFailedState) {
          return Center(
            child: Text(
              'there was a problem in buying the products ${state.errMessage} please try later',
              textAlign: TextAlign.center,
            ),
          );
        } else if (state is BuyLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const Text('oops there was a problem , try later');
        }
      },
    );
  }
}



      /*StreamBuilder(
          stream: _cartStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
              if (documents.isEmpty) {
                return const Center(
                  child: Text('There is no products in your cart'),
                );
              }
              return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> product =
                      documents[index].data() as Map<String, dynamic>;
                  return CustomCartProduct(
                    product: product,
                  );
                },
              );
            } else {
              return const Center(
                child: Text('oops there was a problem'),
              );
            }
          })*/