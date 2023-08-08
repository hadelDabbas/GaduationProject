import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/content.dart';
import 'package:graduationproject/app/model/user.dart';

import '../../../app/model/Accsessbuility.dart';
import '../../../app/model/group.dart';
import '../../../app/model/library.dart';
import 'adapter/permisissin_adapter.dart';

class PremissionRepository implements IPremissionRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<List<Accessibility>> GetPermission() async {
    var result =
        await _dio.get('https://localhost:7252/api/Accessibility');
    print(result);
    var list = <Accessibility>[];
    for (var item in result.data) {
      list.add(Accessibility.fromJson(item));
    }
    return list;
  }
   @override
  Future<List<Library>> getAllLibrary() async {
    var result = await _dio.get('https://localhost:7252/api/Library');
    print(result);
    var list = <Library>[];
    for (var item in result.data) {
      list.add(Library.fromJson(item));
    }
    return list;
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
  Future<bool> AddContent(Content content) {
    // TODO: implement AddContent
    throw UnimplementedError();
  }
  
  @override
  Future<bool> DelContent(int id) {
    // TODO: implement DelContent
    throw UnimplementedError();
  }

  @override
  Future<List<User>> GetAllUser()async {
   var result = await _dio.get('https://localhost:7192/api/User/GetUser');
    print(result);
    var list = <User>[];
    for (var item in result.data) {
      list.add(User.fromJson(item));
    }
    return list;
}}