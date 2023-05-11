
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/foucs_controller.dart';
import 'foucs4.dart';

class FoucsGameView extends GetResponsiveView<FoucsController>{
 FoucsController controller=Get.put(FoucsController());
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Container(
            
        // height: MediaQuery.of(context).size.height ,
        //           width: MediaQuery.of(context).size.width ,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(20),
        //             gradient: const LinearGradient(
        //               colors: [Color.fromARGB(255, 246, 248, 250), Color.fromARGB(255, 243, 196, 227)],
        //               begin: Alignment.bottomRight,
        //               end: Alignment.center,
        //               stops: [0.4, 0.7],
        //               tileMode: TileMode.repeated,
        //             ),
        //           ),
      child: Column(children: [
      InkWell(
                      onTap: () => Get.back(),
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
        SizedBox(height: 140,),
        RotationTransition(
          turns: Tween(begin: 0.0,end: 1.0).animate(controller.animationController),
          child: Container(
            child: Center(
              child: Image.asset('assets/images/15.png',
              fit: BoxFit.cover,
              height: 180,
              width: 180,
              ),
            ),
          ),
        ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text('Foucs Game',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,
             color: Color.fromARGB(255, 179, 96, 154)),),
           ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('This Game Tend To Speed And Foucs Your Brain'
          ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
          color: Colors.grey),
          ),
        ),
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('And The Expereins In The Rules Math'
          ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
          color: Colors.grey),
          ),
        ),
          Padding(
                padding:const EdgeInsets.fromLTRB(8, 15, 8, 8),
                child: ElevatedButton(  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 179, 96, 154)),),
                  onPressed: (){
                    Get.to(FoucsGameView4());
                  }, child: Text('Play Now',
                style:
                  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white))),
              )
         ]),
    ),

   );}
}