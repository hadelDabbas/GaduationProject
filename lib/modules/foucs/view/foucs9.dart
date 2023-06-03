
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MenuGame/Menu_game.dart';
import '../../timer/controller/timer_controller.dart';
import '../controller/foucs_controller.dart';

class FoucsGameView9 extends GetResponsiveView<FoucsController>{
   FoucsController controller=Get.put(FoucsController());
   TimerController timerController=Get.put(TimerController());
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Container(
    
      child: Column(children: [
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
              child: Text('  How Mny triangle In This Photo ?',style: TextStyle(fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.grey),),
            ),
          ),
          SizedBox(height: 20,),
            Padding(
                 padding: const EdgeInsets.fromLTRB(10, 10, 8, 8),
                     child: Container(
                      width: 500,
                      height: 250,
                       color: Colors.white,
                              child: 
                             Image.asset('assets/images/16.png')
                           ),
                              ),
                                SizedBox(height: 30,),
                                     
                              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                
                                ShapeAnswer('44'),
                                   ShapeAnswer('42'),
                                      ShapeAnswer('40'),
                              ],)
    ],),
   ));}
      Widget ShapeAnswer( String value){
       return  Padding(
                padding:const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Container( width: 100, height: 50,
                  child: ElevatedButton(  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 240, 145, 211)),),
                    onPressed: (){
                      if(timerController.time.value.toString()!='00:01' ){
                      if(value=='44'){
                    controller.result.value=900;
                      snak();
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
                              Get.to(MenuGamePageView());
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
                 Text(controller.result.value.toString(),style:
                  TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                   Text('Congratulations, You Win Last Level',style: TextStyle(fontSize: 16),),
                  Text('Do You Enjoy ?',style: TextStyle(fontSize: 16),),
                      Row(children: [
                         SizedBox(width: 40,),
                           TextButton(onPressed: (){
                          //  Get.to(FoucsGameView7());
                          Get.to(MenuGamePageView());
                           }, child: Text('yes',
                         style: TextStyle(color:Color.fromARGB(255, 212, 80, 124))
                        )), TextButton(onPressed: (){
                       Get.to(MenuGamePageView());
                         timerController.onClose();
                           }, child: Text('No',
                         style: TextStyle(color:Color.fromARGB(255, 212, 80, 124))
                        )),
                       ],)
                  ]));
      
}
   }