import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageChangeController with ChangeNotifier{
  // var  lan='en';
  Locale? _appLocale;
  Locale? get appLocale=>_appLocale;
  Future<void> changeLanguage(Locale type) async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    _appLocale=type;
    // lan=type as String;
    if(type==Locale("en")){
      await sp.setString("languageCode", "en");
    }else{
      await sp.setString("languageCode", "bn");

    }
    notifyListeners();
  }
}