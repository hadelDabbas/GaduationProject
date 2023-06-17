
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget scoreBoard (String title,String info){
  return Expanded(
    child: Container(
    margin: EdgeInsets.all(20.0),
    padding: EdgeInsets.symmetric(vertical: 6.0,horizontal: 22.0),
    decoration: BoxDecoration(color: Colors.white,
    borderRadius: BorderRadius.circular(6.0)
    ),
     child:  Column(
      children: [
        Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        SizedBox(height: 6,),
        Text(info,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
      ],
     ),
    ),
  );

}