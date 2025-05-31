import 'package:flutter/cupertino.dart';
import 'package:flutter_getx/bind/post_detail_bind.dart';
import 'package:flutter_getx/view/home/home_view.dart';
import 'package:flutter_getx/view/main_view.dart';
import 'package:flutter_getx/view/photo/photo_view.dart';
import 'package:flutter_getx/view/post/post_detail_view.dart';
import 'package:flutter_getx/view/post/post_view.dart';
import 'package:get/get.dart';

class RouteInfo {
  static const String routeRoot = '/';
  static const String routePostDetail = '/post/detail';

  static List<GetPage> pages = [
    GetPage(name: routeRoot, page: () => MainView()),
    GetPage(
      name: routePostDetail,
      page: () => PostDetailView(),
      binding: PostDetailBind(),
    ),
  ];

  static List<Widget> naveBarPage = [
    HomeView(),
    PostView(),
    PhotoView(),
  ];
}
