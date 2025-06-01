import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/component/loading_widget.dart';
import 'package:flutter_getx/controller/photo_controller.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class PhotoView extends GetView<PhotoController> {
  const PhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _photos(),
            Obx(() => LoadingWidget(controller.isLoading.value)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.snackbar('Add', 'Photo', icon: Icon(Icons.add_a_photo_outlined));
        },
        child: Icon(
          Icons.add_a_photo_outlined,
        ),
      ),
    );
  }

  Widget _photos() {
    return LiquidPullToRefresh(
      color: Colors.grey.withOpacity(0.2),
      backgroundColor: Colors.white,
      showChildOpacityTransition: false,
      springAnimationDurationInMilliseconds: 300,
      onRefresh: () async{
        controller.onRefresh();
      },
      child: Obx(
        () => GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.all(8.0),
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: controller.photos.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Card(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    controller.photos[index].downloadUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onTap: (){
                controller.showPhoto(index);
              },
            );
          },
        ),
      ),
    );
  }
}
