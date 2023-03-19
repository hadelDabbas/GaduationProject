import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Intro2 extends StatelessWidget { 
  @override
  Widget build(BuildContext Context) {
 return Center(
   child: Column(
     children: [
        //  Lottie.network(
        //         'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
        //         height: 200),
      Padding(
        padding: const EdgeInsets.fromLTRB(8, 80, 8, 8),
        child: Text('You Will Enjoy ',style:  TextStyle(color: Colors.amber,fontSize: 17),),
      ),
       Padding(
         padding: const EdgeInsets.fromLTRB(8, 90, 8, 8),
         child: Container(
          color: Colors.white,
          child: 
            Image.asset('assets/images/9.png')
          
         ),
       ),
     ],
   ),
 );

  }}