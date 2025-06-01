import 'package:get/get.dart';

class TranslationsInfo extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'ko_KR': ko,
      };

  final Map<String, String> enUS = {
    'error.title.info': 'Info',
    'error.title.error': 'Error',
    'error.try': 'Please try again',
    'btn.close': 'Close',
    'title': 'Flutter GetX',
    'posts.title': 'Post',
    'photo.title': 'Photo',
    'post.detail.title': 'post detail',
    'drawer.header': 'Flutter',
    'drawer.profile': 'profile',
    'drawer.message': 'Message',
    'drawer.setting': 'Setting',
    'drawer.login' : 'login',
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
    'error.title.info': '안내',
    'error.title.error': '에러',
    'error.try': '다시 시도해보세요',
    'btn.close': '닫기',
    'title': '플러터 GetX',
    'drawer.header': '플러터',
    'drawer.profile': '프로필',
    'drawer.message': '메시지',
    'drawer.setting': '세팅',
    'drawer.login' : '로그인',
    'posts.title': '포스트',
    'photo.title': '사진',
    'post.detail.title': '게시글 상세보기',
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
