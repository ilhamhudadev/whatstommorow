import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:whatstommorow/core/variables/app_constant.dart';

Future<Locale> getLocale() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString(AppConstant.languageCode) ?? "id";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case "en":
      return const Locale('en');
    case 'id':
      return const Locale('id');
    default:
      return const Locale('id');
  }
}
