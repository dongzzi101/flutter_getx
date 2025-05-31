import 'package:get/get.dart';

class TranslationsInfo extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': enUS,
    'ko_KR': ko,
  };


  final Map<String, String> enUS = {'title': 'Flutter GetX'};

  final Map<String, String> ko = {'title': '플러터 GetX'};
}
