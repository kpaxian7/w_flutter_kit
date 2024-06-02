import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("REQUEST[${options.method}] => PATH: ${options.path}");
    print("Headers: ${options.headers}");
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    if (options.queryParameters.isNotEmpty) {
      print("Query Parameters: ${options.queryParameters}");
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        "RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}");
    print("Data: ${response.data}");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        "ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");
    if (err.response != null) {
      print("Data: ${err.response?.data}");
    }
    print("Message: ${err.message}");
    super.onError(err, handler);
  }
}
