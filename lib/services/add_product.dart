import 'package:dio/dio.dart';
import 'package:training/helper/api.dart';
import 'package:training/models/product_model.dart';

class AddProduct {
  final Dio dio;

  const AddProduct({required this.dio});

  Future<ProductModel> addProduct({
    required String title,
    required String price,
    required String description,
    required String image,
    required String categroy,
  }) async {
    Map<String, dynamic> data = await Api(dio: dio)
        .post(url: 'https://fakestoreapi.com/products', data: {
      'title': title,
      'price': price,
      'description': description,
      'image': image,
      'category': categroy,
    });
    return ProductModel.fromjson(data);
  }
}
