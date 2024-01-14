import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/cubits/cart_cubits/cart_cubit.dart';
import 'package:training/models/product_model.dart';

class CustomCartProduct extends StatelessWidget {
  //final ProductModel product;
  final ProductModel product;
  const CustomCartProduct({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: Image.network(
          product.image,
          width: 50,
        ),
        title: Text(product.title.substring(0, 10)),
        subtitle: Text('\$${product.price}'),
        trailing: IconButton(
          onPressed: () {
            BlocProvider.of<ManageCartCubit>(context)
                .removerFromCart(product: product);
          },
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
