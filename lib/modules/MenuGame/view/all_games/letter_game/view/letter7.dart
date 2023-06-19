import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/MenuGame/Menu_game.dart';
import 'package:graduationproject/modules/MenuGame/view/all_games/letter_game/view/letter8.dart';

import '../controller/letter_controller.dart';

class Letter7pageview extends GetResponsiveView<LetterController> {
  Letter7pageview({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> stringword = ["مضغ", "غرض", "غمر", "مرض", "ضمر"];
    List<String> emptylist = [];
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: 700,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.white70,
            Color.fromARGB(255, 248, 132, 136),
          ],
        )),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue[900]),
                      child: Row(
                        children: [
                          const Text('   الوقت :',
                              style: TextStyle(color: Colors.white)),
                          Obx(() => Center(
                                child: Text(
                                  '  ${controller.time.value}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )),
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
                          color: Colors.blue[900]),
                      child: Row(
                        children: [
                          const Text('    المتبقي :',
                              style: TextStyle(color: Colors.white)),
                          Obx(() => Center(
                                child: Text(
                                  '  ${controller.resulting5.value}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )),
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
                          color: Colors.blue[900]),
                      child: Row(
                        children: [
                          const Text('   الصحيح  :',
                              style: TextStyle(color: Colors.white)),
                          Obx(() => Center(
                                child: Text(
                                  '  ${controller.correct.value}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text('النتيجة :${controller.score}'),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 100,
                    ),
                    IconButton(
                      onPressed: () {
                        if (controller.time.value.toString() != '00:01') {
                          if (controller.resulting5 != 0) {
                            if (stringword
                                    .contains(controller.letters.join()) &&
                                !emptylist
                                    .contains(controller.letters.join())) {
                              emptylist.add(controller.letters.join());
                              controller.correct += 1;
                              controller.resulting5 -= 1;
                              controller.letters.clear();
                            } else {
                              diolg('خاطئة', Icons.close, Colors.red);
                              controller.letters.clear();
                            }
                          } else {
                            Result('G',
                                'تهانينا اجتزت هذا المستوى هل تريد الانتقال للمستوى التالي؟');
                            controller.score.value += 10;
                            controller.resulting5.value = 0;
                          }
                        } else {
                          Result('T', 'انتهى الوقت هل تريد اعادة اللعبة');
                        }
                      },
                      icon: const Icon(
                        Icons.next_plan_sharp,
                        color: Colors.black54,
                        size: 40,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          onPressed: () {
                            controller.letters.remove(controller.letters.last);
                          },
                          icon: const Icon(
                            Icons.backspace_outlined,
                            color: Colors.black54,
                            size: 35,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => Text(
                          '   ${controller.letters.join()}',
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Column(
              children: [
                createletter("ر"),
                Row(
                  children: [
                    const SizedBox(
                      width: 130,
                    ),
                    createletter("ض"),
                    const SizedBox(
                      width: 62,
                    ),
                    createletter("غ"),
                  ],
                ),
                createletter("م"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "  قم  بانشاء  كلمة  من الحروف",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Future diolg(String text, IconData icon, Color color) {
    return Get.dialog(Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 240, 230, 230),
          border: Border.all(
              color: const Color.fromARGB(255, 248, 132, 136), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        width: 150,
        height: 140,
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
            ),
            Text(text,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black54,
                    decoration: TextDecoration.none)),
          ],
        ),
      ),
    ));
  }

  Future Result(String txt, String Word) {
    return Get.dialog(Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 240, 230, 230),
            border: Border.all(
                color: const Color.fromARGB(255, 248, 132, 136), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          width: 400,
          height: 140,
          // color: Colors.white,
          child: txt == 'T'
              ? Column(
                  children: [
                    Text(
                      Word,
                      style: const TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.none,
                        color: Color.fromARGB(255, 248, 132, 136),
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        TextButton(
                            onPressed: () {
                              Get.back();
                              controller.onReady();
                            },
                            child: Text('نعم',
                                style: TextStyle(color: Colors.blue[900]))),
                        TextButton(
                            onPressed: () {
                              Get.to(MenuGamePageView());
                              controller.onClose();
                            },
                            child: Text('لا',
                                style: TextStyle(color: Colors.blue[900]))),
                      ],
                    ),
                  ],
                )
              : Column(
                  children: [
                    Text(
                      Word,
                      style: const TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.none,
                        color: Color.fromARGB(255, 248, 132, 136),
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 40,
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(Letter8pageview());
                              controller.onReady();
                            },
                            child: Text('نعم',
                                style: TextStyle(color: Colors.blue[900]))),
                        TextButton(
                            onPressed: () {
                              Get.to(MenuGamePageView());
                              controller.onClose();
                            },
                            child: Text('لا',
                                style: TextStyle(color: Colors.blue[900]))),
                      ],
                    ),
                  ],
                ),
        )));
  }

  Widget createletter(String letter) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[900],
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(28),
            ),
            onPressed: () {
              controller.letters.add(letter);
              print(controller.letters.toString());
            },
            child: Text(
              letter,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
