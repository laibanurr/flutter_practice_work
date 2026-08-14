import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/network/dio_client.dart';
import 'package:ecommerce_app/products/model/product_model.dart';

class ProductService {
  final Dio _dio = DioClient().dio;

  Future<List<Product>> getProducts() async {
    try {
      final response = await _dio.get(ApiConstants.products);
      final List<dynamic> data = response.data['products'];
      return data.map((json) => Product.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception('Failed to load products: ${e.message}');
    }
  }

  Future<Product> getProductById(int id) async {
    try {
      final response = await _dio.get('${ApiConstants.products}/$id');
      return Product.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to load product: ${e.message}');
    }
  }

  Future<List<Product>> searchProducts(String query) async {
    try {
      final response = await _dio.get(
        ApiConstants.searchProducts,
        queryParameters: {'q': query},
      );
      final List<dynamic> data = response.data['products'];
      return data.map((json) => Product.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception('Search failed: ${e.message}');
    }
  }
}