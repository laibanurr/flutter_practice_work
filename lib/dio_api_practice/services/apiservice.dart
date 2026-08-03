import 'dart:core';

import 'package:dio/dio.dart';
import 'package:navigation_flutter/dio_api_practice/models/user.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
    

  );
  
  Future<List<User>> fetchUser() async{
    final response = await _dio.get('/users');
    final List<dynamic> data = response.data ;
    return data.map((json)=>User.fromJson(json)).toList();

  }
}
