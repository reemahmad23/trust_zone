import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(String token)
      : dio = Dio(BaseOptions(
          baseUrl: 'https://trustzone.azurewebsites.net/api/',
          headers: {'Content-Type': 'application/json'},
        )) {
    dio.interceptors.add(AuthInterceptor(token));
  }

  Future<dynamic> get({required String endpoint}) async {
    try {
      final response = await dio.get(endpoint);
      return response.data;
    } catch (e) {
      throw Exception('GET Error: $e');
    }
  }

  Future<dynamic> put({
    required String endpoint,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await dio.put(endpoint, data: body);
      return response.data;
    } catch (e) {
      throw Exception('PUT Error: $e');
    }
  }
}

class AuthInterceptor extends Interceptor {
  final String token;

  AuthInterceptor(this.token);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }
}
