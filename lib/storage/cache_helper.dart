import 'package:shared_preferences/shared_preferences.dart';

class LocalCache
{

  static Future<SharedPreferences> init() async {
    return await SharedPreferences.getInstance();
  }

  static bool getBool (SharedPreferences localCache, String key, {bool defaultValue = false}){
    return localCache.getBool(key) ?? defaultValue;
  }

  static void setBool (SharedPreferences localCache, String key, bool value) async
  {
    await localCache.setBool(key, value).then((value){
      print("setBool");
      print(value);
    });
  }
}