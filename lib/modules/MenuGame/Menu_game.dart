import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/game_user.dart';
import 'package:graduationproject/modules/MenuGame/view/all_games/foucs/view/define_foucs.dart';
import 'package:graduationproject/modules/MenuGame/view/all_games/math/view/define_math.dart';
import 'package:graduationproject/modules/menu/view/HomePage.dart';

import '../../app/model/game.dart';
import '../genereted/sheard/util.dart';
import 'controller/menu_game_controller.dart';
import 'view/all_games/foucs/view/foucs1.dart';
import 'view/all_games/letter_game/view/define_letter.dart';
import 'view/all_games/packet/view/packet.dart';
import 'view/all_games/word_game/view/define_word.dart';

class MenuGamePageView extends GetResponsiveView<MenuGameController> {
  MenuGameController controller=Get.put(MenuGameController());
  MenuGamePageView({super.key});
  @override
  Widget builder() {
    final random = Random();
    // final random1=Random();
    return SizedBox(
        height: screen.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
               Row(
                children: [
                      Material(
                        child: InkWell(
                                  onTap: () => Get.to(HomePage()),
                                  child: const Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey),
                                    ),
                                  ),
                                ),
                      ),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Menu Game',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                          color: Color.fromARGB(255, 42, 42, 114),
                          fontFamily: "Pacifico")),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: controller.ListGameUser.map((e) =>
                 cardshape(e.gameUser!, random, e.game!.GameName.toString(), e.game!)).toList()
              ),
              // Column(children:
              // controller.ListGameUser.map((element) => cardshape(
              //   element.Id!,random ,element.game!.GameName.toString()
              // ,element.userLevel.toString(),element.Score.toString(),element.game!)).toList()
              // ),
              // cardshape(
              //     random,
              //     'Letter Test',
              //     'In This Test You Need To Be Speed This Test Increse Information ang experaince',
              //     'assets/images/letter.png',
              //      splashscreenLetter()),
              // cardshape(
              //     random,
              //     'Word Test',
              //     '  This Test Have Three Level   Make Inderstanding Very Good and  Increase Yor Word ',
              //     'assets/images/4.png',
              //     Splashscrren()),
              // cardshape(
              //     random,
              //     'Math Test',
              //     ' In This Test You Need To Be Speed This Test Increse Information ',
              //     'assets/images/cubes.png',
              //     DefineMath()),
              // cardshape(
              //     random,
              //     'Foucs Test',
              //     'In This Test You Need To Be Speed This Test Increse Information ang experaince',
              //     'assets/images/15.png',
              //    FoucsGameView ()),
              // cardshape(
              //     random,
              //     'Packet Test',
              //     'In This Test You Need To Be Speed This Test Increse Information ang experaince',
              //     'assets/images/15.png',
              //     PacketPageView()),
                       Tooltip(
              message: 'Help About Page',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(onPressed: (){
              Get.dialog(Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blueAccent)),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              "Help",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Pacifico",
                                                  color: Color.fromARGB(255, 42, 42, 114),
                                                  decoration: TextDecoration.none),
                                            ),
                                          )),
                                    ),
                                             Padding(
                                               padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                                               child: Column(
                                                           children: <Widget>[
                                                             new Text(
                                                               controller. text,
                                                               textAlign: TextAlign.left,
                                                               style: TextStyle(
                                                                   fontSize: 18,
                                                                   decoration: TextDecoration.none,
                                                                   fontWeight: FontWeight.bold,
                                                                   color: Colors.black87),
                                                             ),
                                                           ],
                                                         ),
                                             ),
                                  ],
                                ),
                              ),
                            ),
                          ),
              ));
                  }, icon: Icon(Icons.help_outline_outlined,
                  size: 30,
                  color:Color.fromARGB(255, 246, 123, 127) ,)),
                ),
              ),
            )
            ],
          ),
        ));
  }

  Widget cardshape(List<GameUser> gamesUser,Random random, String nameplay,Game game ) {
    return Material(
        child: InkWell(
             onTap: () {
              controller.auth.gameUser.IdGame=game.Id;
              controller.auth.gameUser.game=game;
              controller.auth.gameUser.game=game;
                       controller.auth.gameUser.Id=gamesUser.first.Id;
              // controller.updateUserGame.value.game=game;
              // controller.updateUserGame.value.IdGame=game.Id;
              getGamenow(id:game.Id! );
             } ,
            child: SizedBox(
                width: 800,
                height: screen.height / 2.5,
                child: Card(
                    margin: const EdgeInsets.all(10),
                    color:Color.fromARGB(255, 248, 150, 153),
                    shadowColor: Color.fromARGB(255, 42, 42, 114),
                    elevation: 30,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                               game.Image == null
                              ? Image.asset(
                                  'assets/images/1.png',
                                  width: screen.width,
                                  fit: BoxFit.fill,
                                )
                              : Utility.imageFromBase64String(
                                  Utility.base64String(game.Image!),
                                 40,
                                  40),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: SizedBox(
                              //       height: 40,
                              //       width: 40,
                              //       child: Image.asset(url)),
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  nameplay,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          Column(children: gamesUser.map((e) => Column(
                           children: [
                             Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                             'Number Level Is :'+e.userLevel.toString(),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 230, 219, 219),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                             Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                             'Your Score In This Level :'+e.Score.toString(),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 230, 219, 219),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),

                           ],
                          )).toList(),),
                       
                        ])))));
  }
  Widget getGamenow({required int id}) {
  Widget widget;
  switch (id) {
    case 0:
      widget =  splashscreenLetter();
      break;
    case 1:
      widget =  Splashscrren();
      break;
       case 2:
      widget =   DefineMath();
      break;
       case 3:
      widget =  FoucsGameView ();
      break;
    default:
      widget =   PacketPageView();

      break;
  }
  return widget;
}
}
