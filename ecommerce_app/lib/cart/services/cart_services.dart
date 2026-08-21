import 'package:dio/dio.dart';
import 'package:ecommerce_app/cart/models/cart_model.dart';
import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/network/dio_client.dart';
import 'package:ecommerce_app/features/services/auth_service.dart';

class CartService {
  final Dio _dio = DioClient().dio;
  final AuthService authService;
  CartService(this.authService);

  // GET — fetch user's cart
  Future<Cart> getCart() async {
    try {
      final response = await _dio.get('${ApiConstants.cart}/user/${authService.userId}');
      // response returns { carts: [...] } — take first cart
      final List<dynamic> carts = response.data['carts'];
      if (carts.isEmpty) throw Exception('No cart found');
      return Cart.fromJson(carts.first);
    } on DioException catch (e) {
      throw Exception('Failed to load cart: ${e.message}');
    }
  }

  // POST — add product to cart
  Future<Cart> addToCart(int productId, {int quantity = 1}) async {
    try {
      final response = await _dio.post(
        '${ApiConstants.cart}/add',
        data: {
          'userId': authService.userId, // hardcoded for now — replace with real userId
          'products': [
            {'id': productId, 'quantity': quantity},
          ],
        },
      );
      return Cart.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to add to cart: ${e.message}');
    }
  }

  // PUT — update entire cart
  Future<Cart> updateCart(int cartId, int productId, int quantity) async {
    try {
      final response = await _dio.put(
        '${ApiConstants.cart}/$cartId',
        data: {
          'products': [
            {'id': productId, 'quantity': quantity},
          ],
        },
      );
      return Cart.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to update cart: ${e.message}');
    }
  }

  // PATCH — update one field only
  Future<Cart> updateQuantity(int cartId, int productId, int quantity) async {
    try {
      final response = await _dio.patch(
        '${ApiConstants.cart}/$cartId',
        data: {
          'products': [
            {'id': productId, 'quantity': quantity},
          ],
        },
      );
      return Cart.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to update quantity: ${e.message}');
    }
  }

  // DELETE — remove cart
  Future<void> deleteCart(int cartId) async {
    try {
      await _dio.delete('${ApiConstants.cart}/$cartId');
    } on DioException catch (e) {
      throw Exception('Failed to delete cart: ${e.message}');
    }
  }
}
