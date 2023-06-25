
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MenuGame/Menu_game.dart';
import '../../timer/controller/timer_controller.dart';
import '../controller/foucs_controller.dart';
import 'foucs7.dart';

class FoucsGameView2 extends GetResponsiveView<FoucsController>{
   FoucsController controller=Get.put(FoucsController());
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: SingleChildScrollView(
      child: Container(
      height: 700,
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
                       child: Text('  ${controller.time.value}',
                       style: TextStyle(
                       color: Colors.white,  ),),  )),
                         Text(' : Timer', style: TextStyle(
                                   color: Color.fromARGB(255, 233, 227, 227)))
                      ],),
                             ),
              ),
                Text('النتيجه :'+controller.score.toString(),    style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Pacifico",
                          color: Colors.blueGrey,
                          decoration: TextDecoration.none),),
               SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text('  How Number The triangle In This Photo ?',style: TextStyle(fontSize: 25,
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
                               Image.asset('assets/images/18.png')
                             ),
                                ),
                                  SizedBox(height: 30,),
                                       
                                Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                  
                                  ShapeAnswer('30'),
                                     ShapeAnswer('33'),
                                        ShapeAnswer('35'),
                                ],)
      ],),
       ),
    ));}
      Widget ShapeAnswer( String value){
       return  Padding(
                padding:const EdgeInsets.fromLTRB(8, 8, 8, 8),
                child: Container( width: 100, height: 50,
                  child: ElevatedButton(  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 240, 145, 211)),),
                    onPressed: (){
                      if(controller.time.value.toString()!='00:01' ){
                      if(value=='35'){
                        controller.score.value+=10;
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
       decoration: BoxDecoration(
           color: Colors.white,
          borderRadius: BorderRadius.circular(12)),
        child:txt=='T'?
         Column(children: [
            Text('Time Off Do You Want To Retry ? ',style: TextStyle(fontSize: 20,
            decoration: TextDecoration.none,
                              color: Color.fromARGB(255, 233, 82, 208)),),
          Row(children: [
                            
                      SizedBox(width: 40,),
                           TextButton(onPressed: (){
                              Get.back();
                         controller.onReady();
                           }, child: Text('yes',
                         style: TextStyle(color:Colors.grey)
                        )), TextButton(onPressed: (){
                        Get.to(MenuGamePageView());
                         controller.onClose();
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
                        controller.onReady();
                           }, child: Text('yes',
                         style: TextStyle(color:Color.fromARGB(255, 80, 137, 212))
                        )), TextButton(onPressed: (){
                         Get.to(MenuGamePageView());
                        controller.onClose();
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
                 Text(controller.score.value.toString(),style:
                  TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                   Text('Congratulations, You Win Second Level',style: TextStyle(fontSize: 16),),
                  Text('Do You Want To Go To Next Level',style: TextStyle(fontSize: 16),),
                      Row(children: [
                         SizedBox(width: 40,),
                           TextButton(onPressed: (){
                            Get.to(FoucsGameView7());
                           }, child: Text('yes',
                         style: TextStyle(color:Color.fromARGB(255, 212, 80, 124))
                        )), TextButton(onPressed: (){
                           Get.to(MenuGamePageView());
                       controller.onClose();
                           }, child: Text('No',
                         style: TextStyle(color:Color.fromARGB(255, 212, 80, 124))
                        )),
                       ],)
                  ]));
      
}
   }