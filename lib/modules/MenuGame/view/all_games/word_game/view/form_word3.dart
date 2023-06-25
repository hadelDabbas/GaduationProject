import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Menu_game.dart';
import '../controller/word_controller.dart';

class Formword3PageView extends GetResponsiveView<SplashScreencontroller> {
  Formword3PageView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> stringword = ['BRAIN', 'PEPOLE', 'IT', 'POWER'];
    List<String> emptylist = [];
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 134, 207, 241),
            Color.fromARGB(255, 250, 168, 114)
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.4, 0.7],
          tileMode: TileMode.repeated,
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => MenuGamePageView(),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey),
              ),
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 35,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 159, 213, 235),
                  ),
                  child: Row(
                    children: [
                      Obx(() => Center(
                            child: Text(
                              '    ${controller.count3.value}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )),
                      const Text(' : Correct',
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 35,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 159, 213, 235),
                  ),
                  child: Row(
                    children: [
                      Obx(() => Center(
                            child: Text(
                              '  ${controller.timerController.time.value}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )),
                      const Text(' : Timer',
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
            child: Container(
                color: Colors.white, child: Image.asset('assets/images/9.png')),
          ),
          Obx(() => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  controller.AllWord.join(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )),
          Wrap(
              children: controller.letters.map((e) => Lettershape(e)).toList()),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                child: Center(
                  child: Center(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 214, 116, 35))),
                        onPressed: () {
                          if (controller.timerController.time.value
                                  .toString() !=
                              '00:01') {
                            if (controller.count3.value != 3) {
                              if (stringword
                                      .contains(controller.AllWord.join()) &&
                                  !emptylist
                                      .contains(controller.AllWord.join())) {
                                emptylist.add(controller.AllWord.join());

                                controller.count3.value += 1;
                                correcting();
                                print(controller.count2.value);
                                controller.AllWord.clear();
                                ////اذا لم تكن الكلمه صحيحه والوقت لم ينتهي
                              } else {
                                Error('Error Word Try Again Please');
                                controller.AllWord.clear();
                              }
                            } else {
                              //الوثت لم بنتهي ولكن الكلمات جميعا صحيحه
                              controller.count3.value += 1;
                              snak();
                              controller.AllWord.clear();
                            }
                          } else {
                            //time off
                            TimeOff();
                            controller.AllWord.clear();
                          }
                        },
                        child: const Text('Ok',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                child: Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 214, 116, 35)),
                      ),
                      onPressed: () {
                        controller.AllWord.remove(controller.AllWord.last);
                      },
                      child: const Icon(Icons.backspace_outlined,
                          size: 25, color: Colors.white)),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }

  ////The function and dailoge
  Widget Lettershape(String letter) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 214, 116, 35)),
          ),
          onPressed: () {
            controller.AllWord.add(letter);
          },
          child: Text(letter,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),
    );
  }

  Future Error(String txt) {
    return Get.dialog(Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 500,
        height: 50,
        color: const Color.fromARGB(255, 241, 214, 179),
        child: Column(
          children: [
            Center(
              child: Text(
                txt,
                style: const TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.none,
                    color: Color.fromARGB(255, 81, 112, 216)),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Future correcting() {
    return Get.dialog(Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 500,
        height: 50,
        color: const Color.fromARGB(255, 241, 214, 179),
        child: Center(
          child: Row(
            children: [
              const Text('Correct The Remainning is ',
                  style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.none,
                      color: Color.fromARGB(255, 81, 112, 216))),
              Text(
                (4 - controller.count3.value).toString(),
                style: const TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 81, 112, 216)),
              )
            ],
          ),
        ),
      ),
    ));
  }

  Future snak() {
    return Get.defaultDialog(
        title: "Result",
        backgroundColor: Colors.white,
        titleStyle: const TextStyle(color: Colors.orange),
        middleTextStyle: const TextStyle(color: Colors.black),
        barrierDismissible: false,
        radius: 50,
        content: Column(children: [
          Text(
            controller.res3.value.toString() +
                controller.res1.value.toString() +
                controller.res2.value.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const Text(
            'Congratulations, You Win This Test',
            style: TextStyle(fontSize: 16),
          ),
          const Text(
            'Are You Enjoy With Us ?',
            style: TextStyle(fontSize: 16),
          ),
          Row(
            children: [
              const SizedBox(
                width: 40,
              ),
              TextButton(
                  onPressed: () {
                    // Get.to(Formword3PageView());
                  },
                  child: const Text('yes',
                      style: TextStyle(color: Colors.orangeAccent))),
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('No',
                      style: TextStyle(color: Colors.orangeAccent))),
            ],
          )
        ]));
  }

  Future TimeOff() {
    return Get.dialog(Align(
      alignment: Alignment.center,
      child: Container(
        width: 500,
        height: 70,
        color: Colors.white,
        child: Column(
          children: [
            const Text(
              'Time Off Do You Want To Retry ? ',
              style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.none,
                  color: Colors.blue),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 40,
                ),
                TextButton(
                    onPressed: () {
                      Get.back();
                      controller.timerController.onReady();
                    },
                    child: const Text('yes',
                        style: TextStyle(color: Colors.blueAccent))),
                TextButton(
                    onPressed: () {
                      Get.back();
                      controller.timerController.onClose();
                    },
                    child: const Text('No',
                        style: TextStyle(color: Colors.blueAccent))),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
