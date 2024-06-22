class BaseModel<T> {
  bool? suc;

  T? data;

  String? errorCode;

  String? errorMsg;

  BaseModel({
    required this.suc,
    required this.data,
    required this.errorCode,
    required this.errorMsg,
  });

  factory BaseModel.fromJson(
    var json, {
    T Function(Object? json)? fromJsonFunc,
  }) {
    T? data;
    if (T is String || T is num || T is bool) {
      data = json["data"];
    }

    return BaseModel(
      suc: json["suc"],
      data: data ?? fromJsonFunc?.call(json["data"]),
      errorCode: json["errorCode"],
      errorMsg: json["errorMsg"],
    );
  }
}
