import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class FoucsController extends GetxController with GetSingleTickerProviderStateMixin{
   late AnimationController animationController;
  var isAnimating=false.obs;
  var result=0.obs;
   @override
   void onInit() {
    super.onInit();
     animationController = AnimationController(vsync: this,duration:
     Duration(milliseconds: 5000)
      );
    
   
}
 @override
   void onReady() {
    super. onReady();
     
     Future.delayed(Duration(seconds: 0),(){
    startAnimation();
    });
     
    }
  @override
   void OnClose() {
    super.onClose();
    animationController.dispose();
    }
    startAnimation(){
     if(animationController.isAnimating){
      isAnimating.value=false;
      animationController.stop();
     }else{
          isAnimating.value=true;
      animationController.forward();
      animationController.repeat();
     }
    }
}