
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/signin.dart/view/signin.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controller/intro-controller.dart';
import 'intro-page1.dart';
import 'intro-page2.dart';
import 'intro-page3.dart';


class IntroPageView extends GetResponsiveView< IntroController> { 
  IntroController controller=Get.put(IntroController());
//PageController controllers= PageController();
  @override
  Widget build(BuildContext Context) {
  return Scaffold(
     body: Column(children: [

       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Center(
           child: Text(' Welcome ',
                        style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,
                         color:Colors.blueGrey,fontFamily: "Pacifico")),
         ),
       ),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Center(child: Text('  Welcom To You In Information City You ',
         style: TextStyle(fontSize: 20,color: Colors.grey),)),
       ),
   Center(child: Text(' Will Enjou With Us',
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
             }, icon: Icon(Icons.arrow_back)),
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
             child: Text('Next'),)
           ],),
         ),
       )
     ],)
    //  Stack(children: [
    //   PageView( controller: controllers,
    //   onPageChanged: (index) {
    //     controller.onlastpage.value= (index == 1);
    //   },
    //     children: [
    //   Intro1(),
    //   Intro2(),
    //   Intro3(),
    //   Intro3()
    //  ],),
    // Container(
    //   alignment: Alignment(0,0.75),
    //   child:
    //    Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //      children: [
    //       GestureDetector(
    //         onTap: (){
    //           controllers.jumpToPage(1);
    //           controllers.previousPage(duration: Duration(microseconds: 500), curve: Curves.ease);
    //         },
    //         child:  Padding(
    //           padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
    //           child: Text("skip",style: TextStyle(color: Colors.black54,fontSize: 18),
    //           ),
    //         ),),
    //        SmoothPageIndicator(controller: controllers, count: 3),
    //        controller.onlastpage.value?
    //         GestureDetector(
    //         onTap: (){
    //      Get.to(SignInViewPage());
    //         },
    //         child:      Text('Done') ,
    //         ):  GestureDetector(
    //         onTap: (){
    //           controllers.nextPage(duration: Duration(microseconds: 500), curve: Curves.easeIn);
    //         },
    //         child:      Padding(
    //           padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
    //           child: Text('next',style: TextStyle(color: Colors.black54,fontSize: 18),),
    //         ) ,
    //         )
    //      ],
    //    ))
    //  ],)
     
 
  );
  }}
