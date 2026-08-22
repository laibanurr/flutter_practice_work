import 'package:dio/dio.dart';
import 'package:navigation_flutter/Riverpod/Riverpod_demo/Quote/core/dio_client.dart';
import 'package:navigation_flutter/Riverpod/Riverpod_demo/Quote/core/model/quote.dart';

class QuoteService {
  final Dio _dio = DioClient().dio;

    Future<Quote> getQuoteById(int id) async {
    try {
      final response = await _dio.get('/quotes/$id');
      return Quote.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to load quote: ${e.message}');
    }
  }

  Future<Quote> getRandomeQuote() async {
    try {
      final response = await _dio.get('/quotes/random');
      return Quote.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('failed to load quote ${e.message}');
    }
  }
}
