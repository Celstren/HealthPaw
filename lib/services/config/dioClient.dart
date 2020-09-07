import 'package:HealthPaw/services/config/LoggingInterceptor.dart';
import 'package:HealthPaw/services/core/core.dart';
import 'package:dio/dio.dart';

Dio get dioClient {
  Dio _dio;
  if (_dio == null) {
    BaseOptions options = new BaseOptions(
      connectTimeout: 30000,
      receiveTimeout: 30000,
      baseUrl: Core().server,
    );
    _dio = new Dio(options);
    _dio.interceptors.add(LoggingInterceptors());
  }
  return _dio;
}
