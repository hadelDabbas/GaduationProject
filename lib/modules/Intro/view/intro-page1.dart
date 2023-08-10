
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


class Intro1 extends GetResponsiveView< SplashScreenController> { 
 SplashScreenController controller=Get.put(SplashScreenController());
//PageController controllers= PageController();
  @override
  Widget build(BuildContext Context) {
  return Scaffold(
     body: Column(children: [
      SizedBox(height: 30,),
              Container( width: 600,height: 300,
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Image.asset('assets/images/intro4.png'),
         ),
       ),
       SizedBox(height: 20,),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Wrap(children: [
             Center(child: Text('  This application gives you additional experiences through',
       style: TextStyle(fontSize: 18,color: Colors.grey),)),
         Center(child: Text('a set of scientific and entertaining tests in addition',
       style: TextStyle(fontSize: 18,color: Colors.grey),)),
         Center(child: Text('  to scientific games that strengthen perception',
       style: TextStyle(fontSize: 18,color: Colors.grey),)),
         Center(child: Text(' perception and stimulate the brain',
       style: TextStyle(fontSize: 18,color: Colors.grey),)),
         
           ],),
          //  child: Container(
          //       child: Row(
          //  children: <Widget>[
          //     Flexible(
          //        child: 
          //        Center(
          //          child:
          //           new Text(style: TextStyle(fontSize: 18,color: Colors.grey, decoration: TextDecoration.none,)
          //          ,"   This application gives you additional experiences through a set of scientific and entertaining tests  ,   in addition to scientific games that strengthen perception and stimulate the brain"),
          //        ))
          //         ],
          //        )),
         ),
      SizedBox(height: 100,),
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
                Get.to(Intro2());
               },
             child: Text('Next'),)
           ],),
         ),
       )
     ],));}}