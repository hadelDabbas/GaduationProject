import 'dart:async';
import 'dart:html';
import 'dart:js';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../timer/controller/timer_controller.dart';
import '../controller/math_controller.dart';

class Math3PageView extends GetResponsiveView<MathController> {
MathController controller=Get.put(MathController());
 TimerController timerController=Get.put(TimerController());
   int a=0;
 @override
  Widget builder() {
   return Scaffold(
       backgroundColor: Colors.purple[900],
       body: Column(
       children: [
          SizedBox(width: 180,),
                           SizedBox(width: 8,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container( 
                                 height: 35, width: 120,
                                decoration:BoxDecoration(borderRadius: BorderRadius.circular(15),
                                 color:Colors.pink[100],
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
            ),
              SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('  Foucs Very Good To Win Its Easely ',
                  style: TextStyle(color: Colors.white ,fontSize: 30),),
                ),
                  SizedBox(height: 25,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: randnumber(controller.answer3.value),
                  ),
                    SizedBox(height: 12,),
                  res('98'),
                    SizedBox(height: 8,),
                   res('29'),
                    SizedBox(height: 8,),
                   res(controller.answer3.value.toString()),



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
   controller.answer3.value= v1 ^v2 -v3 ~/v4 +v5; 
   print(answer);
  return Container(
    child: Text('$v1 ^ $v2 - $v3 / $v4 + $v5  =',
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
                 if(value==controller.answer3.value.toString()){
                controller.result3.value +=100;
                controller.onClose();
                print(value);
                snak();
                }
                  else 
                  {
                   controller.result3.value=controller.result3.value;
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
                 Text(controller.result3.value.toString(),style:
                  TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                 controller.result3.value.toString()==300.toString()
                 &&controller.time.value.toString()!='00:01' ?
                 
                  
                    Container(width: 100,height: 100, color: Colors.pink[100],
                    child: Column(children: [
                      Text('Congratulations, you have passed all stages',style: TextStyle(color: Colors.pink,
                      fontSize: 16
                      ),),
                         Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Container( width: screen.width/4,height: 80,
                                      child: Image.asset( 'assets/images/happy.png')),
                                   ),
                                   Container(width: 200,child: Column(),)
                    ]),
                    ):Column(
                  children: [
                     Result('Good You Faield IN one level ', 'assets/images/ani5.png'),
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
                                    style: TextStyle(fontSize: 16,
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