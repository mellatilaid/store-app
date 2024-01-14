import 'package:dio/dio.dart';
import 'package:training/helper/api.dart';

class UpdataProductService {
  final Dio dio;

  const UpdataProductService({required this.dio});

  Future<void> updateProduct({
    required int id,
    required String title,
    required String price,
    required String description,
    required String image,
    required String categroy,
  }) async {
    await Api(dio: dio).put(
      url: 'https://fakestoreapi.com/products/$id',
      data: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': categroy,
      },
    );
    //return ProductModel.fromjson(data);
  }
}
