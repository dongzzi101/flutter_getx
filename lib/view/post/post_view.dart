import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx/component/loading_widget.dart';
import 'package:flutter_getx/controller/post_controller.dart';
import 'package:get/get.dart';

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
    return ListView.separated(
      itemCount: controller.posts.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: const Icon(Icons.article_outlined),
          title: Text(
            controller.posts[index].title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
