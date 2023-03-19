import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/models/timer/controller/timer_controller.dart';


class TimerPageView extends GetResponsiveView<TimerController> {
  TimerController controller=Get.put(TimerController());
 @override
  Widget builder() {
   return Scaffold(
    body: Row(
       children: [
                        SizedBox(width: 180,),
                           SizedBox(width: 8,),
                             Container( 
                               height: 35, width: 120,
                              decoration:BoxDecoration(borderRadius: BorderRadius.circular(15),
                               color:Color.fromARGB(255, 195, 95, 212),
                                         ) ,
                             child: Row(children: [
                    Obx(() => Center(
                   child: Text('  ${controller.time.value}',
                   style: TextStyle(
                   color: Colors.white,  ),),  )),
                     Text(' : Timer', style: TextStyle(
                               color: Colors.white))
                  ],),
                         ),
                           ]
    ),
   );}}