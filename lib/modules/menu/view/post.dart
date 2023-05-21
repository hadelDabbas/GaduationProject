import 'dart:html';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/animation/gf_animation.dart';
import 'package:getwidget/types/gf_animation_type.dart';
import 'package:graduationproject/modules/MenuGame/Menu_game.dart';
import 'package:graduationproject/modules/foucs/view/foucs1.dart';
import 'package:graduationproject/modules/icons/Icon.dart';
import 'package:graduationproject/modules/letter_game/view/letter1.dart';
import 'package:graduationproject/modules/menu/controller/menu.dart';

import '../../comment/view/comment.dart';
import 'content_show.dart';

class postPage extends GetResponsiveView <HomeController>{
static const listcontent = ['History', 'Global', 'Math', 'Sport'];


  @override
  Widget build(BuildContext context) {
    
    return Container( height: 600,
    color: Colors.white,
    child:SingleChildScrollView(
      child: Column(children: [
     contentPage(),
        post(' Hamza Hamza','Forest Is The tallest in the world   8848 mater',
      'assets/images/gabal.png',"History",controller),
      post('Aya Hamm','How Number Square IN This Photo? ','assets/images/19.png','Global',controller),
        post('Aya Hamm','How Number Square IN This Photo? ','assets/images/19.png','Global',controller)
      ],),
    ),);
    }
     Widget post(String title ,String txt,String url, String post,HomeController controller){
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
            Icon(Icons.person,color: Colors.blueGrey,),
               Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(alignment: Alignment.topLeft,
                child: Text(title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,
                color: Colors.blueGrey),)),
            ),
         Text("("+post+")",style: TextStyle(color: Colors.grey,)),
          ],),
          
            ClipRRect(
      borderRadius: BorderRadius.circular(20), // Image border
      child: Container(width: 400,height: 150,
      child: SizedBox.fromSize( 
        size: Size.fromRadius(48), // Image radius
        child: Image.asset( url, fit: BoxFit.cover),
      ),
      ),
    ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(txt,style: TextStyle(fontSize: 16),),
            ),

         SizedBox(height:5,),
    Align(alignment: Alignment.bottomRight,
    
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(width:350,),
       ElevatedButton(
  onPressed: () {
    Get.to( CommentPageView ());
  },
  child: Icon(AppIconn.chat,size: 14,),
  style: ElevatedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 248, 150, 153),
    shape: CircleBorder(),
   
  ),
),
        
         ElevatedButton(
  onPressed: () {
    if(controller.click==false){
      controller.click.value=true;
    }else{
      controller.click.value=false;
    }
  },
  child: 
        Obx(() =>   Icon(AppIconn.favorite,size: 14,
   color: controller.click.value==true?Colors.red:Colors.white,
  ),),
  style: ElevatedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 248, 150, 153),
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
 


    }
 