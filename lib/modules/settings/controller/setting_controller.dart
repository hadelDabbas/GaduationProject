import 'package:get/get.dart';
import 'package:graduationproject/app/model/user.dart';

import '../../../api/storage/storge_service.dart';

class SettingController extends GetxController{
   final userSingn=User().obs;
    static const  String KeyData="AuthData";
   final stroge = Get.find<StorageService>();
   final text='settingHelp'.tr;
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