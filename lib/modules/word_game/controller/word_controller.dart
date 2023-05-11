import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
 class SplashScreencontroller extends GetxController{
  var AllWord= <String>[].obs;
  var count=0.obs;
  var count2=0.obs;
  var count3=0.obs;
  var res2=300.obs;
  var res1=200.obs;
  var res3=400.obs;
   List <String> letters=['A','B','C','D','E','F','G','H','I','G','K','L','M','N','O','P','Q','R','S','T',
  'U','V','W','X','Y','Z',]; 
   RxDouble width =50.0.obs;
     RxDouble hight =50.0.obs;

        RxDouble mwidth =0.0.obs;
         RxDouble mFontsize =0.0.obs;

          RxDouble footerwidth =100.0.obs;
            RxDouble footermargin =100.0.obs;
              RxDouble footerFontersize =0.0.obs;
              @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 2),(){
      width.value=150.0;
      hight.value=150.0;
    });
     
     Future.delayed(Duration(seconds: 1),(){
      mwidth.value=90;
      mFontsize.value=100.0;
    });

 Future.delayed(Duration(seconds: 1),(){
     footerwidth.value=100.0;
       footerFontersize.value=20;
       footermargin.value=0; 
    });







    

  }
 }