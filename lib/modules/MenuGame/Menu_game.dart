
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/math/view/define_math.dart';
import 'package:graduationproject/modules/menu/view/HomePage.dart';

import '../foucs/view/define_foucs.dart';
import '../letter_game/view/define_letter.dart';
import '../word_game/view/define_word.dart';



class MenuGamePageView extends GetResponsiveView <MenuController>{
  MenuController controller=Get.put(MenuController());
@override
  Widget builder() {
     final random = Random();
    // final random1=Random();
    return SizedBox(
      height: screen.height,
      child: SingleChildScrollView(
            child: Column(
              children: [
                Row(children: [
                      // Material(
                      //   child: InkWell(
                      //     onTap: () => Get.to(HomePage()),
                      //     child: Icon(Icons.arrow_back_ios,
                      //                  size: 20, 
                      //                color: Colors.grey
                      //                 ),
                      //   ),
                      // ),
                SizedBox(width: 8,),
               Text('Menu Game',
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,decoration: TextDecoration.none,
                     color: Colors.blueGrey,fontFamily: "Pacifico")),
                ],),
                    SizedBox(height: 15,),
                                    cardshape(random, 'Letter Test', 'In This Test You Need To Be Speed This Test Increse Information ang experaince',
               'assets/images/letter.png',splashscreenLetter() ),
               cardshape(random, 'Word Test', '  This Test Have Three Level   Make Inderstanding Very Good and  Increase Yor Word ',
                                              'assets/images/4.png'    , Splashscrren()      ),
               cardshape(random, 'Math Test',' In This Test You Need To Be Speed This Test Increse Information ',
               'assets/images/cubes.png',DefineMath ()),
               cardshape(random, 'Foucs Test', 'In This Test You Need To Be Speed This Test Increse Information ang experaince',
               'assets/images/15.png',FoucsGameView() ),
  
              ],
            ),
          ),
    )
    
      ;
    

  }
 Widget Types (String name,String Url  ,Random random,Random random1){
   return Container(  width:screen.width /8,
  
     child: Card(
     color: Color.fromARGB(random.nextInt(10), random.nextInt(10),
              random.nextInt(10), random.nextInt(10)),
    child:Column(
      children: [
               SizedBox(  width: 5,
                child: Image.asset(Url))
          
      ],
    ) ,
     ),
   );

 }
  Widget cardshape (Random random,String nameplay,String discribtion,String url,Widget n){
    return Material(
      child: InkWell(
        child: Container( width: 800,
        height: screen.height/2.5,
          child: Card(
              margin: EdgeInsets.all(10),
          color: Color.fromARGB(random.nextInt(256), random.nextInt(256),
                    random.nextInt(256), random.nextInt(256)),
         shadowColor: Colors.blueGrey,
          elevation: 30,
          child: Column( crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height: 40,width: 40,
                  child: Image.asset(url)),
              ) ,
                Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(nameplay,style: TextStyle(fontWeight: FontWeight.bold
              ,fontSize: 20),),
            ),
            ],),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Benfit From Used This Test :',style:
               TextStyle(color: Color.fromARGB(255, 230, 219, 219),
                fontSize: 18,fontWeight: FontWeight.bold),),
            ),
            Flexible(
                 child: new Text(discribtion,style: TextStyle(fontSize: 18))),
                    Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Number Of Level is : 3',style:
               TextStyle(color: Color.fromARGB(255, 230, 219, 219),
                fontSize: 18,fontWeight: FontWeight.bold),),
            ),
            Row(
              children: [
                  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('mixmium : 300',style: TextStyle(fontSize: 16),),
            ),
                  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('minumm is : 0',style: TextStyle(fontSize: 16),),
            ),
              ],
            ),
        
          ])
            
          ),
        ),
        onTap: () {
          Get.to(n);
        },
      ),
    );
  }
}