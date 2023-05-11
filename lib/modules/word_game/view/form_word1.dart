import 'dart:async';
import 'dart:html';
import 'dart:js';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../MenuGame/Menu_game.dart';
import '../../menu/view/HomePage.dart';
import '../../timer/controller/timer_controller.dart';
import '../controller/word_controller.dart';
import 'form_word2.dart';


class FormwordPageView extends GetResponsiveView<SplashScreencontroller> {
  SplashScreencontroller controller=Get.put(SplashScreencontroller());
  TimerController timerController=Get.put(TimerController());
   List <String> stringword=["BUILDS","CITY"];
 List<String>emptylist=[];
 @override
  Widget build( BuildContext context) {
   return Scaffold(
     body: Container(
                  height: MediaQuery.of(context).size.height ,
                  width: MediaQuery.of(context).size.width ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [Color.fromARGB(255, 236, 132, 214), Color.fromARGB(255, 243, 233, 198)],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [0.4, 0.7],
                      tileMode: TileMode.repeated,
                    ),
                  ),
                  child: Column(children: [   InkWell(
                        onTap: () {
                          Get.to(HomePage());
                        },
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
                Row(children: [
                  SizedBox(width: 90,),
                   Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container( 
                                 height: 35, width: 120,
                                decoration:BoxDecoration(borderRadius: BorderRadius.circular(15),
                                 color:Colors.pinkAccent,
                                           ) ,
                               child: Row(children: [
                      Obx(() => Center(
                     child: Text('    '+controller.count.value.toString(),
                     style: TextStyle(
                     color: Colors.white,  ),),  )),
                       Text(' : Correct', style: TextStyle(
                                 color: Colors.white))
                    ],),
                           ),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container( 
                                 height: 35, width: 120,
                                decoration:BoxDecoration(borderRadius: BorderRadius.circular(15),
                                 color:Colors.pinkAccent,
                                           ) ,
                               child: Row(children: [
                      Obx(() => Center(
                     child: Text('  ${timerController.time.value}',
                     style: TextStyle(
                     color: Colors.white,  ),),  )),
                       Text(' : Timer', style: TextStyle(
                                 color: Color.fromARGB(255, 233, 227, 227)))
                    ],),
                           ),
            ),
                ],) ,  
    
            Text('Gusses The Word Accouring To Photo',
            style: TextStyle(color: Color.fromARGB(255, 221, 196, 196),fontSize: 20,
            fontWeight: FontWeight.bold),),

              Padding(
         padding: const EdgeInsets.fromLTRB(8, 10, 8, 8),
         child: Container(
          color: Colors.white,
          child: 
            Image.asset('assets/images/7.png')
         ),
       ),
           Obx(() => Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text(controller.AllWord.join(),
             style: TextStyle(color: Colors.white,fontSize: 20,
             fontWeight: FontWeight.bold),),
           )),
         Wrap(children:controller.letters.map((e) => Lettershape(e)).toList()
          ),
          Row(children: [
             Padding(
                padding:const EdgeInsets.fromLTRB(8, 15, 8, 8),
                child: Center(
                  child: Center(
                    child: ElevatedButton(  style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.pink[200]),),
                      onPressed: (){
                        if(timerController.time.value.toString()!='00:01' ){
                           if(controller.count.value!=1  ){
                                  if(stringword.contains(controller.AllWord.join())
                            &&!emptylist.contains(controller.AllWord.join())){
                                    
                              emptylist.add(controller.AllWord.join());
                             controller.count.value+=1;
                                correcting();
                                   controller.AllWord.clear();
                                ////اذا لم تكن الكلمه صحيحه والوقت لم ينتهي
                                 }else{
                                   Error('Error Word Try Again Please');
                                      controller.AllWord.clear();
                                 }
                           } else{
                            //الوثت لم بنتهي ولكن الكلمات جميعا صحيحه
                               controller.count.value+=1;
                               snak();
                                  controller.AllWord.clear();
                           }
                        }else{
                          //time off
                         TimeOff();
                            controller.AllWord.clear();
                        }
                      }, child: Text('Ok',
                    style:
                      TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white))),
                  ),
                ),
              ),
               Padding(
                padding:const EdgeInsets.fromLTRB(8, 15, 8, 8),
                child: Center(
                  child: ElevatedButton(  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.pink[200]),),
                    onPressed: (){
                  controller.AllWord.remove(controller.AllWord.value.last);
                    }, child: Icon(Icons.backspace_outlined,
                            size: 25, 
                        color: Colors.white
                )
                    ),
                ),
              )
          ],),
         
      

                  ]),
                ),
     
   );
  }
  Widget Lettershape( String letter){
    return  Padding(
                padding:const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: ElevatedButton(  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink[200]),),
                  onPressed: (){
                controller.AllWord.add(letter);
                  }, child: Text(letter,
                style:
                  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white))),
              );
  }
   Future  Error(String txt){
    return Get.dialog(Align( alignment: Alignment.bottomCenter,
      child: Container(
        width: 500,
        height: 90,
        color: Colors.white,
        child: Column(children: [
          Center( child:  Text(txt,style: TextStyle(fontSize: 20,decoration: TextDecoration.none,
                              color: Color.fromARGB(255, 204, 134, 175)),),
                           
                            ),
                    TextButton(onPressed: (){
                         Get.to(Formword2PageView());
                           }, child: Text('yes',
                         style: TextStyle(color:Color.fromARGB(255, 212, 80, 124))
                        )),
    
        ],
        ),
      ),
    ));
  }
   Future  correcting(){
    return Get.dialog(Align(alignment: Alignment.bottomCenter,
      child: Container(
         width: 500,
        height: 60,
        color: Colors.white,
        child: Center(child:
          Row(children: [
                              Text('Correct The Remainning is ',style: TextStyle(fontSize: 20,
                              decoration: TextDecoration.none,
                              color: Color.fromARGB(255, 204, 134, 175)),),
                            Text((2- controller.count.value).toString(),style: TextStyle(fontSize: 20,
                             color: Color.fromARGB(255, 230, 114, 181)),)
                            ],),
       ),
      ),
    ));
  }
   Future snak(){
    return Get.defaultDialog(
        title: "Result",
              backgroundColor: Colors.white,
              titleStyle: TextStyle(color: Colors.pink),
              middleTextStyle: TextStyle(color: Colors.black),
              barrierDismissible: false,
              radius: 50,
              content: Column(
                children: [
                 Text(controller.res1.value.toString(),style:
                  TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                   Text('Congratulations, You Win This Level',style: TextStyle(fontSize: 16),),
                  Text('Do You Want To Go To Next Level',style: TextStyle(fontSize: 16),),
                      Row(children: [
                         SizedBox(width: 40,),
                           TextButton(onPressed: (){
                            Get.to(Formword2PageView());
                           }, child: Text('yes',
                         style: TextStyle(color:Color.fromARGB(255, 212, 80, 124))
                        )), TextButton(onPressed: (){
                          Get.back();
                         timerController.onClose();
                           }, child: Text('No',
                         style: TextStyle(color:Color.fromARGB(255, 212, 80, 124))
                        )),
                       ],)
                  ]));
                 
  }
Future  TimeOff(){
    return Get.dialog(Align(alignment: Alignment.bottomCenter,
      child: Container(
         width: 500,
        height: 40,
        color: Colors.white,
        child: Column(children: [
            Text('Time Off Do You Want To Retry ? ',style: TextStyle(fontSize: 20,
            decoration: TextDecoration.none,
                              color: Color.fromARGB(255, 201, 141, 183)),),
          Row(children: [
                            
                      SizedBox(width: 40,),
                           TextButton(onPressed: (){
                              Get.back();
                           timerController.onReady();
                           }, child: Text('yes',
                         style: TextStyle(color:Color.fromARGB(255, 212, 80, 124))
                        )), TextButton(onPressed: (){
                          Get.back();
                         timerController.onClose();
                           }, child: Text('No',
                         style: TextStyle(color:Color.fromARGB(255, 212, 80, 124))
                        )),        
                            ],),
        ],),
      ),
    ));
  }
  }