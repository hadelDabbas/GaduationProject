import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../app/model/complaints.dart';
import '../../../app/model/user.dart';
import '../../sheard/auth_service.dart';
import '../data/complaints_repositiory.dart';

class ComplaintsController extends GetxController {
  final comRepo= ComplaintsRepository();
  final ListComplaintsAdmain=<Complaint>[].obs;
  final listUser=<Complaint>[].obs;
  final newComplaint=Complaint().obs;
   final auth = Get.find<AuthService>();
  final user= User().obs;
final numtype=0.obs;
final txt=''.obs;
     @override
  Future<void> onInit() async {
    super.onInit();
   // dont forget test stauteuser
  getComplaints();
  GetUser();
  }
   Future<void> GetUser() async {
    user.value = auth.getDataFromStorage()!;
  }
    Future<void> getComplaints() async {
    var data = await comRepo.GetAllComplaint();
    ListComplaintsAdmain.assignAll(data);
  }
    Future<void> getRefrence() async {
    var data = await comRepo.GetcomplaintUser(user.value.Id!);
        listUser.assignAll(data);

  }
   Future<void> addComplaint() async {
    var res = await comRepo.Putcomplaints(newComplaint.value );
    if (res) {
      //for refresh
      Get.back();
    }
  }
  Future<void> UpdateComplaint(Complaint c) async {
    var res = await comRepo.Updatecomplaint(c );
    if (res) {
      //for refresh
      Get.back();
    }
  }

}