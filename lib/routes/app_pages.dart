import 'package:get/get.dart';
import 'package:graduationproject/modules/libraryy/view/library.dart';
import 'package:graduationproject/modules/profile/view/profile.dart';
import 'package:graduationproject/modules/signup/view/signup1.dart';

import '../modules/Intro/binding/intro_binding.dart';
import '../modules/Intro/view/intro.dart';
import '../modules/MenuGame/Menu_game.dart';
import '../modules/MenuGame/binding/menu_gamebinding.dart';
import '../modules/libraryy/binding/library_Binding.dart';
import '../modules/libraryy/view/show_librarys.dart';
import '../modules/menu/binding/menu_binding.dart';
import '../modules/menu/view/HomePage.dart';
import '../modules/profile/binding/profile_binding.dart';
import '../modules/signin.dart/binding/signin_binding.dart';
import '../modules/signin.dart/view/signin.dart';
import '../modules/signup/binding/signup_binding.dart';
part   'app_routes.dart';
class AppPages {
  AppPages._();

  static final routes = [
           GetPage(
  name:_Paths.library ,
      page: () =>ShowLibraryspage(),
      binding:  LibraryBinding()
    ),
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
      binding: IntroBinding()
    ),

          GetPage(
  name:_Paths.MenuGame ,
      page: () =>MenuGamePageView(),
      binding:  MenuGameBinding()
    ),
  

       GetPage(
  name:_Paths.library ,
      page: () =>Librarypage(),
      binding:  LibraryBinding()
    ),
         GetPage(
  name:_Paths.profile ,
      page: () =>Profileview(),
      binding:  ProfileBinding()
    ),
  //             GetPage(
  // name:_Paths.FlipCart ,
  // binding:FlipCartBinding() ,
  //     page: () =>FlipCart(),
  //   ),
    ];
}