import 'package:get/get.dart';
import 'package:graduationproject/modules/Intro/view/splash-screen.dart';
import 'package:graduationproject/modules/MenuGame/controller/splash_game.dart';
import 'package:graduationproject/modules/libraryy/controller/library_controller.dart';

import '../controller/splash-screen-controller.dart';


class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
  }
}