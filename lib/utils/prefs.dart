import 'package:shared_preferences/shared_preferences.dart';

addCoordinates(String key, double value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value.toString());
}

Future<String> getCoordinates(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  key = prefs.getString(key);
  return key;
}
