import 'package:api_session_practice/core/services/api_provider.dart';
import 'package:api_session_practice/features/products/data/models/product_model.dart';
import 'package:api_session_practice/features/products/data/models/response_model.dart';
import 'package:dio/dio.dart';

class ProductsRepo {
  static Future<List<Product>?> fetchProducts(int limit) async {
    try {
      var res = await DioProvider.get(limit);
      return ResponseModel.fromJson(res).products;
    } on DioException catch (e) {
      rethrow;
    }
  }
}
