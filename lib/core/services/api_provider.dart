import 'dart:developer';

import 'package:api_session_practice/core/utils/app_endPoints.dart';
import 'package:dio/dio.dart';

class DioProvider {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppEndpoints.baseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  static Future<Map<String, dynamic>> get(int limit) async {
    try {
      var response = await _dio.get(
        AppEndpoints.products,
        queryParameters: {'limit': limit},
      );
      log(response.data.toString());
      return response.data;
    } on DioException catch (e) {
      log('Error occurred: $e');

      rethrow;
    }
  }

  static Future<Map<String, dynamic>> post(String json) async {
    try {
      var response = await _dio.post(AppEndpoints.addToCart, data: {json});
      log(response.data);
      return response.data;
    } on DioException catch (e) {
      log('Error occurred: $e');
      return {};
    }
  }
}
