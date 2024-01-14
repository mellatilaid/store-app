import 'package:dio/dio.dart';
import 'package:training/helper/api.dart';
import 'package:training/models/product_model.dart';

class GetAllProducts {
  final Dio dio;

  const GetAllProducts({required this.dio});
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api(dio: Dio()).get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> products = [];
    for (var product in data) {
      products.add(ProductModel.fromjson(product));
    }
    return products;
  }
}
