import 'package:wflutter_kit/utils/empty.dart';

class RequestHelper {
  /// 拼接Get方法参数
  static String assembleGetPathWithParams(
      String path, Map<String, dynamic>? params) {
    String paramsAppend = "";
    if (!Empty.isEmpty(params)) {
      for (String keyItem in params!.keys) {
        String val = params[keyItem]?.toString() ?? "";
        String paramsItemString = "$keyItem=$val&";

        paramsAppend = paramsAppend + paramsItemString;
      }
    }
    if (Empty.isEmpty(paramsAppend)) {
      return path;
    } else {
      paramsAppend = paramsAppend.substring(0, paramsAppend.length - 1);
      return "$path?$paramsAppend";
    }
  }
}
