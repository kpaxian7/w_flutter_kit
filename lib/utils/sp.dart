import 'package:shared_preferences/shared_preferences.dart';

class SPUtil {
  static SPUtil? _instance;
  static SharedPreferences? _prefs;

  /// 私有化构造函数
  SPUtil._internal();

  /// 获取单例实例
  static Future<SPUtil> getInstance() async {
    _instance ??= SPUtil._internal();
    _prefs ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  /// 存储字符串
  Future<bool> setString(String key, String value) async {
    return await _prefs!.setString(key, value);
  }

  /// 获取字符串
  String? getString(String key) {
    return _prefs!.getString(key);
  }

  /// 存储整型
  Future<bool> setInt(String key, int value) async {
    return await _prefs!.setInt(key, value);
  }

  /// 获取整型
  int? getInt(String key) {
    return _prefs!.getInt(key);
  }

  /// 存储布尔型
  Future<bool> setBool(String key, bool value) async {
    return await _prefs!.setBool(key, value);
  }

  /// 获取布尔型
  bool? getBool(String key) {
    return _prefs!.getBool(key);
  }

  /// 存储双精度型
  Future<bool> setDouble(String key, double value) async {
    return await _prefs!.setDouble(key, value);
  }

  /// 获取双精度型
  double? getDouble(String key) {
    return _prefs!.getDouble(key);
  }

  /// 存储字符串列表
  Future<bool> setStringList(String key, List<String> value) async {
    return await _prefs!.setStringList(key, value);
  }

  /// 获取字符串列表
  List<String>? getStringList(String key) {
    return _prefs!.getStringList(key);
  }

  /// 移除某个键值
  Future<bool> remove(String key) async {
    return await _prefs!.remove(key);
  }

  /// 清除所有数据
  Future<bool> clear() async {
    return await _prefs!.clear();
  }
}
