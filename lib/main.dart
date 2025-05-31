import 'package:flutter/material.dart';
import 'package:flutter_getx/bind/init_bind.dart';
import 'package:flutter_getx/common/theme.dart';
import 'package:flutter_getx/common/translations_info.dart';
import 'package:flutter_getx/route/route_info.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RouteInfo.routeRoot,
      initialBinding: InitBind(),
      getPages: RouteInfo.pages,
      defaultTransition: Transition.cupertino,
      translations: TranslationsInfo(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: MaterialTheme.lightScheme(),
        useMaterial3: true,
        fontFamily: 'NanumMyeongio',
      ),
      darkTheme: ThemeData(
        colorScheme: MaterialTheme.darkScheme(),
        useMaterial3: true,
        fontFamily: 'NanumMyeongio',
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
