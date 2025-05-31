import 'package:flutter_getx/controller/post_controller.dart';
import 'package:get/get.dart';

class PostDetailBind implements Bindings{
  @override
  void dependencies() {
    Get.put(PostController());
  }

}
