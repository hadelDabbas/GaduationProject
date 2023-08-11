import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../app/model/GameDto.dart';
import '../../../app/model/game.dart';
import '../../../app/model/game_user.dart';
import '../../../app/model/user.dart';
import '../../sheard/auth_service.dart';
import '../data/adapter/game-adapter.dart';
import '../data/game_repositry.dart';

class MenuGameController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController ancontroller;
  final text='In this interface, you will display all the existing games, where each game has three levels, and each level has three stages';
  late Animation<double> animation;
  static MenuGameController get find => Get.find();
  var level=''.obs;
  var numberlevel=0.obs;
  final ListGameUser=<GameDto>[].obs;
final gamRepo=GameRepository();
  RxBool animate = false.obs;
   final auth = Get.find<AuthService>();
     final user = User().obs;
     final updateUserGame=GameUser().obs;
     final idnowGameuser=0.obs;
  @override
  void onInit() {
    super.onInit();
    ancontroller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = CurvedAnimation(parent: ancontroller, curve: Curves.linear);
    ancontroller.repeat();
    GetUser();
  }
  void NumberLevel(){
    switch (level.value){
      case 'First Level':
      numberlevel.value=1;
      updateUserGame.value.userLevel='First Level';
      auth.gameUser.userLevel='First Level';
      break;
        case 'Second Level':
      numberlevel.value=2;
      updateUserGame.value.userLevel='Second Level';
      auth.gameUser.userLevel='Second Level';
      break;
     default:
     numberlevel.value=3;
          updateUserGame.value.userLevel='Final Level';
             auth.gameUser.userLevel='Final Level';
    }
  }
    Future<void> GetUser() async {
    user.value = auth.getDataFromStorage()!;
    updateUserGame.value.IdUser=user.value.Id;
     updateUserGame.value.user=user.value;
  }

    Future <void> getAllGame() async{
    var data = await gamRepo.Getgame(user.value.Id!);
    ListGameUser.assignAll(data );

  }
  Future<void> UpdateGame() async {
    var res = await gamRepo.updateUserGame(idnowGameuser.value, updateUserGame.value);
    if (res) {  
      Get.back();
    }
  }
}
