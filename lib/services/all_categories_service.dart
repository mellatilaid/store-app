import 'package:dio/dio.dart';
import 'package:training/helper/api.dart';

class GetAllGetegories {
  final Dio dio;

  const GetAllGetegories({required this.dio});

  Future<List<dynamic>> getAllProducts() async {
    List<dynamic> data = await Api(dio: Dio()).get(url: 'categories');

    return data;
  }
}
