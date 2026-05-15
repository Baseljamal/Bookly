import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  ApiService(this._dio);

  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  final String _apiKey = dotenv.env['api_key'] ?? '';
  final Dio _dio;

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint&key=$_apiKey');
    return response.data;
  }
}
