import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/component/drawer_widget.dart';
import 'package:flutter_getx/controller/main_controller.dart';
import 'package:get/get.dart';

import '../route/route_info.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.title.value)),
      ),
      body: SafeArea(
        child: PageTransitionSwitcher(
          transitionBuilder: (Widget child, Animation<double> anim,
              Animation<double> secondAnim) {
            return FadeThroughTransition(
              animation: anim,
              secondaryAnimation: secondAnim,
              child: child,
            );
          },
          child: Obx(
            () => RouteInfo.naveBarPage[controller.navBarIdx.value],
          ),
        ),
      ),
      drawer: DrawerWidget(),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.navBarIdx.value,
          onDestinationSelected: controller.onChangeNavBar,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'navBar.home'.tr,
            ),
            NavigationDestination(
              icon: Icon(Icons.list_alt),
              label: 'navBar.post'.tr,
            ),
            NavigationDestination(
              icon: Icon(Icons.photo),
              label: 'navBar.photo'.tr,
            ),
          ],
        ),
      ),
    );
  }
}
