import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MenuGameController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController ancontroller;
  late Animation<double> animation;
  static MenuGameController get find => Get.find();

  RxBool animate = false.obs;
  @override
  void onInit() {
    super.onInit();
    ancontroller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = CurvedAnimation(parent: ancontroller, curve: Curves.linear);
    ancontroller.repeat();
  }
}
