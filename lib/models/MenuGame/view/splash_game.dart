import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/models/MenuGame/controller/splash_game.dart';

class SplashGame extends GetResponsiveView{

  @override
  Widget build(BuildContext context) {
    return Container( height: 600,
    color: Color.fromARGB(255, 236, 234, 234),
    child:SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        Center(child: Text('Game Testing',style: TextStyle(fontSize: 20),),  
        ),
        SizedBox(height: 20,),
        Center(child: ScaleTransition(
          scale: controller.animation,
          child: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset('assets/images/20.png')),
        ),),
      ],),
    ),);
    }}
     
 