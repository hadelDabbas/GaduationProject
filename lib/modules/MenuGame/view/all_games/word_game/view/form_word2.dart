import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../menu/view/HomePage.dart';
import '../controller/word_controller.dart';
import 'form_word3.dart';

class Formword2PageView extends GetResponsiveView<SplashScreencontroller> {
  Formword2PageView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> stringword = ["FLAME", "LAMP", 'IDEA'];
    List<String> emptylist = [];
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 109, 180, 141),
            Color.fromARGB(255, 233, 220, 174)
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.4, 0.7],
          tileMode: TileMode.repeated,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Get.to(HomePage());
              },
              child: const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child:
                      Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey),
                ),
              ),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 90,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 35,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 196, 228, 137),
                    ),
                    child: Row(
                      children: [
                        Obx(() => Center(
                              child: Text(
                                '    ${controller.count2.value}',
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
                      color: const Color.fromARGB(255, 196, 228, 137),
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
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 8, 8),
              child: Container(
                  color: Colors.white,
                  child: Image.asset('assets/images/8.png')),
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
                children:
                    controller.letters.map((e) => Lettershape(e)).toList()),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                  child: Center(
                    child: Center(
                      child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 143, 219, 159)),
                          ),
                          onPressed: () {
                            if (controller.timerController.time.value
                                    .toString() !=
                                '00:01') {
                              if (controller.count2.value != 2) {
                                if (stringword
                                        .contains(controller.AllWord.join()) &&
                                    !emptylist
                                        .contains(controller.AllWord.join())) {
                                  emptylist.add(controller.AllWord.join());

                                  controller.count2.value += 1;
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
                                controller.count2.value += 1;
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
                              const Color.fromARGB(255, 143, 219, 159)),
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
      ),
    ));
  }

  Widget Lettershape(String letter) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 143, 219, 159)),
          ),
          onPressed: () {
            controller.AllWord.add(letter);
          },
          child: Text(letter,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),
    );
  }

  Future Error(String txt) {
    return Get.dialog(Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 500,
        height: 60,
        color: Colors.white,
        child: Column(
          children: [
            Center(
              child: Text(
                txt,
                style: const TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.none,
                    color: Color.fromARGB(255, 225, 236, 161)),
              ),
            ),
            TextButton(
                onPressed: () {
                  Get.to(Formword3PageView());
                },
                child: const Text('yes',
                    style:
                        TextStyle(color: Color.fromARGB(255, 212, 80, 124)))),
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
        height: 40,
        color: const Color.fromARGB(255, 207, 238, 223),
        child: Center(
          child: Row(
            children: [
              const Text('Correct The Remainning is ',
                  style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.none,
                      color: Colors.amber)),
              Text(
                (3 - controller.count2.value).toString(),
                style: const TextStyle(fontSize: 20, color: Colors.amber),
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
        titleStyle: const TextStyle(color: Colors.yellowAccent),
        middleTextStyle: const TextStyle(color: Colors.black),
        barrierDismissible: false,
        radius: 50,
        content: Column(children: [
          Text(
            controller.res2.value.toString() + controller.res1.value.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const Text(
            'Congratulations, You Win This Level',
            style: TextStyle(fontSize: 16),
          ),
          const Text(
            'Do You Want To Go To Next Level',
            style: TextStyle(fontSize: 16),
          ),
          Row(
            children: [
              const SizedBox(
                width: 40,
              ),
              TextButton(
                  onPressed: () {
                    Get.to(Formword3PageView());
                  },
                  child: const Text('yes',
                      style: TextStyle(color: Colors.yellow))),
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child:
                      const Text('No', style: TextStyle(color: Colors.yellow))),
            ],
          )
        ]));
  }

  Future TimeOff() {
    return Get.dialog(Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 500,
        height: 50,
        color: Colors.white,
        child: Column(
          children: [
            const Text(
              'Time Off Do You Want To Retry ? ',
              style: TextStyle(
                  fontSize: 20,
                  decoration: TextDecoration.none,
                  color: Color.fromARGB(255, 176, 233, 179)),
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
                        style: TextStyle(
                            color: Color.fromARGB(255, 80, 212, 102)))),
                TextButton(
                    onPressed: () {
                      Get.back();
                      controller.timerController.onClose();
                    },
                    child: const Text('No',
                        style: TextStyle(
                            color: Color.fromARGB(255, 80, 212, 102)))),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
