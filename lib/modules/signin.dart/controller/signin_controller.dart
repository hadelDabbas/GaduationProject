import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/user.dart';
import 'package:graduationproject/modules/menu/view/HomePage.dart';
import 'package:graduationproject/modules/signup/view/signup1.dart';

import '../../../api/storage/storge_service.dart';
import '../../password/controller/password_controller.dart';
import '../../sheard/auth_service.dart';
import '../data/signin_repository.dart';
const  String KeyData="AuthData";
 class SignIncontroller extends GetxController{
//    final repo = PasswordRepository();
var passtoggle = true.obs;
  RxBool hidePassword = true.obs;
  final userRepo= SiginRepository();
  // final authService = Get.find<AuthService>();
 final stroge = Get.find<StorageService>();
  // final siginrepos=SiginRepository();
    var email=''.obs;
    var password=''.obs;
    Future <void> SignIn() async {
     var data=   await userRepo.SignInUser(email.value, password.value);
          if (data!=null){
     stroge.saveData(KeyData, jsonEncode(data.toJson()));
  
      Get.to(HomePage());
      // Get.to(passwordCon
      //troller(), arguments: [email.value]);
     }else{
      // Get.to(passwordController(), arguments: [email.value]);
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