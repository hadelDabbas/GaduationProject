
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/models/math/view/math1.dart';

class DefineMath extends GetResponsiveView { 
  List<String>define=[' This Game Need Spead in calaulate and understandingand \n Are You Ready To Start ? \n '];
  @override
  Widget build(BuildContext Context) {
   return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 103, 25, 117),
        // decoration: BoxDecoration(
        //   image:DecorationImage(image: AssetImage('assets/images/b.png'),
        //   fit:BoxFit.cover )     ),
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
              child: Center(child: Text('NUMBER TEST',style: 
              TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)),
            ),
             Padding(
                padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
                child: Container(
                  child: Image.asset('assets/images/3.png')),
              ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Center(
                 child: Text('You Need Spead in calaulate and understand',style: 
                 TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
               ),
             ),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Center(
                   child: Text('   Are You Ready To Start ?',style:
                    TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                 ),
               ),
              Padding(
                padding:const EdgeInsets.fromLTRB(8, 15, 8, 8),
                child: ElevatedButton(  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink[200]),),
                  onPressed: (){
                    Get.to(Math1PageView());
                  }, child: Text('Start',
                style:
                  TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white))),
              )
          ],)
      )
           );


  }}