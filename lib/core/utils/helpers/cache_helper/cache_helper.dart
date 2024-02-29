import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper {
  void saveData(String key, String value);
  Future<String?> getData(String key);
}

class CacheHelperImpl implements CacheHelper {
  @override
  Future<String?> getData(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? saved = preferences.getString(key);
    // print('${saved ?? 'No TOKEN'} have been cached');
    return Future.value(saved);
  }

  @override
  void saveData(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }
}
