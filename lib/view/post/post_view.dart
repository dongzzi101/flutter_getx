import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/component/loading_widget.dart';
import 'package:flutter_getx/controller/post_controller.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class PostView extends GetView<PostController> {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _post(),
            Obx(() => LoadingWidget(controller.isLoading.value))
          ],
        ),
      ),
    );
  }

  Widget _post() {
    return LiquidPullToRefresh(
      color: Colors.grey.withOpacity(0.2),
      backgroundColor: Colors.white,
      showChildOpacityTransition: false,
      springAnimationDurationInMilliseconds: 300,
      onRefresh: () async {
        controller.onRefresh();
      },
      child: ListView.separated(
        itemCount: controller.posts.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            child: ListTile(
              leading: const Icon(Icons.article_outlined),
              title: Text(
                controller.posts[index].title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            onTap: () {
              controller.toPostDetail(controller.posts[index].id);
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
