
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/models/letter_game/view/letter1.dart';
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
          Get.to(Letter1());
        }, child: 
         Text('Welcom to Letter Play ',style: TextStyle(fontWeight: FontWeight.bold,
        fontSize: 20,color: Colors.black87
        ),),),
     
      ],)),
    );
  }
}