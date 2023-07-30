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
        await _dio.get('https://localhost:7192/api/Complaint/GetCpmplaints');
    var list = <Complaint>[];
    for (var item in result.data) {
      list.add(Complaint.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<Complaint>> GetcomplaintUser(int iduser)async {
     var result =
        await _dio.get('https://localhost:7192/api/Complaint/GetUserComplaint');
    var list = <Complaint>[];
    for (var item in result.data) {
      list.add(Complaint.fromJson(item));
    }
    return list;
  }
  
  @override
  Future<bool> Putcomplaints(Complaint c) async{
     var result = await _dio.post('https://localhost:7192/api/Complaint/AddComplaint', 
     data: c.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  
  @override
  Future<bool> Updatecomplaint(Complaint c) async {
   var result = await _dio.put('https://localhost:7192/api/Complaint/Put', 
     data: c.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  
}