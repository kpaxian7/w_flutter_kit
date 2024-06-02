import 'package:dio/dio.dart';
import 'package:wflutter_kit/http/request_config.dart';
import 'package:wflutter_kit/http/request_helper.dart';

enum RequestMethod {
  get,
  post,
}

class Requests with RequestDioConfig {
  static Requests? _instance;

  Requests._() {
    initDioRequest(baseUrl: "https://dart.dev");
  }

  factory Requests.instance() {
    _instance ??= Requests._();
    return _instance!;
  }

  getRequest() {}

  postRequest() {}

  _performRequest(
    String path,
    RequestMethod method, {
    Map<String, dynamic>? params,
  }) async{
    Response<Map>? resp;
    if (method == RequestMethod.get) {
      resp = await dio?.get<Map>(
        RequestHelper.assembleGetPathWithParams(
          path,
          params,
        ),
      );
    } else {
      resp = await dio?.post(
        path,
        data: params,
      );
    }


  }
}
