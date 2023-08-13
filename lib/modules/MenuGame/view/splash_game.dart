import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:graduationproject/modules/MenuGame/controller/menu_game_controller.dart';

import '../Menu_game.dart';

class SplashGame extends GetResponsiveView<MenuGameController> {
  SplashGame({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 600,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(
                  child: Text('Game Testing',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                          color: Color.fromARGB(255, 42, 42, 114),
                          fontFamily: "Pacifico")),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Get Ready To Start Adventures',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        color: Colors.black54,
                      )),
                ),
              ),
              const Center(
                child: Text('with many of fantictic game',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: Colors.black54,
                    )),
              ),
              const SizedBox(
                height: 90,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      controller.ancontroller.repeat();
                    },
                    child: GFAnimation(
                      scaleAnimation: controller.animation,
                      controller: controller.ancontroller,
                      type: GFAnimationType.scaleTransition,
                      child: Image.asset(
                        'assets/images/circ.png',
                        width: 200,
                        height: 150,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Center(
                child: GFButton(
                  onPressed: () {
                    Get.to(MenuGamePageView());
                    // Get.dialog(Align(
                    //   alignment: Alignment.center,
                    //   child: Container(
                    //     width: 400,
                    //     height: 400,
                    //     decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.circular(10),
                    //         border: Border.all(color: Colors.blueAccent)),
                    //     child: SingleChildScrollView(
                    //       child: Column(
                    //         children: [
                    //           Container(child: LevelPageView()),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ));
                  },
                  color: const Color.fromARGB(255, 248, 150, 153),
                  text: "Game Page",
                  icon: const Icon(
                    Icons.arrow_circle_right,
                    color: Color.fromARGB(255, 42, 42, 114),
                  ),
                  shape: GFButtonShape.pills,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
