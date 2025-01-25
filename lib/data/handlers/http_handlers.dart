import 'dart:async';
import 'package:dio/dio.dart';
import 'package:assignment/data/exceptions/http_exceptions.dart';

class HttpHandlers {
  final Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {
        'content-type': 'application/json',
      },
    ),
  );

  Future<dynamic> get(String url) async {
    try {
      final response = await dio.get(url);
      return response.data;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw FetchDataException('Slow internet connection');
      }
      throw FetchDataException('Failed to load data');
    }
  }
}
