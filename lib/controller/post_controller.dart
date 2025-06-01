import 'package:flutter/material.dart';
import 'package:flutter_getx/common/code_info.dart';
import 'package:flutter_getx/dao/post_dao.dart';
import 'package:flutter_getx/dto/post_bean.dart';
import 'package:flutter_getx/route/route_info.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  RxBool isLoading = false.obs;

  RxList<PostBean> posts = <PostBean>[].obs;
  Rx<PostBean> postDetail = PostBean().obs;

  @override
  void onInit() {
    super.onInit();
    _getPosts();
  }

  void onRefresh(){
    _getPosts();
  }

  Future<void> _getPosts() async {
    isLoading(true);

    try {
      Map<String, dynamic> result = await PostDao.to.getPosts();
      CodeInfo code = result['code'];
      if (code == CodeInfo.ok) {
        List<PostBean> list = result['list'];
        posts.clear();
        posts.addAll(list);
      }
    } catch (e) {}

    isLoading(false);
  }

  Future<void> toPostDetail(int id) async {
    isLoading(true);

    try {
      Map<String, dynamic> result = await PostDao.to.getPost(id);
      CodeInfo code = result['code'];
      PostBean bean = result['bean'];

      if (code == CodeInfo.ok && bean.id >= 0) {
        postDetail(bean);
        Get.toNamed(RouteInfo.routePostDetail);
      } else {
        Get.snackbar('err.title.info'.tr, 'err.try'.tr,
            icon: Icon(Icons.error));
      }
    } catch (e) {
      Get.snackbar('err.title.error'.tr, 'err.try'.tr,
          icon: Icon(Icons.error));
    }

    isLoading(false);
  }
}
