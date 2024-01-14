import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../services/update_product_service.dart';
import 'custom_text_field.dart';

class UpdateProductViewBody extends StatefulWidget {
  final ProductModel product;
  const UpdateProductViewBody({super.key, required this.product});

  @override
  State<UpdateProductViewBody> createState() => _UpdateProductViewBodyState();
}

class _UpdateProductViewBodyState extends State<UpdateProductViewBody> {
  bool isLoading = false;

  String? title, price, desc, image, category;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      children: [
        CustomTextField(
          onChanged: (data) {
            title = data;
          },
          hintText: 'name',
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
          onChanged: (data) {
            price = data;
          },
          hintText: 'price',
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
          onChanged: (data) {
            desc = data;
          },
          hintText: 'description',
        ),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
          onChanged: (data) {
            image = data;
          },
          hintText: 'image',
        ),
        const SizedBox(
          height: 45,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isLoading = true;
            });

            try {
              updateProduct(widget.product);
            } on Exception catch (e) {
              throw Exception(e.toString());
            }
            setState(() {
              isLoading = false;
            });
          },
          child: isLoading
              ? Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(child: CircularProgressIndicator()),
                )
              : Container(
                  width: double.infinity,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 53, 151, 231),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'Update',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
        )
      ],
    );
  }

  void updateProduct(ProductModel product) {
    UpdataProductService(dio: Dio()).updateProduct(
      id: product.id,
      title: title ?? product.title,
      price: price.toString(),
      description: desc ?? product.description,
      image: image ?? product.image,
      categroy: product.category,
    );
  }
}
