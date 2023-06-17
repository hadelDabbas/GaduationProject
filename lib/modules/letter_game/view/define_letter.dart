
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/letter_game/view/letter1.dart';
import 'package:graduationproject/modules/letter_game/view/letter22.dart';

import 'letter4.dart';
import 'letter5.dart';
import 'letter6.dart';
import 'letter7.dart';
import 'letter8.dart';
import 'letter9.dart';
class splashscreenLetter extends StatelessWidget{
   @override
   Widget build(BuildContext context) {
       return Scaffold(
        backgroundColor: Colors.grey[200],
      body:
       Center(child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
    SizedBox(height: 180,),
        Container(width: 150,height: 150,
        child: Image.asset('assets/images/letter.png'),
        ),
        TextButton(onPressed: (){
          Get.to(Letter4pageview());
        }, child: 
         Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color.fromARGB(255, 62, 153, 65),width: 2)
          ),
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text('Welcom to Letter Play ',style: TextStyle(fontWeight: FontWeight.bold,
                   fontSize: 20,color: Colors.black87
                   ),),
           ),
         ),),
     
      ],)),
    );
  }
}