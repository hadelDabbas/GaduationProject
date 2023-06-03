
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MenuGame/Menu_game.dart';
import '../../timer/controller/timer_controller.dart';
import '../controller/foucs_controller.dart';
import 'foucs1.dart';

class FoucsGameView4 extends GetResponsiveView<FoucsController>{
   FoucsController controller=Get.put(FoucsController());
   TimerController timerController=Get.put(TimerController());
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Container(
      color: Colors.blueGrey[100],
        //  height: MediaQuery.of(context).size.height ,
        //           width: MediaQuery.of(context).size.width ,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(20),
        //             gradient: const LinearGradient(
        //               colors: [Color.fromARGB(255, 247, 239, 245), Color.fromARGB(255, 114, 113, 109)],
        //               begin: Alignment.bottomLeft,
        //               end: Alignment.topRight,
        //               stops: [0.4, 0.7],
        //               tileMode: TileMode.repeated,
        //             ),
        //           ),
      child: Column(
        children: [
          SizedBox(width: 100,),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container( 
                                 height: 35, width: 120,
                                decoration:BoxDecoration(borderRadius: BorderRadius.circular(15),
                                 color:Color.fromARGB(255, 240, 145, 211),
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
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(' How many numbers are there in the picture?',style: TextStyle(fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 117, 115, 115)),),
            ),
          ),
          SizedBox(height: 20,),
            Padding(
                 padding: const EdgeInsets.fromLTRB(10, 10, 8, 8),
                     child: Container(
                      width: 900,
                      height: 250,
                    //   color: Colors.white,
                              child: 
                             Image.asset('assets/images/24.png')
                           ),
                              ),
                                SizedBox(height: 30,),
                               
                              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                
                                ShapeAnswer('7'),
                                   ShapeAnswer('8'),
                                      ShapeAnswer('9'),
                              ],)
        ],
      ),
    ));}
    Widget ShapeAnswer( String value){
       return  Padding(
                padding:const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Container( width: 100, height: 50,
                  child: ElevatedButton(  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 240, 145, 211)),),
                    onPressed: (){
                      if(timerController.time.value.toString()!='00:01' ){
                      if(value=='7'){
                      Get.to(FoucsGameView1());
                    }else{
                  Result('E');
                    }
                      }else{
                       Result('T');
                      }
                   
                    }, child: Text(value,
                  style:
                    TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white))),
                ),
              );
  }
  Future  Result(String txt){
    return Get.dialog(Align(alignment: Alignment.center,
      child: Container(
         width: 400,
        height: 70,
        color: Colors.white,
        child:txt=='T'?
         Column(children: [
            Text('Time Off Do You Want To Retry ? ',style: TextStyle(fontSize: 20,
            decoration: TextDecoration.none,
                              color: Color.fromARGB(255, 233, 82, 208)),),
          Row(children: [
                            
                      SizedBox(width: 40,),
                           TextButton(onPressed: (){
                              Get.back();
                           timerController.onReady();
                           }, child: Text('yes',
                         style: TextStyle(color:Colors.grey)
                        )), TextButton(onPressed: (){
                     Get.to(MenuGamePageView());
                          timerController.onClose();
                           }, child: Text('No',
                         style: TextStyle(color:Colors.grey)
                        )),        
                            ],),
        ],):Column(
          children: [
             Text('Error Value Do You Want Retry ?',style: TextStyle(fontSize: 20,
            decoration: TextDecoration.none,
                              color: Color.fromARGB(255, 233, 82, 208)),),
          Row(children: [
                            
                      SizedBox(width: 40,),
                           TextButton(onPressed: (){
                              Get.back();
                           timerController.onReady();
                           }, child: Text('yes',
                         style: TextStyle(color:Color.fromARGB(255, 80, 137, 212))
                        )), TextButton(onPressed: (){
                       Get.to(MenuGamePageView());
                          timerController.onClose();
                           }, child: Text('No',
                         style: TextStyle(color:Color.fromARGB(255, 80, 137, 212))
                        )),        
                            ],),
        ],)
          
        )
      ),
    );
  }
}