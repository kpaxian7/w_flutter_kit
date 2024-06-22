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
    return BaseModel(
      suc: json["suc"],
      data: fromJsonFunc?.call(json["data"]),
      errorCode: json["errorCode"],
      errorMsg: json["errorMsg"],
    );
  }

  factory BaseModel.fromJsonWithDirectType(
    var json,
  ) {
    return BaseModel(
      suc: json["suc"],
      data: json["data"],
      errorCode: json["errorCode"],
      errorMsg: json["errorMsg"],
    );
  }
}
