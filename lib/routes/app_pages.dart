import 'package:get/get.dart';

import '../modules/Intro/view/intro.dart';
import '../modules/MenuGame/Menu_game.dart';
import '../modules/menu/view/HomePage.dart';
import '../modules/signin.dart/view/signin.dart';
part   'app_routes.dart';
class AppPages {
  AppPages._();

  static final routes = [
         GetPage(
  name:_Paths.home ,
      page: () =>HomePage(),
    ),
    GetPage(
  name:_Paths.Intro ,
      page: () => IntroPageView(),
    ),
      GetPage(
  name:_Paths.SignIn ,
      page: () =>SignInViewPage(),
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