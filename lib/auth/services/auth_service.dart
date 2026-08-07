import 'package:dio/dio.dart';
import 'package:navigation_flutter/auth/models/auth_model.dart';

class AuthService {
  final Dio _dio;
  String? accessToken;
  AuthService()
    : _dio = Dio(
        BaseOptions(
          baseUrl: 'https://dummyjson.com',
          connectTimeout: Duration(seconds: 5),
          receiveTimeout: Duration(seconds: 5),
        ),
      ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (accessToken != null) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }
          handler.next(options);
        },
        onResponse: (response, handler) {
          print('${response.statusCode}');
          handler.next(response);
        },
        onError: (error, handler) {
          print('${error.message}');
          handler.next(error);
        },
      ),
    );
  }

  Future<AuthData> login(String username, String password) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {'username': username, 'password': password},
      );

      final authData = AuthData.fromJson(response.data);
      accessToken = authData.accessToken;
      return authData;
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          throw Exception('connection timed out - check your internet');
        case DioExceptionType.receiveTimeout:
          throw Exception('took too long to response');
        case DioExceptionType.badResponse:
          final statusCode = e.response?.statusCode;
          if (statusCode == 404) throw Exception('user not found');
          if (statusCode == 401) throw Exception('unauthorized');
          if (statusCode == 500) throw Exception('server error');
          throw Exception('Bad response $statusCode');
        case DioExceptionType.connectionError:
          throw Exception('No internet connection');
        default:
          throw Exception('something went wrong : ${e.message}');
      }
    }
  }

  Future<AuthData> getProfile() async {
    final response = await _dio.get('/auth/me');
    return AuthData.fromJson(response.data);
  }
}
