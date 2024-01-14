import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:training/widgets/products_grid_view_builder.dart';

import '../models/product_model.dart';
import '../services/all_products_service.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody>
    with AutomaticKeepAliveClientMixin {
  late Future<List<ProductModel>> data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = GetAllProducts(dio: Dio()).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: data,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ProductModel> products = snapshot.data!;
          return ProductsGridViewBuilder(products: products);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
