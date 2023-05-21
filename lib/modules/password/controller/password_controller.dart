import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/menu/view/HomePage.dart';

import '../data/password_repostiry.dart';

class passwordController extends GetxController{
  var passtoggle = true.obs;
  RxBool hidePassword = true.obs;
  var newPassword=''.obs;
  var confirmpassword=''.obs;
  final pass=PasswordRepository();
  var email=''.obs;
   Future Confirmpass()async{
     var data=pass.resetPassuser(email.value, newPassword.value);
     if(data==true){
      print(true);
      Get.to(HomePage());
     }else{
      Get.snackbar(
              'Error',
               "Sure From Email Or Passwoprd",
               icon: Icon(Icons.person, color: Colors.white),
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Colors.green,
               borderRadius: 20,
               margin: EdgeInsets.all(15),
               colorText: Colors.white,
               duration: Duration(seconds: 4),
               isDismissible: true,
              //  dismissDirection: SnackDismissDirection.HORIZONTAL,
               forwardAnimationCurve: Curves.easeOutBack,

               );
     }
   }
}