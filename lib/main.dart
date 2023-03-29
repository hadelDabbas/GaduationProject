import 'dart:html';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/models/Intro/view/intro.dart';
import 'package:graduationproject/models/MenuGame/Menu_game.dart';
import 'package:graduationproject/models/menu/view/HomePage.dart';
import 'package:graduationproject/models/signin_view.dart/view/signin.dart';

import 'routes/app_pages.dart';


void main() {
  
  runApp(const MyApp( )); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   return GetMaterialApp.router(
    debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
    
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    
     defaultTransition: Transition.cupertino,
      getPages: AppPages.routes,
    );
    
  }
}