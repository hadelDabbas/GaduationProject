import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/comment.dart';
import 'package:graduationproject/app/model/content.dart';
import 'package:graduationproject/app/model/postdto.dart';
import 'package:graduationproject/app/model/userPost.dart';

import '../../../Utile/utilExpation.dart';
import '../../sheard/auth_service.dart';
import 'adapter/home_adapter.dart';

class HomeRepository implements IHomeRepository {
  final _dio = Get.find<Dio>();
  final auth = Get.find<AuthService>();
  @override
  Future<List<Content>> GetAlltype() async {
    var result = await _dio.get('');
    print(result);
    var list = <Content>[];
    for (var item in result.data) {
      list.add(Content.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<PostDto>> GetAllPost() async {
    var id = auth.getDataFromStorage()!.Id;
    var result =
        await _dio.get('https://localhost:7252/api/Main/Posts?IdUser=$id');

    var list = <PostDto>[];
    for (var item in result.data) {
      list.add(PostDto.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<PostDto>> GetByContent(int idcontent) async {
    var result = await _dio.get('https://localhost:7252/api/Post/$idcontent');

    var list = <PostDto>[];
    for (var item in result.data) {
      list.add(PostDto.fromJson(item));
    }
    return list;
  }

  @override
  Future<bool> AddComment(Comments comments, int Iduser) async {
    var data = await _dio.post('https://localhost:7252/api/Post',
        data: comments.toJson());
    if (ExpastionStatus(data.statusCode!)) {
      return true;
    } else {
      print(data.statusMessage);
    }
    return false;
  }

  @override
  Future<List<Comments>> GetComment(int idpost) async {
    var data = await _dio.get('https://localhost:7252/api/Comment/$idpost');
    var list = <Comments>[];
    for (var item in data.data) {
      list.add(Comments.fromJson(item));
    }
    return list;
  }

  @override
  Future<bool> InteractionUser(UserPost userPost, int idpost) async {
    var data = await _dio.put('https://localhost:7252/api/UserPost/$idpost',
        data: userPost.toJson());
    if (ExpastionStatus(data.statusCode!)) {
      return true;
    } else {
      print(data.statusMessage);
    }
    return false;
  }
}
