import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
 class SplashScreencontroller extends GetxController{
    var AllWord= <String>[].obs;
  var count=0.obs;
  var count2=0.obs;
  var count3=0.obs;
  var count4=0.obs;
  var count5=0.obs;
  var count6=0.obs;
  var count7=0.obs;
  var count8=0.obs;  
  var count9=0.obs;
  var score=0.obs;
final text1='In this game a picture will appear and you must find out all the words that can apply to the picture';
   List <String> letters=['ح','ج','ث','ت','ب','ا','س','ز','ر','ذ','د','خ','ع','ظ','ط','ض','ص','ش','م','ل',
  'ك','ق','ف','غ','ة','ء','ي','ه','و','ن',]; 
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
     score.value=0;
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