import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper {
  void saveData(String key, String value);
  void getData(String key);
}

class CacheHelperImpl implements CacheHelper {
  @override
  void getData(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? saved = preferences.getString(key);

    print('${saved!}have been cached');
  }

  @override
  void saveData(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }
}
