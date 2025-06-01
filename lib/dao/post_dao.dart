import 'dart:io';

import 'package:flutter_getx/api/api_info.dart';
import 'package:flutter_getx/common/code_info.dart';
import 'package:flutter_getx/dto/post_bean.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class PostDao extends GetConnect {
  static PostDao get to => Get.put(PostDao());

  @override
  void onInit() {
    super.onInit();

    httpClient.baseUrl = ApiInfo.rootPostUrl;
    httpClient.defaultContentType = 'application/x-www-form-urlencoded';
    httpClient.addRequestModifier((Request request) {
      request.headers['Accept'] = 'application/json';
      return request;
    });
  }

  Future<Map<String, dynamic>> getPosts() async {
    Map<String, dynamic> resultMap = <String, dynamic>{};
    CodeInfo code = CodeInfo.ok;

    List<PostBean> list = [];

    try {
      final Response res = await get('/posts');

      if (res.statusCode == HttpStatus.ok) {
        list =
            res.body.map<PostBean>((json) => PostBean.fromJson(json)).toList();
      } else {
        code = CodeInfo.err;
      }
    } catch (e) {
      code = CodeInfo.err;
    }

    resultMap['code'] = code;
    resultMap['list'] = list;

    return resultMap;
  }

  Future<Map<String, dynamic>> getPost(int id) async {
    Map<String, dynamic> resultMap = <String, dynamic>{};
    CodeInfo code = CodeInfo.ok;
    PostBean bean = PostBean();

    try {
      final Response res = await get("/posts/$id");
      if (res.statusCode == HttpStatus.ok) {
        bean = PostBean.fromJson(res.body);
      } else {
        code = CodeInfo.err;
      }
    } catch (e) {
      code = CodeInfo.err;
    }

    resultMap['code'] = code;
    resultMap['bean'] = bean;

    return resultMap;
  }
}
