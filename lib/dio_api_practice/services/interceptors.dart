import 'package:dio/dio.dart';
import '../models/user.dart';

class ApiService2 {
  final Dio _dio;

  ApiService2()
    : _dio = Dio(
        BaseOptions(
          baseUrl: 'https://jsonplaceholder.typicode.com',
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
        ),
      ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print('calling : ${options.path}');
          handler.next(options);
        },
        onResponse: (response, handler) {
          print("Got : ${response.statusCode}");
          handler.next(response);
        },
        onError: (error, handler) {
          print('Failed : ${error.message}');
          handler.next(error);
        },
      ),
    );
  }
  Future<List<User>> fetchUser() async {
    try {
      final response = await _dio.get('/users');
      final List<dynamic> data = response.data;
      return data.map((json) => User.fromJson(json)).toList();
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          throw Exception('connection timed out - check your internet');
        case DioExceptionType.receiveTimeout:
          throw Exception(' server took too long to respond');
        case DioExceptionType.badResponse:
          final statusCode = e.response?.statusCode;
          if (statusCode == 404) throw Exception('user not found');
          if (statusCode == 401) throw Exception('unauthorized');
          if (statusCode == 500) throw Exception('servor error');
          throw Exception('Bad Response $statusCode');
        case DioExceptionType.connectionError:
          throw Exception('No internet connection');
        default:
          throw Exception('something went wrong : ${e.message}');
      }
    }
  }
}
