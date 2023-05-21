import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
var passtoggle = true.obs;
  RxBool hidePassword = true.obs;
  final userRepo= SiginRepository();
 final stroge = Get.find<StorageService>();
    var email=''.obs;
    var password=''.obs;
    Future <void> SignIn() async {
     var data=   await userRepo.SignInUser(email.value, password.value);
          if (data!=null){
     stroge.saveData(KeyData, (data.toJson()).toString());
       Get.snackbar(
             'Welcom',
               "Hope To Enjoi with us",
             //  icon: Icon(Icons.person, color: Colors.white),
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Color.fromARGB(255, 209, 143, 143),
               borderRadius: 20,
               margin: EdgeInsets.all(15),
               colorText: Colors.white,
               duration: Duration(seconds: 4),
               isDismissible: true,
              //  dismissDirection: SnackDismissDirection.HORIZONTAL,
               forwardAnimationCurve: Curves.easeOutBack,

               );
      Get.to(HomePage());
     }else{
      
      Get.to(signupage());
     print('Error');
     }
    }

 }