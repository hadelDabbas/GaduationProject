import 'dart:html';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/models/MenuGame/Menu_game.dart';
import 'package:graduationproject/models/foucs/view/foucs1.dart';
import 'package:graduationproject/models/letter_game/view/letter1.dart';
import 'package:graduationproject/models/menu/controller/menu.dart';
import 'package:graduationproject/models/menu/view/post.dart';

import '../../values/AppIcon.dart';

class HomePage extends GetResponsiveView<MenuController>{
  MenuController controller =Get.put(MenuController());
  
 //    int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
     // backgroundColor: Colors.blue,
      backgroundColor: Colors.white70,
      bottomNavigationBar:CurvedNavigationBar(
      
        backgroundColor: Colors.white70,
        height: 60,
       buttonBackgroundColor: Colors.indigo,
      animationCurve: Curves.bounceInOut,
      index:controller.page.value,
      color: Colors.indigo,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {

          controller.page.value=index;
        },
        items: [
          Icon(Icons.account_circle_outlined,color: Colors.white,),
          Icon(Icons.games,color: Colors.white,),
          Icon(Icons.home,color: Colors.white,),
            Icon(Icons.search,color: Colors.white,),
             Icon(Icons.settings,color: Colors.white,),
      ]),
      body: Column(
        children: [
       Obx(() =>    getselectedwidget(index: controller.page.value))
        ],
      )
      //  SingleChildScrollView(
      //   child: Column(children: [
           
      //   ],),
      // )
      
      ); 
 }}
 Widget getselectedwidget({required  int index}){
  Widget widget;
  switch(index){
   case 0:
   widget= Container(child: Text('0'),);
   break;
    case 1:
   widget= MenuGamePageView();
   break;
    case 2:
   widget= Container( height: 600,
    color: Color.fromARGB(255, 236, 234, 234),
    child:SingleChildScrollView(
      child: Column(children: [post(' Hamza Hamza','Forest Is The tallest in the world   8848 mater',
      'assets/images/gabal.png',"History"),
      post('Aya Hamm','How Number Square IN This Photo? ','assets/images/19.png','Global',)
      ],),
    ),);
   break;
    case 3:
   widget= Container(child: Text('0'),);
   break;
   default:
   widget= Container(
  width: 600,
  height: 600,
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.white, Colors.indigo],
    ),
  ),
);

   
   break;
  }
  return widget;
 }
 Widget post(String title ,String txt,String url, String post){
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
    child: Center(
      child: Container(width: 500 , height: 280,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
        width: 1.3,
      ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
          child: Column(children: [
          Row(children: [
            Icon(Icons.person),
               Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(alignment: Alignment.topLeft,
                child: Text(title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.indigo),)),
            ),
         Text("("+post+")"),
          ],),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(txt,style: TextStyle(fontSize: 18),),
            ),
            ClipRRect(
      borderRadius: BorderRadius.circular(20), // Image border
      child: Container(width: 340,height: 150,
      child: SizedBox.fromSize( 
        size: Size.fromRadius(48), // Image radius
        child: Image.asset( url, fit: BoxFit.cover),
      ),
      ),
    ),
         SizedBox(height:5,),
    Align(alignment: Alignment.bottomRight,
    
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(width:350,),
       ElevatedButton(
  onPressed: () {},
  child: Icon(Icons.add_comment_rounded,size: 14,),
  style: ElevatedButton.styleFrom(
    shape: CircleBorder(),
   
  ),
),
        
         ElevatedButton(
  onPressed: () {},
  child: Icon(Icons.add_alert,size: 14,),
  style: ElevatedButton.styleFrom(
    shape: CircleBorder(),
   
  ),
)
        // Icon(Icons.add_alert),
      ],),
    )
          ],),
        ),
    ),
  );
 }
 
   