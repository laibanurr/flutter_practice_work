import 'package:ecommerce_app/core/constants/api_constants.dart';
import 'package:ecommerce_app/core/network/dio_client.dart';
import 'package:ecommerce_app/core/storage/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/features/models/auth_model.dart';

class AuthService {
  final Dio _dio = DioClient().dio;
  String? accessToken;
  int? userId;

  Future<AuthData> login(String username, String password) async {
    try {
      final response = await _dio.post(
        ApiConstants.login,
        data: {'username': username, 'password': password},
      );
      final authData = AuthData.fromJson(response.data);
      accessToken = authData.accessToken;
      userId = authData.id;
      await SecureStorage.saveToken(authData.accessToken);
      return authData;
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<AuthData> getProfile() async {
    try {
      final response = await _dio.get(ApiConstants.profile);
      return AuthData.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

    Future<void> loadToken() async {
  accessToken = await SecureStorage.readToken();
  userId = await SecureStorage.readUserId(); // ← add this
}
  

  Future<void> logout() async {
  accessToken = null;
  userId = null;
  await SecureStorage.deleteToken();
}

  Exception _handleError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return Exception('Connection timed out');
      case DioExceptionType.receiveTimeout:
        return Exception('Server took too long');
      case DioExceptionType.badResponse:
        final code = e.response?.statusCode;
        if (code == 401) return Exception('Wrong username or password');
        if (code == 404) return Exception('User not found');
        return Exception('Server error: $code');
      case DioExceptionType.connectionError:
        return Exception('No internet connection');
      default:
        return Exception('Something went wrong');
    }
  }
}
