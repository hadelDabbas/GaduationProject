import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/menu/view/HomePage.dart';
import '../../MenuGame/Menu_game.dart';
import '../../signup/view/signup1.dart';
import '../../timer/controller/timer_controller.dart';
import '../controller/letter_controller.dart';
import 'letter3.dart';
import 'letter6.dart';


class Letter2 extends GetResponsiveView<LetterController> {
  LetterController controller = Get.put(LetterController());
  List<String> stringword = ['قالب', "قلاب", "اقبل",'قابل'];
  List<String> emptylist = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 231, 229, 229),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 35,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(255, 240, 147, 224)),
                    child: Row(
                      children: [
                        Text('   الوقت :',
                            style: TextStyle(color: Colors.white)),
                        Obx(() => Center(
                              child: Text(
                                '  ${controller.time.value}',
                                style: TextStyle(
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
                        color: Color.fromARGB(255, 240, 147, 224)),
                    child: Row(
                      children: [
                        Text('    المتبقي :',
                            style: TextStyle(color: Colors.white)),
                        Obx(() => Center(
                              child: Text(
                                '  ${controller.resulting2.value}',
                                style: TextStyle(
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
                        color: Color.fromARGB(255, 240, 147, 224)),
                    child: Row(
                      children: [
                        Text('   الصحيح  :',
                            style: TextStyle(color: Colors.white)),
                        Obx(() => Center(
                              child: Text(
                                '  ${controller.correct.value}',
                                style: TextStyle(
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
          Text('النتيجة :' + controller.score.toString()),
            
          Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              SizedBox(
                width: 100,
              ),
              IconButton(
                onPressed: () {
                  if (controller.time.value.toString() != '00:01') {
                    if (controller.resulting2 != 0) {
                      if (stringword.contains(controller.letters.join()) &&
                          !emptylist.contains(controller.letters.join())) {
                        emptylist.add(controller.letters.join());
                        controller.correct += 1;
                        controller.resulting2 -= 1;
                        controller.letters.clear();
                      } else {
                        diolg('خاطئة', Icons.close, Colors.red);
                        controller.letters.clear();
                      }
                    } else {
                      Result('G',
                          'تهانينا اجتزت هذا المستوى هل تريد الانتقال للمستوى التالي؟');
                          controller.score.value+=10;
                            controller.resulting2 .value=0;
                    }
                  } else {
                    Result('T', 'انتهى الوقت هل تريد اعادة اللعبة');
                  }
                },
                icon: Icon(
                  Icons.next_plan_sharp,
                  color: Colors.grey[350],
                  size: 40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      controller.letters.remove(controller.letters.value.last);
                    },
                    icon: Icon(
                      Icons.backspace_outlined,
                      color: Colors.grey[350],
                      size: 35,
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => Text(
                      '   ' + controller.letters.join(),
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  )),
            ]),
          )),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Column(
              children: [
                createletter("ل"),
                Row(
                  children: [
                    SizedBox(width: 130),
                    createletter('ب'),
                    SizedBox(
                      width: 62,
                    ),
                    createletter('ا'),
                  ],
                ),
                createletter('ق')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "قم  بانشاء  كلمة  من  اربع  حروف",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          )
        ])));
  }

  Future diolg(String text, IconData icon, Color color) {
    return Get.dialog(Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 230, 230),
          border: Border.all(color: Colors.purple, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        width: 150,
        height: 120,
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
            ),
            Text(text,
                style: TextStyle(
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
            color: Color.fromARGB(255, 240, 230, 230),
            border: Border.all(color: Colors.purple, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          width: 400,
          height: 150,
          // color: Colors.white,
          child: txt == 'T'
              ? Column(
                  children: [
                    Text(
                      Word,
                      style: TextStyle(
                          fontSize: 20,
                          decoration: TextDecoration.none,
                          color: Color.fromARGB(255, 233, 82, 208)),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        TextButton(
                            onPressed: () {
                              Get.back();
                             controller.onReady();
                            },
                            child: Text('نعم',
                                style: TextStyle(color: Colors.grey))),
                        TextButton(
                            onPressed: () {
                              Get.to(MenuGamePageView());
                              controller.onClose();
                            },
                            child: Text('لا',
                                style: TextStyle(color: Colors.grey))),
                      ],
                    ),
                  ],
                )
              : Column(
                  children: [
                    Text(
                      Word,
                      style: TextStyle(
                          fontSize: 20,
                          decoration: TextDecoration.none,
                          color: Color.fromARGB(255, 233, 82, 208)),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        TextButton(
                            onPressed: () {
/////go to second level meduim
                              Get.to(Letter6pageview());
                             controller.onReady();
                            },
                            child: Text('نعم',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 80, 137, 212)))),
                        TextButton(
                            onPressed: () {
                               Get.to(MenuGamePageView());
                             controller.onClose();
                            },
                            child: Text('لا',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 80, 137, 212)))),
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
              backgroundColor: Color.fromARGB(255, 223, 70, 197),
              shape: CircleBorder(),
              padding: EdgeInsets.all(28),
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
// }
}
