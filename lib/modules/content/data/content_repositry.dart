
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/content.dart';

import 'adapter/content_adapter.dart';

class ContentRepository implements IContentRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<List<Content>> GetContent() async {
    var result = await _dio.get('https://localhost:7252/api/Content/GetContents');
    print(result);
    var list = <Content>[];
    for (var item in result.data) {
      list.add( Content.fromJson(item));
    }
    return list;
  }

  Future<bool> DelContent(int id) async {
    var result = await _dio.delete('https://localhost:7192/api/Content/Delete',
        queryParameters: {'id': id});
    return result.statusCode == 200;
  }

  Future<bool> AddContent(Content content) async {
    var result = await _dio.post('https://localhost:7192/api/Content/AddType',
        data: content.toJson());
    return result.statusCode == 200;
  }
  
  }