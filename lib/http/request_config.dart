import 'package:dio/dio.dart';
import 'package:wflutter_kit/http/interceptor/logging_interceptor.dart';

mixin RequestDioConfig {
  String? baseUrl;

  Dio? dio;

  initDioRequest({
    required String baseUrl,
  }) {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ));
    dio!.interceptors.add(LoggingInterceptor());
  }
}
