import 'package:flutter_getx/controller/main_controller.dart';
import 'package:get/get.dart';

class InitBind implements Bindings{

  @override
  void dependencies() {
    Get.put(MainController());
  }

}