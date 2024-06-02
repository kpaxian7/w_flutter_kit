class Empty {
  // 检查 String 是否为空
  static bool isEmptyString(String? str) {
    return str == null || str.isEmpty;
  }

  // 检查 List 是否为空
  static bool isEmptyList(List? list) {
    return list == null || list.isEmpty;
  }

  // 检查 Map 是否为空
  static bool isEmptyMap(Map? map) {
    return map == null || map.isEmpty;
  }

  // 检查 Set 是否为空
  static bool isEmptySet(Set? set) {
    return set == null || set.isEmpty;
  }

  // 通用空值检查
  static bool isEmpty(dynamic value) {
    if (value == null) {
      return true;
    } else if (value is String) {
      return isEmptyString(value);
    } else if (value is List) {
      return isEmptyList(value);
    } else if (value is Map) {
      return isEmptyMap(value);
    } else if (value is Set) {
      return isEmptySet(value);
    }
    return false;
  }
}
