import 'dart:convert';
import 'dart:io';

import 'package:flutter_getx/api/api_info.dart';
import 'package:flutter_getx/common/code_info.dart';
import 'package:flutter_getx/dto/photo_bean.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class PhotoDao extends GetConnect {
  static PhotoDao get to => Get.put(PhotoDao());

  @override
  void onInit() {
    super.onInit();

    httpClient.baseUrl = ApiInfo.rootPhotoUrl;
    httpClient.defaultContentType = 'application/x-www-form-urlencoded';
    httpClient.addRequestModifier((Request request) {
      request.headers['Accept'] = 'application/json';

      return request;
    });
  }

  Future<Map<String, dynamic>> getPhotos() async {
    Map<String, dynamic> resultMap = <String, dynamic>{};
    CodeInfo code = CodeInfo.ok;
    List<PhotoBean> list = [];

    try {
      final Response res = await get('/v2/list?page=2&limit=10');
      if (res.statusCode == HttpStatus.ok) {
        list = res.body
            .map<PhotoBean>((json) => PhotoBean.fromJson(json))
            .toList();
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
}
