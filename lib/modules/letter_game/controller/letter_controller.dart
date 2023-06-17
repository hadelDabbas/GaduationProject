
import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class LetterController extends GetxController{
var resulting=4.obs;
var resulting3=3.obs;
var resulting1=5.obs;
var resulting2=4.obs;
var resulting5=5.obs;
var resulting33=4.obs;
var resulting9=9.obs;
var resulting55=4.obs;
var resulting8=8.obs;
var correct=0.obs;
var score=0.obs;
Timer?_timer;
 int remanningsecond=1;
 final time='00.00'.obs;
var letters=<String>[''].obs;
  @override
  void onInit() {

    super.onInit();
    score.value=0;
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
 
