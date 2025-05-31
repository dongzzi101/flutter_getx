import 'package:flutter_getx/view/main_view.dart';
import 'package:get/get.dart';

class RouteInfo {
  static const String routeRoot = '/';

  static List<GetPage> pages = [
    GetPage(name: routeRoot, page: () => MainView())
  ];
}
