// Package imports:
import 'package:dio/dio.dart';

class HttpClient {
  final Dio dio =
      Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));
}
