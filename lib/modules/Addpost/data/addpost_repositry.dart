import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/content.dart';
import 'package:graduationproject/app/model/post.dart';

import 'adapter/addpost_adapter.dart';

class AddpostRepository implements IAddpostRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<bool> AddpostUser(Post post, int iduser) async {
    var result = await _dio.post('https://localhost:7252/api/Post/AddPost',
        data: post.toJson());
    print(result.data);
    if (result.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Future<List<Content>> GetAllContent() async {
    var result =
        await _dio.get('https://localhost:7252/api/Content/GetContents');
    print(result);
    var list = <Content>[];
    for (var item in result.data) {
      list.add(Content.fromJson(item));
    }
    return list;
  }
}
