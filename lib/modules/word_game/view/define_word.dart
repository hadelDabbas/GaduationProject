import 'dart:async';
import 'dart:html';
import 'dart:js';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/word_controller.dart';
import 'form_word1.dart';

 
class Splashscrren extends GetView<SplashScreencontroller> {
  SplashScreencontroller controller=Get.put(SplashScreencontroller());
 @override
  Widget build(BuildContext context) {
   return Scaffold(
 backgroundColor:Color.fromARGB(255, 235, 228, 200),
 body: Column(
  children: [
      InkWell(
                      onTap: () => Get.back(),
                      child: Align(alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_back_ios,
                                       size: 20, 
                                     color: Colors.grey
                                      ),
                        ),
                      ),
                    ),
    SizedBox(height: 30,),
    Align(alignment: Alignment.topLeft,child: myname(),
    ),
    SizedBox(height: Get.height*0.25,),
   Center(child: animationcentre(),),
    SizedBox(height: 20,),
    footertext(),
     Padding(
                padding:const EdgeInsets.fromLTRB(8, 15, 8, 8),
                child: ElevatedButton(  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink[200]),),
                  onPressed: (){
                  Get.to(FormwordPageView());
                // Get.to(Formword3PageView());
                  }, child: Text('Start',
                style:
                  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white))),
              )
  ],
 ),
   );}
   Widget myname(){
    return Transform(
      transform: Matrix4.rotationZ(50),
      child: Text('Welcomme',style: TextStyle(
        color: Colors.white,fontSize: 20 ),),
    );
   }
   
    Widget  animationcentre() {
      return Center(
      child: Obx(() => AnimatedContainer(
     width: controller.width.value.toDouble(),
     height: controller.hight.value.toDouble(),
     decoration: BoxDecoration(
      color: Color.fromARGB(255, 236, 163, 218),
      borderRadius: BorderRadius.circular(100),
      boxShadow: [BoxShadow(
     color: Colors.grey.shade600,
    spreadRadius: 1,
    blurRadius: 15
      )],
     ), duration: Duration(seconds: 1),
     curve: Curves.fastOutSlowIn,
     child: mword(),
      )),

      );
    }
    Widget footertext(){
        return Center(
      child: Obx(() => AnimatedContainer(
        margin: EdgeInsets.only(left: controller.footermargin.value),
     width: controller.footerwidth.value.toDouble(),
     duration: Duration(seconds: 2),
     curve: Curves.easeInOut,
     child: Obx(() => controller.mwidth.value==90 && controller.footermargin<90?
     Text('Form Word',style: TextStyle(color: Color.fromARGB(255, 241, 128, 217),
     fontSize: controller.footerFontersize.value),

     ):Text('')
     ),
      )));
    }
    Widget mword(){
       return Center(
      child: Obx(() => AnimatedContainer(
     width: controller.mwidth.value.toDouble(),
    duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      child: Obx(() => controller.mwidth >10?
      Text('W',style: TextStyle(fontSize: controller.mFontsize.value,
      color:Color.fromARGB(255, 235, 228, 200), ),):
      Text('')
      ,
       ))));
    }
}


