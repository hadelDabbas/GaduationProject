import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/models/Intro/view/intro-page1.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;
  Future StartAnimation() async {
    await Future.delayed(const Duration(seconds: 2));
    animate.value = true;
    await Future.delayed(const Duration(seconds: 6));
    Get.to(Intro1());
  }
}
