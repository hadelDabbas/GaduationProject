import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Intro1 extends StatelessWidget { 
  @override
  Widget build(BuildContext Context) {
 return Container(
  color: Colors.white,
  child: Center(
    child: Column(
      children: [
         Padding(
           padding:  const EdgeInsets.fromLTRB(10, 250, 10, 5),
           child: Text('Be Smart',style: TextStyle(color: Colors.grey,fontSize: 30,
                fontWeight: FontWeight.bold),),
         ),
       Padding(
         padding: const EdgeInsets.all(8),
         child: Center(child:Icon(Icons.all_inclusive_sharp,  size: 70, color:Colors.blue) ,),
       ) ,
      
      ],
    ),
  ),

 );

  }}