import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/user.dart';
import 'package:graduationproject/modules/menu/view/HomePage.dart';
import 'package:image_picker/image_picker.dart';

import '../../genereted/sheard/util.dart';
import '../data/signup_repository.dart';

class SignUpController extends GetxController{
  var passtoggle = true.obs;
  RxBool hidePassword = true.obs;
   final stringPickImage = ''.obs;
    final userRpo = UserRepository();
     //final userForm = GlobalKey<FormState>();
     final user=User().obs;
     var selectedTime=TimeOfDay.now().obs;
    @override
  void onInit() {
    super.onInit();}

  //    Future pickImageFun() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;
  //     stringPickImage.value = Utility.base64String(await image.readAsBytes());
  //   } catch (e) {
  //     print('Failed to pick image: $e');
  //   }
  // }
  Future<void> signUpUser() async {
    var data = await userRpo.regierterPerson(user.value);
    if (data) {
    //  await auth.logIn(user.value.email!, user.value.password!);
      Get.to(HomePage());
      print('trueeee');
    } else{
      print('false');
    }
  }
}