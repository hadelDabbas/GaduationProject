import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MenuGameController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController ancontroller;
  final text='In this interface, you will display all the existing games, where each game has three levels, and each level has three stages';
  late Animation<double> animation;
  static MenuGameController get find => Get.find();
  var level=''.obs;
  var numberlevel=0.obs;

  RxBool animate = false.obs;
  @override
  void onInit() {
    super.onInit();
    ancontroller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = CurvedAnimation(parent: ancontroller, curve: Curves.linear);
    ancontroller.repeat();
  }
  void NumberLevel(){
    switch (level.value){
      case 'First Level':
      numberlevel.value=1;
      break;
        case 'Second Level':
      numberlevel.value=2;
      break;
     default:
     numberlevel.value=3;
    }
  }
}
