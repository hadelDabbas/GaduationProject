import 'package:get/get.dart';
import 'package:graduationproject/models/MenuGame/Menu_game.dart';
import 'package:graduationproject/models/signIn/view/signIn.dart';

import '../models/Intro/view/intro.dart';
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
      page: () =>SignIn(),
    ),
          GetPage(
  name:_Paths.MenuGame ,
      page: () =>MenuGamePageView(),
    ),
    ];
}