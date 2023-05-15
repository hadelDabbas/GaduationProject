import 'dart:html';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/Intro/view/intro.dart';
import 'package:graduationproject/modules/MenuGame/Menu_game.dart';
import 'package:graduationproject/modules/groups/view/add_group.dart';
import 'package:graduationproject/modules/groups/view/group.dart';
import 'package:graduationproject/modules/groups/view/show_group.dart';
import 'package:graduationproject/modules/letter_game/view/letter1.dart';
import 'package:graduationproject/modules/letter_game/view/letter22.dart';
import 'package:graduationproject/modules/libraryy/view/library.dart';
import 'package:graduationproject/modules/menu/view/HomePage.dart';


import 'package:graduationproject/modules/Intro/view/splash-screen.dart';
import 'package:graduationproject/modules/profile/view/edit_profile.dart';
import 'package:graduationproject/modules/profile/view/profile.dart';
import 'package:graduationproject/modules/settings/view/settings.dart';
import 'package:graduationproject/modules/signin.dart/view/signin.dart';
import 'package:graduationproject/modules/signup/view/signup1.dart';
import 'package:graduationproject/modules/word_game/view/form_word2.dart';

import 'modules/MenuGame/view/splash_game.dart';
import 'modules/comment/view/comment.dart';
import 'modules/password/view/password.dart';
import 'routes/app_pages.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      Get.put(Dio());
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
    
     defaultTransition: Transition.cupertino,
     getPages:[
      GetPage(name: '/splash', page:() =>SplashGame()),
     GetPage(name: '/sigin', page:() => SignInViewPage())
      
     ]
     
   
    );
  }
}
