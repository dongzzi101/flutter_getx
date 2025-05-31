import 'package:get/get.dart';

class TranslationsInfo extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'ko_KR': ko,
      };

  final Map<String, String> enUS = {
    'title': 'Flutter GetX',
    'posts.title': 'Post',
    'photo.title': 'Photo',
    'navBar.home': 'Home',
    'navBar.post': 'Post',
    'navBar.photo': 'Photo',
    'home.card.1': 'Build apps for any screen',
    'home.card.2':
        'Flutter transforms the development process. Build, test, and deploy beautiful mobile, web, desktop, and embedded experiences from a single codebase',
    'home.card.3':
        "Connect to Google's app development ecosystem, allowing you to streamline development and reach a wider audience through seamless integration with Firebase, Google Ads, Google Play, Google Pay, Google Wallet, Google Maps, and more"
  };

  final Map<String, String> ko = {
    'title': '플러터 GetX',
    'posts.title': '포스트',
    'photo.title': '사진',
    'navBar.home': '홈',
    'navBar.post': '포스트',
    'navBar.photo': '사진첩',
    'home.card.1': 'Build apps for any screen',
    'home.card.2':
    'Flutter transforms the development process. Build, test, and deploy beautiful mobile, web, desktop, and embedded experiences from a single codebase',
    'home.card.3':
    "Connect to Google's app development ecosystem, allowing you to streamline development and reach a wider audience through seamless integration with Firebase, Google Ads, Google Play, Google Pay, Google Wallet, Google Maps, and more"
  };
}
