import 'package:api_session_practice/features/products/data/models/product_model.dart';

class ResponseModel {
  final List<Product>? products;
  final int? total;
  // final int? skip;
  // final int? limit;

  ResponseModel({
    required this.products,
    required this.total,
    // required this.skip,
    // required this.limit,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      // products: List<Product>.from(json['products'] .map((x) => Product.fromJson(x))),
      products: (json['products'] as List)
          .map((item) => Product.fromJson(item))
          .toList(),
      total: json['total'],
      // skip: json['skip'] as int,
      // limit: json['limit'] as int,
    );
  }
}
