import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/refrence.dart';
import 'package:graduationproject/app/model/user.dart';

import 'adapter/refrence_adapter.dart';

class RefrenceRepository implements IRefrenceRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<List<Reference>> GetAllRefrence()async {
    var result =
        await _dio.get('https://localhost:7192/api/Refrence');
    var list = <Reference>[];
    for (var item in result.data) {
      list.add(Reference.fromJson(item));
    }
    return list;
  }
  
  @override
  Future<Reference?> GetRefrence(int id) async{
    var result = await _dio.get('https://localhost:7252/api/Refrence/$id');
    if (result.statusCode == 200) {
      var data = Reference.fromJson(result.data as Map<String, dynamic>);
      return data;
    } else {
      return null;
    }
  }

}