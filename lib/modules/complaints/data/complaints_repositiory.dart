import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/complaints.dart';
import 'package:graduationproject/app/model/refrence.dart';
import 'package:graduationproject/app/model/user.dart';

import 'adapter/complaints_adapter.dart';

class ComplaintsRepository implements IComplaintsRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<List<Complaint>> GetAllComplaint() async{
    var result =
        await _dio.get('https://localhost:7192/api/Complaint');
    var list = <Complaint>[];
    for (var item in result.data) {
      list.add(Complaint.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<Complaint>> Getcomplaint(int id)async {
     var result =
        await _dio.get('https://localhost:7192/api/Complaint/$id');
    var list = <Complaint>[];
    for (var item in result.data) {
      list.add(Complaint.fromJson(item));
    }
    return list;
  }
  
  @override
  Future<bool> Putcomplaints(int id,Complaint c) async{
     var result = await _dio.post('https://localhost:7192/api/Complaint/$id', 
     data: c.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  
}