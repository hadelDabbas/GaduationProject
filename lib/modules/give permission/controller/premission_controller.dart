import 'package:get/get.dart';
import 'package:graduationproject/app/model/group.dart';
import 'package:graduationproject/app/model/user.dart';

import '../../../app/model/Accsessbuility.dart';
import '../../../app/model/library.dart';
import '../../../app/model/userAccsesbuility.dart';
import '../../sheard/auth_service.dart';
import '../data/premission_repositry.dart';

class PermissionController extends GetxController{
   List<String>permission=['Admain All permission'
  ,'Admain All','Admain Library','Admain post','Admain Group'];
  final isChecked = false.obs;
  final user=User().obs;
  final perRepo=PremissionRepository();
  final listpermissin=<Accessibility>[].obs;
   final auth = Get.find<AuthService>();
   final listLibrary = <Library>[].obs;
   final  AllGroups=<Group>[].obs;
   final  AllUser=<User>[].obs;
   final currentUser=User().obs;
   final userAccssebility=UserAccessibility().obs;
 @override
  void onInit() {
    super.onInit();
    GetUser();
    //   GetPostUser();
  }
   Future<void> GetUser() async {
    user.value = auth.getDataFromStorage()!;
  }
   Future <void> getAllPremission() async{
    var data = await perRepo.GetPermission();
   listpermissin .assignAll(data );

  }
    Future <void> getAllGroups() async{
    var data = await perRepo.GetAllGroup();
 AllGroups.assignAll(data );

  }
   Future<void> getAllLibrary() async {
    var data = await  perRepo.getAllLibrary();
    listLibrary.assignAll(data);
  }
     Future <void> getAllUser() async{
    var data = await perRepo.GetAllUser();
AllUser.assignAll(data );

  }


}