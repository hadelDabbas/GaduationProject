
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/signin.dart/view/signin.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controller/intro-controller.dart';
import '../controller/splash-screen-controller.dart';
import 'intro-page1.dart';
import 'intro-page2.dart';
import 'intro-page3.dart';


class Intro2 extends GetResponsiveView<SplashScreenController> { 
SplashScreenController controller=Get.put(SplashScreenController());
//PageController controllers= PageController();
  @override
  Widget build(BuildContext Context) {
  return Scaffold(
     body: Column(children: [
      SizedBox(height: 30,),
       Padding(
           padding: const EdgeInsets.all(8.0),
           child: Wrap(children: [
             Center(child: Text('You also ask your questions within a specialized community ',
       style: TextStyle(fontSize: 18,color: Colors.grey),)),
         Center(child: Text('  and it allows you to buy the book you want',
       style: TextStyle(fontSize: 18,color: Colors.grey),)),
      
         
           ],),),
       
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container(height: 400,width: 600,
          child: Image.asset('assets/images/library.gif')),
       ),
       SizedBox(height:20,),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Align(alignment: Alignment.bottomCenter,
           child: Row(children: [
             IconButton(onPressed: (){
              Get.back();
             }, icon: Icon(Icons.arrow_back)),
             SizedBox(width:  350,),
             ElevatedButton(
              style:
              ElevatedButton.styleFrom(
                       backgroundColor: Color.fromARGB(255, 246, 123, 127),
                        shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(120)),
                      
                        padding:
                            const EdgeInsets.symmetric(vertical: 15, horizontal: 15)),
              onPressed: () { 
                Get.to(SignInViewPage());
               },
             child: Text('Next'),)
           ],),
         ),
       )
     ],)  
 
  );
  }}
