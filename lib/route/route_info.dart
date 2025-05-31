import 'package:flutter/cupertino.dart';
import 'package:flutter_getx/view/home/home_view.dart';
import 'package:flutter_getx/view/main_view.dart';
import 'package:flutter_getx/view/photo/photo_view.dart';
import 'package:flutter_getx/view/post/post_view.dart';
import 'package:get/get.dart';

class RouteInfo {
  static const String routeRoot = '/';

  static List<GetPage> pages = [
    GetPage(name: routeRoot, page: () => MainView())
  ];

  static List<Widget> naveBarPage = [
    HomeView(),
    PostView(),
    PhotoView(),
  ];
}
