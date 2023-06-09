import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? _preferences;
  // init
  Future<SharedPreferences?> init() async {
    _preferences = await SharedPreferences.getInstance();
    return _preferences;
  }

  //store data
  Future<void> storeData({required String key, required dynamic value}) async {
    //  log("CHeck datatype : ${value.runtimeType}");
    switch (value.runtimeType) {
      case String:
        await _preferences?.setString(key, value);
        break;
      case int:
        await _preferences?.setInt(key, value);
        break;
      case double:
        await _preferences?.setDouble(key, value);
        break;
      case bool:
        await _preferences?.setBool(key, value);
        break;
      default:
        await _preferences?.setStringList(key, value);
        break;
    }
  }

  // get data
  String getStringData({required String key}) =>
      _preferences?.getString(key) ?? "";
  int getIntData({required String key}) => _preferences?.getInt(key) ?? 0;
  double getDoubleData({required String key}) =>
      _preferences?.getDouble(key) ?? 0;
  bool getBoolData({required String key}) =>
      _preferences?.getBool(key) ?? false;

  // clear data
  Future<void> clearData() async {
    await _preferences?.clear();
  }

  // remove data
  Future<void> removeData({
    required String key,
  }) async {
    await _preferences?.remove(key);
  }
}
