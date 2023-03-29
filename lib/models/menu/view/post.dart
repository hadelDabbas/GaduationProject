import 'dart:html';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/models/MenuGame/Menu_game.dart';
import 'package:graduationproject/models/foucs/view/foucs1.dart';
import 'package:graduationproject/models/letter_game/view/letter1.dart';
import 'package:graduationproject/models/menu/controller/menu.dart';

class postPage extends GetResponsiveView<MenuController>{
  MenuController controller =Get.put(MenuController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(children: [
         post(),
        
        ],)),
    );}}
    Widget post(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(
      child: Container(width: 450 , height: 300,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
        width: 1.3,
      ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(alignment: Alignment.topLeft,
                child: Text('History',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color: Colors.indigo),)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Forest Is The tallest in the world   8848 mater',style: TextStyle(fontSize: 18),),
            ),
            ClipRRect(
      borderRadius: BorderRadius.circular(20), // Image border
      child: Container(width: 400,height: 200,
      child: SizedBox.fromSize( 
        size: Size.fromRadius(48), // Image radius
        child: Image.asset('assets/images/gabal.png' , fit: BoxFit.cover),
      ),
      ),
    )
          ],),
        ),
    ),
  );
 }