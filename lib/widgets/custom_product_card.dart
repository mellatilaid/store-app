import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training/cubits/cart_cubits/cart_cubit.dart';
import 'package:training/cubits/cart_cubits/cart_cubit_states.dart';
import 'package:training/models/product_model.dart';
import 'package:training/views/update_product_view.dart';

class CustomProductCard extends StatelessWidget {
  final ProductModel product;
  const CustomProductCard({
    super.key,
    required this.product,
  });

  @override
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ManageCartCubit>();
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          UpdateProductPage.id,
          arguments: product,
        );
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 8,
                offset: const Offset(8, 8),
              )
            ]),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(r'$' '${product.price}'),
                        BlocBuilder<ManageCartCubit, CartState>(
                          builder: (context, state) {
                            return IconButton(
                              onPressed: () {
                                if (cubit.items.contains(product)) {
                                  BlocProvider.of<ManageCartCubit>(context)
                                      .removerFromCart(product: product);
                                } else {
                                  BlocProvider.of<ManageCartCubit>(context)
                                      .addToCart(product: product);
                                }
                              },
                              icon: Icon(
                                Icons.favorite,
                                color: cubit.items.contains(product)
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            );
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -70,
            left: 60,
            child: Image(
              image: NetworkImage(product.image),
              width: 100,
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}
