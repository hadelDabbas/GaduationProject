import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../MenuGame/Menu_game.dart';
import '../controller/math_controller.dart';
import 'math4n.dart';

class MathNew3PageView extends GetResponsiveView<MathController> {
  MathController controller = Get.put(MathController());
  @override
  Widget builder() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/d.png',
              ), fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.25), BlendMode.modulate)
              
              )),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 180,
                ),
                Container(
                  height: 35,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueGrey,
                  ),
                  child: Row(
                    children: [
                      Obx(() => Center(
                            child: Text(
                              '  ${controller.time.value}',
                              style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                  fontSize: 18),
                            ),
                          )),
                      Text(' الوقت',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              decoration: TextDecoration.none))
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          Text('النتيجه :'+controller.score.toString(),    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Pacifico",
                        color: Colors.blueGrey,
                        decoration: TextDecoration.none),),
               SizedBox(
            height: 15,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                     Text('ما هما العددان الذين حاصل ضربهما  ',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 30,
                    decoration: TextDecoration.none)),
                      Text('يكون 20 ومجموعهم 15 ؟',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 30,
                    decoration: TextDecoration.none)),
                ],
              ),
            ),
            decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 246, 123, 127),),
            borderRadius: BorderRadius.circular(12),),),
   
          SizedBox(
            height: 30,
          ),
          ShapeAnswer('2,1'),
          ShapeAnswer('2,10'),
          ShapeAnswer('2,5'),
        ],
      ),
    );
  }

  Widget ShapeAnswer(String value) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Container(
        width: 170,
        height: 70,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 246, 123, 127)),
            ),
            onPressed: () {
                  if(controller.time.value.toString()!='00:01' ){
                  if(value=='2,10'){
                    controller.score.value+=10;
                 correct();
                }else{
              Result('E');
                }
                  }else{
                   Result('T');

                  }
            },
            child: Text(value,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))),
      ),
    );
  }
  Future  Result(String txt){
    return Get.dialog(Align(alignment: Alignment.center,
      child: 
      Container(
        decoration: BoxDecoration(
           color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueGrey)
        ),
         width: 400,
        height: 70,
   
        child:txt=='T'?
         Column(children: [
            Text('Time Off Do You Want To Retry ? ',style: TextStyle(fontSize: 20,
            decoration: TextDecoration.none,
                              color: Color.fromARGB(255, 246, 123, 127)),),
          Row(children: [
                            
                      SizedBox(width: 40,),
                           TextButton(onPressed: (){
                              Get.back();
                          controller.onReady();
                           }, child: Text('yes',
                         style: TextStyle(color:Colors.blueGrey)
                        )), TextButton(onPressed: (){
                         Get.to(MenuGamePageView());
                          controller.onClose();
                           }, child: Text('No',
                         style: TextStyle(color:Colors.blueGrey)
                        )),        
                            ],),
        ],):
        Column(
          children: [
             Text('Error Value Do You Want Retry ?',style: TextStyle(fontSize: 20,
            decoration: TextDecoration.none,
                              color: Color.fromARGB(255, 246, 123, 127)),),
          Row(children: [
                            
                      SizedBox(width: 40,),
                           TextButton(onPressed: (){
                              Get.back();
                          controller.onReady();
                           }, child: Text('yes',
                         style: TextStyle(color:Colors.blueGrey)
                        )), TextButton(onPressed: (){
                     Get.to(MenuGamePageView());
                          controller.onClose();

                           }, child: Text('No',
                         style: TextStyle(color:Colors.blueGrey)
                        )),        
                            ],),
        ],)
          
        )
      ),
    );
  }
 Future correct(){
    return  Get.dialog(Align(
  alignment: Alignment.center,
  child: Container(
    decoration: BoxDecoration(
           color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueGrey)
        ),
         width: 400,
        height: 100,
     child: Column(children: [
        Text('هل تريد الانتقال للمرحله التاليه؟',style: TextStyle(fontSize: 20,
            decoration: TextDecoration.none,
                              color: Color.fromARGB(255, 246, 123, 127)),),
          Row(children: [
                            
                      SizedBox(width: 40,),
                           TextButton(onPressed: (){
                            Get.to(MathNew4PageView());
                          controller.onReady();
                           }, child: Text('نعم',
                         style: TextStyle(color:Colors.blueGrey)
                        )), TextButton(onPressed: (){
                     Get.to(MenuGamePageView());
                          controller.onClose();

                           }, child: Text('لا',
                         style: TextStyle(color:Colors.blueGrey)
                        )),        
                            ],),
     ]),
  ),
    ));
  }
}
