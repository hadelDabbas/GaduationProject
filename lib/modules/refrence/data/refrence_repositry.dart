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
        await _dio.get('https://localhost:7192/api/Reference/GetReferenceContent');
    var list = <Reference>[];
    for (var item in result.data) {
      list.add(Reference.fromJson(item));
    }
    return list;
  }
  
  @override
  Future<List< Reference>> GetRefrencelink(int id) async{
    var result = await _dio.get('https://localhost:7252/api/Reference/GetReferenceLink/',
      queryParameters: {'id':id}
    );
    var list = <Reference>[];
    for (var item in result.data) {
      list.add(Reference.fromJson(item));
    }
    return list;
  }
  
  @override
  Future<bool> DelRefrence(Reference reference) async{
    var result = await _dio.delete(
     'https://localhost:7192/api/Reference',
    data: reference.toJson());
    return result.statusCode == 200;
  }
  
  @override
  Future<bool> AddRefrence(Reference reference)async {
   var result = await _dio.post('https://localhost:7252/api/Reference/AddReference',
        data:  reference.toJson());
    return result.statusCode == 200;
  }


}