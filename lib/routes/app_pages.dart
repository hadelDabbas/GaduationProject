import 'package:get/get.dart';
import 'package:graduationproject/modules/signup/view/signup1.dart';

import '../modules/Intro/view/intro.dart';
import '../modules/MenuGame/Menu_game.dart';
import '../modules/menu/binding/menu_binding.dart';
import '../modules/menu/view/HomePage.dart';
import '../modules/signin.dart/binding/signin_binding.dart';
import '../modules/signin.dart/view/signin.dart';
import '../modules/signup/binding/signup_binding.dart';
part   'app_routes.dart';
class AppPages {
  AppPages._();

  static final routes = [
               GetPage(
  name:_Paths.signup ,
      page: () =>signupage(),
      binding: SignUpBinding()
    ),
          GetPage(
  name:_Paths.SignIn ,
      page: () =>SignInViewPage(),
      binding: SignInBinding (),
    ),
         GetPage(
  name:_Paths.home ,
      page: () =>HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
  name:_Paths.Intro ,
      page: () => IntroPageView(),
    ),

          GetPage(
  name:_Paths.MenuGame ,
      page: () =>MenuGamePageView(),
    ),

  //             GetPage(
  // name:_Paths.FlipCart ,
  // binding:FlipCartBinding() ,
  //     page: () =>FlipCart(),
  //   ),
    ];
}