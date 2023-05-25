
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/content.dart';

import 'adapter/content_adapter.dart';

class ContentRepository implements IContentRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<List<Content>> GetContent() async {
    var result = await _dio.get('');
    print(result);
    var list = <Content>[];
    for (var item in result.data) {
      list.add(Content.fromJson(item));
    }
    return list;
  }

  Future<bool> DelContent(int id) async {
    var result = await _dio.delete('https://localhost:7192/api/Content',
        queryParameters: {'id': id});
    return result.statusCode == 200;
  }

  Future<bool> AddContent(Content content) async {
    var result = await _dio.post('https://localhost:7192/api/Content',
        data: content.toJson());
    return result.statusCode == 200;
  }
  
  }