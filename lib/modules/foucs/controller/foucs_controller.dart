import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class FoucsController extends GetxController with GetSingleTickerProviderStateMixin{
   late AnimationController animationController;
  var isAnimating=false.obs;
  var result=0.obs;
  var score=0.obs;
  Timer?_timer;
 int remanningsecond=1;
 final time='00.00'.obs;
   @override
   void onInit() {
    super.onInit();
    score.value=0;
     animationController = AnimationController(vsync: this,duration:
     Duration(milliseconds: 5000)
      );
    
   
}
  @override
  void onClose() {
     if(_timer!=null){
      _timer!.cancel();
     }
    super.onClose();

  }
  @override
  void onReady() {
     _startimer(50);
    super.onReady();

  }

   void _startimer(int seconds) {
   const duration=Duration(seconds: 1);
   remanningsecond=seconds;
   _timer=Timer.periodic(duration, ( Timer timer) { 
    if(remanningsecond==0){
      timer.cancel();}
      else{
     int minutes=(remanningsecond~/60);
    int seconds=(remanningsecond%60);
    time.value=minutes.toString().padLeft(2,'0')+':'+
    seconds.toString().padLeft(2,'0');
    remanningsecond--;
  
      }});
    } 
}