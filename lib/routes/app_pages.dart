import 'package:get/get.dart';
import 'package:graduationproject/models/MenuGame/Menu_game.dart';
import 'package:graduationproject/models/signin_view.dart/view/signin.dart';

import '../models/Intro/view/intro.dart';
import '../models/flip_card/bindings/flip_cart_binding.dart';
import '../models/flip_card/view/flip_cart.dart';
part   'app_routes.dart';
class AppPages {
  AppPages._();

  static final routes = [
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
              GetPage(
  name:_Paths.FlipCart ,
  binding:FlipCartBinding() ,
      page: () =>FlipCart(),
    ),
    ];
}