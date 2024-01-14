import 'package:dio/dio.dart';

class Api {
  final Dio dio;

  const Api({required this.dio});
  Future<dynamic> get({required String url, String? token}) async {
    Map<String, dynamic> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    try {
      Response response = await dio.get(url);
      return response.data;
    } on DioException catch (e) {
      final String errMessage =
          e.response?.data ?? 'oops there was a problem laid';
      throw Exception(errMessage);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> post(
      {required String url, dynamic data, String? token}) async {
    Map<String, dynamic> headers = {};
    if (token != null) {
      headers = {
        'Authorization': 'Bearer $token',
      };
    }
    try {
      Response response = await dio.post(
        url,
        data: data,
        options: Options(headers: headers),
      );
      return response.data;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'];
      throw Exception(errMessage);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<dynamic> put(
      {required String url, dynamic data, String? token}) async {
    Map<String, dynamic> headers = {};
    headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    try {
      Response response = await dio.put(
        url,
        data: data,
        options: Options(headers: headers),
      );

      return response.data;
    } on DioException catch (e) {
      final errMessage = e.response?.data['message'];
      throw Exception(errMessage);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
