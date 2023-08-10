import 'package:get/get.dart';
import 'package:graduationproject/app/model/user.dart';

import '../../../api/storage/storge_service.dart';

class SettingController extends GetxController{
   final userSingn=User().obs;
    static const  String KeyData="AuthData";
   final stroge = Get.find<StorageService>();
   final text='In this interface we can change the language of the program';
    @override
    void onInit(){
     
      super.onInit();
      // getUser();
    }
   Future <void>getUser()async{
   var s=stroge.getData(KeyData);
   print(s);
   }
}