import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/MenuGame/controller/menu_game_controller.dart';

import '../controller/foucs_controller.dart';
import 'foucs2.dart';
import 'foucs4.dart';
import 'foucs5.dart';
import 'foucs7.dart';

class FoucsGameView extends GetResponsiveView<FoucsController> {
  MenuGameController Mcontroller=Get.put(MenuGameController());
  FoucsGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          InkWell(
            onTap: () => Get.back(),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(
            height: 140,
          ),
          RotationTransition(
            turns: Tween(begin: 0.0, end: 1.0)
                .animate(controller.animationController),
            child: Container(
              child: Center(
                child: Image.asset(
                  'assets/images/15.png',
                  fit: BoxFit.cover,
                  height: 180,
                  width: 180,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Foucs Game',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 179, 96, 154)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'This Game Tend To Speed And Foucs Your Brain',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'And The Expereins In The Rules Math',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 179, 96, 154)),
                ),
                onPressed: () {
              switch(Mcontroller.numberlevel.value){
                case 1:
                  Get.to(FoucsGameView4());
                    controller.onReady();
                  break;
                   case 2:
                Get.to(FoucsGameView5());
                    controller.onReady();
                  break;
                 default:
                 Get.to(FoucsGameView7());
                    controller.onReady();
                  break;
              };},
                child: const Text('Play Now',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))),
          )
        ]),
      ),
    );
  }
}
