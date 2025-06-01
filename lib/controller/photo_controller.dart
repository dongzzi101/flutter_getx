import 'package:flutter/material.dart';
import 'package:flutter_getx/common/code_info.dart';
import 'package:flutter_getx/dao/photo_dao.dart';
import 'package:flutter_getx/dto/photo_bean.dart';
import 'package:get/get.dart';

class PhotoController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<PhotoBean> photos = <PhotoBean>[].obs;

  @override
  void onInit() {
    super.onInit();
    _getPhotos();
  }

  Future<void> _getPhotos() async {
    isLoading(true);

    try {
      Map<String, dynamic> result = await PhotoDao.to.getPhotos();
      CodeInfo code = result['code'];
      if (code == CodeInfo.ok) {
        List<PhotoBean> list = result['list'];
        photos.clear();
        photos.addAll(list);
      }
    } catch (e) {}

    isLoading(false);
  }

  void showPhoto(int index) {
    Get.dialog(
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(photos[index].downloadUrl),
            const SizedBox(height: 16.0),
            const Icon(Icons.person),
            Text(photos[index].author),
          ],
        ),
        actions: [
          TextButton(
            child: Text('btn.close'.tr),
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
    );
  }
}
