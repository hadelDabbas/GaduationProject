import 'dart:html';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin{
 var page=2.obs;
var click=false.obs;
 late Animation<Offset> offsetAnimation;
 late AnimationController ancontroller;
 late Animation<double> animation;
 @override
  void onInit() {
    super.onInit();
       ancontroller =
        AnimationController(duration: const Duration(seconds: 6), vsync: this);
    animation = new CurvedAnimation(parent: ancontroller, curve: Curves.slowMiddle);
    ancontroller.repeat();
    offsetAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: const Offset(2, 0),
    ).animate(CurvedAnimation(
      parent:ancontroller,
      curve: Curves.slowMiddle,
    ));
    }
}

