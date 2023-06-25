import 'package:get/get.dart';
import 'package:graduationproject/app/model/library.dart';
import 'package:graduationproject/modules/profile/view/profile.dart';
import 'package:graduationproject/modules/signup/view/signup1.dart';

import '../modules/Intro/view/intro.dart';
import '../modules/MenuGame/Menu_game.dart';

import '../modules/MenuGame/binding/menu_game_binding.dart';
import '../modules/libraryy/view/library.dart';
import '../modules/menu/binding/menu_binding.dart';
import '../modules/menu/view/HomePage.dart';
import '../modules/packet/view/packet.dart';
import '../modules/password/binding/password_binding.dart';
import '../modules/password/view/password.dart';
import '../modules/signin.dart/binding/signin_binding.dart';
import '../modules/signin.dart/view/signin.dart';
import '../modules/signup/binding/signup_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.MenuGame,
      page: () => Profileview(),
      binding: MenuGameBinding()
    ),
    GetPage(
        name: _Paths.SignIn,
        page: () => SignInViewPage(),
        binding: SignInBinding()),
    GetPage(name: _Paths.home, page: () => HomePage(), binding: HomeBinding()),
    GetPage(
        name: _Paths.MenuGame,
        page: () => MenuGamePageView(),
        binding: MenuGameBinding()),
    GetPage(
        name: _Paths.signup, page: () => signupage(), binding: SignUpBinding()),
    GetPage(
        name: _Paths.password,
        page: () => ForgetViewPage(),
        binding: PasswordBinding()),
  ];
}
