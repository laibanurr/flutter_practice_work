
import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/network/dio_client.dart';
import 'package:ecommerce_app/products/model/product_model.dart';

class ProductService {
  final _dio = DioClient().dio;
  Future<List<Product>> getProducts() async {
    final response = await _dio.get(ApiConstants.productsUrl);
    final List<dynamic> productData = response.data['products'];
    return productData
        .map((json) => Product.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<Product> getProductById(int id)async {
    final response =  await _dio.get('${ApiConstants.productsUrl}/$id');
    return Product.fromJson(response.data  as Map<String, dynamic>);
  }
}
