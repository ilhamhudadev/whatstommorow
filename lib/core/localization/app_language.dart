import 'package:whatstommorow/core/localization/language/en_language.dart';
import 'package:whatstommorow/core/localization/language/id_language.dart';
import 'package:get/get.dart';

class AppLanguage extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enLanguage,
        'id': idLanguage,
      };
}
