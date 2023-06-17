
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'math3new.dart';
import 'math6.dart';
import 'math7.dart';
import 'math9.dart';
import 'mathn1.dart';

class DefineMath extends GetResponsiveView { 
  List<String>define=[' This Game Need Spead in calaulate and understandingand \n Are You Ready To Start ? \n '];
  @override
  Widget build(BuildContext Context) {
   return Scaffold(
      body: Container(
     
   decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/d.png',
              ), fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.25), BlendMode.modulate)
              
              )),
          child:Column(children: [
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
              Padding(
              padding: const EdgeInsets.fromLTRB(8, 80, 8, 8),
              child: Center(child: Text('Math Game',style: 
              TextStyle(fontSize: 30,
              fontFamily: "Pacifico",
              fontWeight: FontWeight.bold,color: Colors.blueGrey),)),
            ),
            SizedBox(height: 15,),
           Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height: 170,width: 170,
                  child: Image.asset('assets/images/10.png')),
              ) ,
                     SizedBox(height: 20,),
              TextButton(onPressed: (){
          Get.to(MathNew1PageView());
        }, child: 
         Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color.fromARGB(255, 62, 153, 65),width: 2)
          ),
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Text('Are You Want To Start ?',style: TextStyle(fontWeight: FontWeight.bold,
                   fontSize: 20,color: Colors.black87
                   ),),
           ),
         ),),
          ],)
      )
           );


  }}