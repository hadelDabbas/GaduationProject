import 'package:get/get.dart';
import 'package:graduationproject/modules/MenuGame/controller/splash_game.dart';
import 'package:graduationproject/modules/libraryy/controller/library_controller.dart';


class MenuGameBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MenuGameController());
  }
}