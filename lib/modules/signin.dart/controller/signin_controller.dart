import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/menu/view/HomePage.dart';
import 'package:graduationproject/modules/signup/view/signup1.dart';

import '../../../api/storage/storge_service.dart';
import '../../genereted/sheard/auth_service.dart';
import '../data/signin_repository.dart';

 class SignIncontroller extends GetxController{
//    final repo = PasswordRepository();
var passtoggle = true.obs;
  RxBool hidePassword = true.obs;
  final userRepo= SiginRepository();
  // final authService = Get.find<AuthService>();
  // final stroge = Get.find<StorageService>();
  // final siginrepos=SiginRepository();
    var email=''.obs;
    var password=''.obs;
    Future SignIn()async{
     var data=userRepo.SignInUser(email.value, password.value);
     if (data!=null){
    //  logIn();
    print('Errortrrrrrr');
      Get.to(HomePage());
     }else{
      Get.to(signupage());
     print('Error');
     }
    }
//  Future<void> logIn() async {
  
//     if (!stroge.containsKey('type')) {
//       return;
//     }
//     if (authService.getTypeEnum() == Auth.comapny) {
//       Get.to(signupage());
//     } else {
//       Get.to(HomePage());
//     }
//  }

 }