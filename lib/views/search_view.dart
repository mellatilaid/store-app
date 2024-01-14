import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:training/models/product_model.dart';
import 'package:training/services/caegory_by_name_service.dart';
import 'package:training/widgets/custom_text_field.dart';

import '../widgets/products_grid_view_builder.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isLoading = false;
  List<dynamic> products = [];
  String categoryName = '';
  Future<List<dynamic>>? future;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: CustomTextField(
            onSubmetted: (data) {
              setState(() {
                isLoading = true;
                categoryName = data;
                future = GetCategoryByName(dio: Dio())
                    .getCategory(categoryName: categoryName);
              });
            },
            hintText: 'search',
            suffixIcon: const Icon(Icons.search),
            verPadding: 0,
          ),
        ),
      ),
      body: isLoading
          ? FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  products = snapshot.data!;
                  if (products.isEmpty) {
                    return const Center(
                      child: Text('there is no products for this category'),
                    );
                  } else {
                    return ProductsGridViewBuilder(
                        products: products as List<ProductModel>);
                  }
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('oops there was a problem ${snapshot.error}'),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            )
          : const Center(
              child: Text('Search For Everything you need'),
            ),
    );
  }
}
