import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/group.dart';
import 'package:graduationproject/app/model/user.dart';

import '../../../app/model/content.dart';
import '../../../app/model/postdto.dart';
import 'adapter/group_adapter.dart';

class GroupRepository implements IGroupRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<bool> AddGroup(Group group) async {
    var result = await _dio.post('https://localhost:7192/api/Group/AddGroup',
        data: group.toJson());
    return result.statusCode == 200;
  }
  @override
  Future<List<Content>> GetContent() async {
    var result =
        await _dio.get('https://localhost:7252/api/Content/GetContents');
    print(result);
    var list = <Content>[];
    for (var item in result.data) {
      list.add(Content.fromJson(item));
    }
    return list;
  }
  @override
  Future<bool> DeleteGroup(int idgroup) async {
    var result = await _dio.delete('https://localhost:7192/api/Group/Delete',
        queryParameters: {'id': idgroup});
    return result.statusCode == 200;
  }

  @override
  Future<List<Group>> GetAllGroup() async {
    var result = await _dio.get('https://localhost:7192/api/Group/GetGroups');
    print(result);
    var list = <Group>[];
    for (var item in result.data) {
      list.add(Group.fromJson(item));
    }
    return list;
  }

  @override
  Future<bool> UpdateGroup(int idgroup, Group group) async {
    var result = await _dio.put(
     'https://localhost:7192/api/Group/Put/$idgroup',
      data: group.toJson(),
    );
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  
  @override
  Future<Group?> GetGroup(int idgroup) async{
      var result = await _dio.get('https://localhost:7192/api/Group/Get/$idgroup');
    if (result.statusCode == 200) {
      var data = Group.fromJson(result.data as Map<String, dynamic>);
      return data;
    } else {
      return null;
    }
  }

  @override
  Future<List<User>> GetMembers(int idgroup)async {
     var result = await _dio.get('https://localhost:7192/api/Group/GetGroupsMembers',
     queryParameters: {'id': idgroup}
     );
    print(result);
    var list = <User>[];
    for (var item in result.data) {
      list.add(User.fromJson(item));
    }
    return list;
  }
  
  @override
  Future<bool> AddMember(int idperson, int idGroup)async {
      var result = await _dio.post('',
      queryParameters: {'id': idperson});
    return result.statusCode == 200;
  }
   @override
  Future<List<PostDto>>  GetAllPost(int idgroup) async {
   
    var result =
        await _dio.get('https://localhost:7192/api/Group/GetGroupsPosts',
        queryParameters: {'id': idgroup}
        );

    var list = <PostDto>[];
    for (var item in result.data) {
      list.add(PostDto.fromJson(item));
    }
    return list;
  }
}
