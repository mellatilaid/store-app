import 'package:dio/dio.dart';
import 'package:training/helper/api.dart';
import 'package:training/models/product_model.dart';

class GetCategoryByName {
  final Dio dio;

  const GetCategoryByName({required this.dio});

  Future<List<dynamic>> getCategory({required String categoryName}) async {
    if (categoryName.isNotEmpty) {
      List<dynamic> data = await Api(dio: Dio())
          .get(url: 'https://fakestoreapi.com/products/category/$categoryName');

      List<ProductModel> category = [];
      for (var product in data) {
        category.add(ProductModel.fromjson(product));
      }
      print(category);
      return category;
    } else {
      return [];
    }
  }
}
