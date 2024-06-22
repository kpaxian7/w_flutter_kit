import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wflutter_kit/http/dio_config.dart';
import 'package:wflutter_kit/http/model/base/base_model.dart';
import 'package:wflutter_kit/http/request_helper.dart';
import 'dart:convert';

enum RequestMethod {
  get,
  post,
}

abstract class Requests with DioConfig {
  initialize() {
    initDioInstance(baseUrl: baseUrl());
  }

  getRequest<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    T Function(Object? json)? fromJsonFunc,
  }) async {
    return await _performRequest<T>(
      path,
      RequestMethod.get,
      params: params,
    );
  }

  postRequest<T>({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? params,
    T Function(Object? json)? fromJsonFunc,
  }) async {
    return await _performRequest<T>(
      path,
      RequestMethod.post,
      params: params,
    );
  }

  _performRequest<T>(
    String path,
    RequestMethod method, {
    Map<String, dynamic>? params,
    T Function(Object? json)? fromJsonFunc,
  }) async {
    Response<Map>? resp;
    if (method == RequestMethod.get) {
      resp = await dio?.get<Map>(
        RequestHelper.assembleGetPathWithParams(
          path,
          params,
        ),
      );
    } else if (method == RequestMethod.post) {
      resp = await dio?.post<Map>(
        path,
        data: params, // 将数据转换为 JSON 格式的字符串
      );
    }
    BaseModel? baseModel;
    if (resp != null) {
      if (fromJsonFunc != null) {
        baseModel = BaseModel<T>.fromJson(
          resp.data,
          fromJsonFunc: fromJsonFunc,
        );
      } else {
        baseModel = BaseModel<T>.fromJsonWithDirectType(
          resp.data,
        );
      }

      if (baseModel.suc != true) {
        if (baseModel.errorMsg?.isNotEmpty == true) {
          Fluttertoast.showToast(msg: baseModel.errorMsg!);
        }
        return;
      }
    }

    return baseModel?.data;
  }

  String baseUrl();
}
