import 'package:dio/dio.dart';
import 'package:wflutter_kit/http/interceptor/logging_interceptor.dart';

mixin DioConfig {
  Dio? dio;

  initDioInstance({String baseUrl = ""}) {
    dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ));
    dio!.interceptors.add(LoggingInterceptor());
    dio!.options.baseUrl = baseUrl;
  }
}
