import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:navigation_flutter/auth/models/auth_model.dart';

class AuthService {
  final Dio _dio;
  String? accessToken;
  final _storage = const FlutterSecureStorage();
  static final _cacheStore = MemCacheStore();
  static final _cacheOptions = CacheOptions(
    store: _cacheStore,
    policy: CachePolicy.request,
    maxStale: Duration(seconds: 5),
  );
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
    _dio.interceptors.add(DioCacheInterceptor(options: _cacheOptions));
  }

  Future<AuthData> login(String username, String password) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {'username': username, 'password': password},
      );

      final authData = AuthData.fromJson(response.data);
      accessToken = authData.accessToken;
      await _storage.write(key: 'access_token', value: authData.accessToken);
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

  Future<void> loadToken() async {
    accessToken = await _storage.read(key: 'access_token');
    print('Loaded token: $accessToken'); // what does this print?
  }

  Future<void> logout() async {
    accessToken = null;
    await _storage.delete(key: 'access_token');
  }
}
