
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/models/signin.dart/view/signin.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../controller/intro-controller.dart';
import 'intro-page1.dart';
import 'intro-page2.dart';
import 'intro-page3.dart';


class IntroPageView extends GetResponsiveView< IntroController> { 
PageController controllers= PageController();
bool onlastpage= false;
  @override
  Widget build(BuildContext Context) {
  return Scaffold(
     body: Stack(children: [
      PageView( controller: controllers,
      onPageChanged: (index) {
        onlastpage= (index == 1);
      },
        children: [
      Intro1(),
      Intro2(),
      Intro3(),
         SignInViewPage()
     ],),
    Container(
      alignment: Alignment(0,0.75),
      child:
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
          GestureDetector(
            onTap: (){
              controllers.jumpToPage(1);
              controllers.previousPage(duration: Duration(microseconds: 500), curve: Curves.ease);
            },
            child:  Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
              child: Text("skip",style: TextStyle(color: Colors.black54,fontSize: 18),
              ),
            ),),
           SmoothPageIndicator(controller: controllers, count: 4),
           onlastpage?
            GestureDetector(
            onTap: (){
         Get.to(SignInViewPage());
            },
            child:      Text('Done') ,
            ):  GestureDetector(
            onTap: (){
              controllers.nextPage(duration: Duration(microseconds: 500), curve: Curves.easeIn);
            },
            child:      Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
              child: Text('next',style: TextStyle(color: Colors.black54,fontSize: 18),),
            ) ,
            )
         ],
       ))
     ],)
     
  ) ;

  }}
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:graduationproject/models/Intro/controller/intro-controller.dart';
// import 'package:graduationproject/models/timer/controller/timer_controller.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// import '../../../routes/app_pages.dart';
// import 'intro-page1.dart';
// import 'intro-page2.dart';
// import 'intro-page3.dart';

// class IntroPageView extends GetResponsiveView<IntroController> { 
// PageController controllers= PageController();
// bool onlastpage= false;
//   @override
//   Widget build(BuildContext Context) {
//   return Scaffold(
//      body: Stack(children: [
//       PageView( controller: controllers,
//       onPageChanged: (index) {
//         onlastpage= (index == 2);
//       },
//         children: [
//       Intro1(),
//       Intro2(),
//       Intro3()
         
//      ],),
//     Container(
//       alignment: Alignment(0,0.75),
//       child:
//        Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: [
//           GestureDetector(
//             onTap: (){
//              Get.rootDelegate.toNamed('/sigin');
//              controllers.jumpToPage(1);
//              controllers.previousPage(duration: Duration(microseconds: 500), curve: Curves.ease);
//             },
//             child:  Padding(
//               padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
//               child: Text("skip",style: TextStyle(color: Colors.black54,fontSize: 18),
//               ),
//             ),),
            
//            SmoothPageIndicator(controller: controllers, count: 3),
//            onlastpage?
//             GestureDetector(
//             onTap: (){
//          //     go to main
//             },
//             child:      Text('Done') ,
//             ):  GestureDetector(
//             onTap: (){
//               controllers.nextPage(duration: Duration(microseconds: 500), curve: Curves.easeIn);
//             },
//             child:      Padding(
//               padding: const EdgeInsets.fromLTRB(8, 8, 20, 8),
//               child: Text('next',style: TextStyle(color: Colors.black54,fontSize: 18),),
//             ) ,
//             )
//          ],
//        ))
//      ],)
     
//   ) ;

//   }}