import 'package:get/get.dart';
import 'package:graduationproject/modules/signup/view/signup1.dart';

import '../modules/MenuGame/Menu_game.dart';
import '../modules/MenuGame/binding/menu_game_binding.dart';
import '../modules/MenuGame/view/all_games/foucs/bindings/foucs_binding.dart';
import '../modules/MenuGame/view/all_games/letter_game/bindings/letter_game_binding.dart';
import '../modules/MenuGame/view/all_games/packet/binding/packet_binding.dart';
import '../modules/MenuGame/view/all_games/timer/bindings/timer_binding.dart';
import '../modules/MenuGame/view/all_games/word_game/bindings/word_game_binding.dart';
import '../modules/content/binding/content_binding.dart';
import '../modules/content/view/content.dart';
import '../modules/libraryy/binding/library_Binding.dart';
import '../modules/libraryy/view/show_librarys.dart';
import '../modules/menu/binding/menu_binding.dart';
import '../modules/menu/view/HomePage.dart';
import '../modules/password/binding/password_binding.dart';
import '../modules/password/view/password.dart';
import '../modules/profile/binding/profile_binding.dart';
import '../modules/profile/view/edit_profile.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/signin.dart/binding/signin_binding.dart';
import '../modules/signin.dart/view/signin.dart';
import '../modules/signup/binding/signup_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
        name: _Paths.SignIn,
        page: () => SignInViewPage(),
        binding: SignInBinding()),
    GetPage(
      name: _Paths.MenuGame,
      page: () => MenuGamePageView(),
      bindings: const [],
    ),
    GetPage(name: _Paths.home, page: () => HomePage(), bindings: [
      HomeBinding(),
      ProfileBinding(),
      SearchBinding(),
      TimerBinding(),
      MenuGameBinding(),
      PacketBinding(),
      FoucsBinding(),
      LetterBinding(),
      WordGameBinding()
    ], children: [
      GetPage(
        name: _Paths.editProfile,
        page: () => EditProfileview(),
      ),
    ]),
    GetPage(
        name: _Paths.password,
        page: () => ForgetViewPage(),
        binding: PasswordBinding()),
    GetPage(
        name: _Paths.signup, page: () => signupage(), binding: SignUpBinding()),
    GetPage(
        name: _Paths.content,
        page: () => Contentpage(),
        binding: ContentBinding()),
    GetPage(
        name: _Paths.libery,
        page: () => ShowLibraryspage(),
        binding: LibraryBinding()),
  ];
}
