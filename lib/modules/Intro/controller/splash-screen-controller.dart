import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/modules/Intro/view/intro-page1.dart';

import '../view/intro.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();
 final onlastpage=false.obs;
  RxBool animate = false.obs;
  Future StartAnimation() async {
    await Future.delayed(const Duration(seconds: 2));
    animate.value = true;
    await Future.delayed(const Duration(seconds: 4));
    Get.to(IntroPageView ());
  }
}
