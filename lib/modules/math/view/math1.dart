import 'dart:async';
import 'dart:html';
import 'dart:js';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/math/controller/math_controller.dart';
import 'package:graduationproject/modules/math/view/math2.dart';
import 'package:graduationproject/modules/menu/view/HomePage.dart';

import '../../timer/controller/timer_controller.dart';

class Math1PageView extends GetResponsiveView<MathController> {
 MathController controller=Get.put(MathController());
  TimerController timerController=Get.put(TimerController());
 List <String> values=['15','13','11'];
 @override
  Widget builder() {
   return Scaffold(
       backgroundColor: Color.fromARGB(255, 103, 25, 117),
       body: Column(
         children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row( 
                    children: [
                        SizedBox(width: 180,),
                             InkWell(
                        onTap: () {HomePage();},
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
                         Container( 
                               height: 35, width: 120,
                              decoration:BoxDecoration(borderRadius: BorderRadius.circular(15),
                               color:Color.fromARGB(255, 195, 95, 212),
                                         ) ,
                             child: Row(children: [
                    Obx(() => Center(
                   child: Text('  ${timerController.time.value}',
                   style: TextStyle(
                   color: Colors.white,  ),),  )),
                     Text(' : Timer', style: TextStyle(
                               color: Colors.white))
                  ],),
                         ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Text('Calculate The Correct Result ',
                style: TextStyle(color: Colors.white ,fontSize: 30),),
                  SizedBox(height: 25,),
                 randnumber(controller.answer.value),
                    SizedBox(height: 12,),
                  res(controller.answer.value.toString()),
                  SizedBox(height: 8,),
                  res('87'),
                    SizedBox(height: 8,),
                  res('24'),
                       SizedBox(height: 10,),
         ],
       )
       
   );
  }
   Widget shaping(String value,String name){
    return Container( 
      height: 35, width: 120,
    decoration:BoxDecoration(borderRadius: BorderRadius.circular(15),
    color:Color.fromARGB(255, 195, 95, 212),
    ) ,
    child: Row(children: [
      Text('   ' +value.toString()+' :', style: TextStyle(
            color: Colors.white)),
      Text(  name, style: TextStyle(
            color: Colors.white))
    ],),

    );
   }
    Widget randnumber(int answer){
 var rng = Random();
  int v1=rng.nextInt(5);
    int v2=rng.nextInt(5);
      int v3=rng.nextInt(5);
        int v4=rng.nextInt(5);
         int v5=rng.nextInt(5);
   controller.answer.value= v1 +v2 *v3 -v4 ; 
   print(answer);
  return Container(
    child: Text('$v1 +$v2 * $v3 - $v4   =',
    style: TextStyle(
                    color: Color.fromARGB(255, 206, 45, 184),
                    fontSize: 50,
                    
                  ),
    ),
  );

 }
   Widget res (String value){
    return 
  ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    fixedSize:
                        MaterialStateProperty.all( Size(300,100))
                        ),
                onPressed: () {
                 if(value==controller.answer.value.toString()){
                controller.result.value +=100;
                controller.onClose();
                print(controller.time.value.toString());
                snak();
                }
                  else 
                  {
                   controller.result.value=0;
                   snak();
                    controller.onClose();
                  }
                 }
                 ,
                child: Text(
                  value,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 244, 143, 177)),
                    
                  ),
                
        );
   }
     Widget  Result(String result, String url ) {
   return  Center(
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Container(
                              width: 250,
                                 height: 100,
                              color: Colors.green[50],
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(result,
                                    style: TextStyle(fontSize: 25,
                                    color: Colors.pink[300]
                                    ),
                                    ),
                                  ),
                                   Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Container( width: 60,height: 60,
                                      child: Image.asset(url)),
                                   )
                                ],
                              ),
                                                 ),
                           ),
                         );

   }  
   Future snak(){
    return Get.defaultDialog(
        title: "Result",
              middleText: "Hello world!",
              backgroundColor: Colors.white,
              titleStyle: TextStyle(color: Colors.purple),
              middleTextStyle: TextStyle(color: Colors.black),
              barrierDismissible: false,
              radius: 50,
              content: Column(
                children: [
                 Text(controller.result.value.toString(),style:
                  TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                 controller.result.value.toString()==100.toString()
                 &&controller.time.value.toString()!='00:01' ?
                 Column(
                  children: [
                    Result('Very Good', 'assets/images/ani1.png'),
                    Text('Do You Want To Go TO Level 2 ?'),
                    Row( children: [
                      SizedBox(width: 40,),
                        TextButton(onPressed: (){
                          Get.to(Math2PageView());
                         }, child: Text('Sure',
                        style: TextStyle(color: Color.fromARGB(255, 212, 80, 124)),)),
                        TextButton(onPressed: (){
                          Get.back();
                        }, child: Text('Sorry',
                         style: TextStyle(color: Color.fromARGB(255, 212, 80, 124)),)),
                    ],)
                  
                  ],
                 ):Column(
                  children: [
                     Result('Game Over', 'assets/images/ani5.png'),
                       Text('  Try Again Please '),
                       Row(children: [
                         SizedBox(width: 40,),
                           TextButton(onPressed: (){
                          Get.back();
                          controller.onReady();
                           }, child: Text('yes',
                         style: TextStyle(color:Color.fromARGB(255, 212, 80, 124))
                        )), TextButton(onPressed: (){
                          Get.back();
                          controller.onClose();
                           }, child: Text('No',
                         style: TextStyle(color:Color.fromARGB(255, 212, 80, 124))
                        )),
                       ],)
                     
                  ],
                 )
               
                ],
              )
            );
  }}