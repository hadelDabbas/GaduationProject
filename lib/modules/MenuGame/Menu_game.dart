import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/MenuGame/view/all_games/foucs/view/define_foucs.dart';
import 'package:graduationproject/modules/MenuGame/view/all_games/math/view/define_math.dart';
import 'package:graduationproject/modules/menu/view/HomePage.dart';

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
              cardshape(
                  random,
                  'Letter Test',
                  'In This Test You Need To Be Speed This Test Increse Information ang experaince',
                  'assets/images/letter.png',
                   splashscreenLetter()),
              cardshape(
                  random,
                  'Word Test',
                  '  This Test Have Three Level   Make Inderstanding Very Good and  Increase Yor Word ',
                  'assets/images/4.png',
                  const Splashscrren()),
              cardshape(
                  random,
                  'Math Test',
                  ' In This Test You Need To Be Speed This Test Increse Information ',
                  'assets/images/cubes.png',
                  DefineMath()),
              cardshape(
                  random,
                  'Foucs Test',
                  'In This Test You Need To Be Speed This Test Increse Information ang experaince',
                  'assets/images/15.png',
                 FoucsGameView ()),
              cardshape(
                  random,
                  'Packet Test',
                  'In This Test You Need To Be Speed This Test Increse Information ang experaince',
                  'assets/images/15.png',
                  PacketPageView()),
            ],
          ),
        ));
  }

  Widget cardshape(Random random, String nameplay, String discribtion,
      String url, Widget n) {
    return Material(
        child: InkWell(
            onTap: () => Get.to(n),
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
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: Image.asset(url)),
                              ),
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
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Benfit From Used This Test :',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 230, 219, 219),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Flexible(
                              child: Text(discribtion,
                                  style: const TextStyle(fontSize: 18))),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                             'Number Level Is :'+ controller.numberlevel.value.toString(),
                              style: TextStyle(
                                  color: Color.fromARGB(255, 230, 219, 219),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ])))));
  }
}
