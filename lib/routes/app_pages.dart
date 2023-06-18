import 'package:get/get.dart';
import 'package:graduationproject/modules/signup/view/signup1.dart';

import '../modules/Intro/view/intro.dart';
import '../modules/MenuGame/Menu_game.dart';
<<<<<<< HEAD
import '../modules/MenuGame/binding/menu_gamebinding.dart';
import '../modules/flip_card/bindings/flip_cart_binding.dart';
import '../modules/flip_card/view/flip_cart.dart';
=======
import '../modules/MenuGame/binding/menu_game_binding.dart';
>>>>>>> 6392acd827d5813b1b90ed595d016a1e50560399
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
      page: () =>  MenuGamePageView(),
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
