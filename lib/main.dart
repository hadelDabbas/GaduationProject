import 'dart:html';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/models/Intro/view/intro.dart';
import 'package:graduationproject/models/MenuGame/Menu_game.dart';


void main() {
  
  runApp(const MyApp( )); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return GetMaterialApp.router(
      title: 'Flutter Demo',
    
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
       GetPage(name: '/intro', page: () =>IntroPageView() )
      
      ],
    );
    
  }
}