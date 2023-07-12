// anyThing generic in your app must save it here

import 'package:advanced_arabic_mina_course/presentation%20layers/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String prefKeyLanguage = "prefKeyLanguage";

class AppPrefernces {
  final SharedPreferences _preferences;
  AppPrefernces(this._preferences);

  Future<String> getAppLang() async {
    String? language = _preferences.getString(prefKeyLanguage);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // this is mean the user don't select the language
      return LanguageType.english.getValue();
    }
  }
}
