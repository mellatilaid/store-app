import 'package:flutter/material.dart';

import '../models/product_model.dart';
import 'custom_product_card.dart';

class ProductsGridViewBuilder extends StatelessWidget {
  const ProductsGridViewBuilder({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      clipBehavior: Clip.none,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.6,
        crossAxisSpacing: 10,
        mainAxisSpacing: 70,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return CustomProductCard(
          product: products[index],
        );
      },
    );
  }
}
