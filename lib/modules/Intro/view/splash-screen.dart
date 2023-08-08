import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:graduationproject/modules/Intro/controller/intro-controller.dart';
import 'package:graduationproject/modules/Intro/controller/splash-screen-controller.dart';

class SplashScreen extends StatelessWidget {
  //SplashScreen({key? key}) : super(key: key);
  final splashController = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    splashController.StartAnimation();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Obx(() => AnimatedPositioned(
                duration: const Duration(milliseconds: 1500),
                top: splashController.animate.value ? 210 : -150,
                left: splashController.animate.value ? 170 : -100,
                child: Container(
                    width: 170,
                    height: 140,
                    child: Image.asset('assets/images/intro.png')),
              )),
          Obx(() => AnimatedPositioned(
                duration: const Duration(microseconds: 1000),
                bottom: splashController.animate.value ? 200 : -150,
                right: splashController.animate.value ? 180 : -100,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Info',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 42, 42, 114)),
                        ),
                        Text(
                          'City',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 246, 123, 127)),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Information ',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 107, 176, 181)),
                        ),
                        Text(
                          'Socity',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 246, 123, 127)),
                        )
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
