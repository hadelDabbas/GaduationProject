import 'dart:async';
import 'dart:html';
import 'dart:js';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/math/controller/math_controller.dart';
import 'package:graduationproject/modules/math/view/math3.dart';

import '../../menu/view/HomePage.dart';
import '../../timer/controller/timer_controller.dart';


class Math2PageView extends GetResponsiveView<MathController> {
MathController controller=Get.put(MathController());
 TimerController timerController=Get.put(TimerController());
   int a=0;
 @override
  Widget builder() {
   return Scaffold(
       backgroundColor: Colors.purpleAccent,
       body: Column(
       children: [
          SizedBox(width: 180,),
                           SizedBox(width: 8,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container( 
                                 height: 35, width: 120,
                                decoration:BoxDecoration(borderRadius: BorderRadius.circular(15),
                                 color:Colors.pinkAccent,
                                           ) ,
                               child: Row(children: [
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
                      Obx(() => Center(
                     child: Text('  ${timerController.time.value}',
                     style: TextStyle(
                     color: Colors.white,  ),),  )),
                       Text(' : Timer', style: TextStyle(
                                 color: Colors.white))
                    ],),
                           ),
            ),
              SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('   Choose The Coreccote You Can  ',
                  style: TextStyle(color: Colors.white ,fontSize: 30),),
                ),
                  SizedBox(height: 25,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: randnumber(controller.answer.value),
                  ),
                    SizedBox(height: 12,),
                  res('98'),
                    SizedBox(height: 8,),
                  res(controller.answer2.value.toString()),
                    SizedBox(height: 8,),
                  res('29')

                 



       ],


       ));
 
  }
 Widget randnumber(int answer){
 var rng = Random();
  int v1=rng.nextInt(10);
    int v2=rng.nextInt(10);
      int v3=rng.nextInt(10);
        int v4=rng.nextInt(10);
         int v5=rng.nextInt(10);
   controller.answer2.value= v1 +v2 *v3 -v4 %v5; 
   print(answer);
  return Container(
    child: Text('$v1 +$v2 *$v3 -$v4  % $v5 =',
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
                 if(value==controller.answer2.value.toString()){
                controller.result2.value +=100;
                controller.onClose();
                print(value);
                snak();
                }
                  else 
                  {
                   controller.result2.value=controller.result2.value;
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
                 Text(controller.result2.value.toString(),style:
                  TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                 controller.result2.value.toString()==200.toString()
                 &&controller.time.value.toString()!='00:01' ?
                 Column(
                  children: [
                    Result('Very Good', 'assets/images/ani1.png'),
                    Text('Are You Ready To Level 3 ?'),
                    Row( children: [
                      SizedBox(width: 40,),
                        TextButton(onPressed: (){
                          Get.to(Math3PageView());
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
}