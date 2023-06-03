import 'package:get/get.dart';
import 'package:graduationproject/modules/Intro/view/splash-screen.dart';
import 'package:graduationproject/modules/MenuGame/controller/splash_game.dart';
import 'package:graduationproject/modules/content/controller/content_controller.dart';
import 'package:graduationproject/modules/libraryy/controller/library_controller.dart';



class ContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ContentController());
  }
}