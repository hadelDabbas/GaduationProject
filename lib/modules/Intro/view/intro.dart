
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/signin.dart/view/signin.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controller/splash-screen-controller.dart';
import 'intro-page1.dart';
import 'intro-page2.dart';
import 'intro-page3.dart';


class IntroPageView extends GetResponsiveView< SplashScreenController> { 
  SplashScreenController controller=Get.put(SplashScreenController());
//PageController controllers= PageController();
  @override
  Widget build(BuildContext Context) {
  return Scaffold(
     body: Column(children: [

       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Center(
           child: Text('welcom'.tr,
                        style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,
                         color:Colors.blueGrey,fontFamily: "Pacifico")),
         ),
       ),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Center(child: Text('WelcomToYouInInformationCity'.tr,
         style: TextStyle(fontSize: 20,color: Colors.grey),)),
       ),
   Center(child: Text("Wewillhavefuntogether".tr,
       style: TextStyle(fontSize: 20,color: Colors.grey),)),
       SizedBox(height: 20,),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(width: 600,height:300 ,
          child: Image.asset('assets/images/pepole.gif')),
       ),
      SizedBox(height: 40,),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Align(alignment: Alignment.bottomCenter,
           child: Row(children: [
             IconButton(onPressed: (){
              Get.back();
             }, icon: Icon(Icons.arrow_back,color: Color.fromARGB(255, 42, 42, 114),)),
             SizedBox(width: 350,),
             ElevatedButton(
              style:
              ElevatedButton.styleFrom(
                       backgroundColor: Color.fromARGB(255, 246, 123, 127),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(120)),
                      
                        padding:
                            const EdgeInsets.symmetric(vertical: 15, horizontal: 15)),
              onPressed: () { 
                Get.to(Intro1());
               },
             child: Text('Next'.tr),)
           ],),
         ),
       )
     ],)
     
 
  );
  }}
