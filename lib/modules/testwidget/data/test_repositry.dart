import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/refrence.dart';
import 'package:graduationproject/app/model/user.dart';

import '../../../app/model/test.dart';
import 'adapter/test_adapter.dart';


class TestRepository implements ITestRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<List<Test>> GetAllTypeTest()async {
    var result =
        await _dio.get('https://localhost:7192/api/Test');
    var list = <Test>[];
    for (var item in result.data) {
      list.add(Test.fromJson(item));
    }
    return list;
  }
  
  @override
  Future<Test?> GetTest(int id) async{
      var result = await _dio.get('https://localhost:7252/api/Test/$id',);
    if (result.statusCode == 200) {
      var data = Test.fromJson(result.data as Map<String, dynamic>);
      return data;
    } else {
      return null;
    }
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