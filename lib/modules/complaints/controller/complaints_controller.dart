import 'package:get/get.dart';

import '../../../app/model/complaints.dart';
import '../../../app/model/user.dart';
import '../../sheard/auth_service.dart';
import '../data/complaints_repositiory.dart';

class ComplaintsController extends GetxController {
  final comRepo = ComplaintsRepository();
  final ListComplaintsAdmain = <Complaint>[].obs;
  final listUser = <Complaint>[].obs;
  final newComplaint = Complaint().obs;
  final auth = Get.find<AuthService>();
  final user = User().obs;
  final type = 0.obs;
  final numtype = 0.obs;
  final text = 'In this interface, all complaints are displayed to the admin';
  final textcuser1 =
      'In this interface, the user of this account writes the complaint and can see if the admin replied or rejected it';
  final txt = ''.obs;
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
    newComplaint.value.type = type.value;
    newComplaint.value.IdUser = user.value.Id;
    var res = await comRepo.Putcomplaints(newComplaint.value);
    if (res) {
      //for refresh
      Get.back();
    }
  }

  Future<void> UpdateComplaint(Complaint c) async {
    c.type = type.value;
    c.IdUser = user.value.Id;
    var res = await comRepo.Updatecomplaint(c);
    if (res) {
      //for refresh
      Get.back();
    }
  }
}
