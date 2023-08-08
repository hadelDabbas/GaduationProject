import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/getwidget.dart';

import '../controller/test_controller.dart';

class QuestionPageView extends GetResponsiveView<TestController> {
  TestController controller = Get.put(TestController());

  @override
  Widget builder() {
    int number = 0;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Text(controller.nowTest.value.content!.typeName.toString(),
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    color: Color.fromARGB(255, 42, 42, 114),
                    fontFamily: "Pacifico")),
            // Column(
            //     children: controller.AllQustion.map((element) =>
            //         shapeQuestion(element, element.AllChose)).toList()),
            // Column(
            //  children: controller.nowTest.value.test.
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.dialog(Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 250,
                      height: 370,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueAccent)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Result ",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Pacifico",
                                        color: Color.fromARGB(255, 42, 42, 114),
                                        decoration: TextDecoration.none),
                                  ),
                                )),
                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Number Question Is ",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54,
                                                decoration: TextDecoration.none),
                                          ),
                                          Text(
                                            controller.AllQustion.length.toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(255, 246, 123, 127),
                                                decoration: TextDecoration.none),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Correct Value Is : ",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54,
                                                decoration: TextDecoration.none),
                                          ),
                                          Text(
                                            controller.result.toString(),
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(255, 246, 123, 127),
                                                decoration: TextDecoration.none),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                       Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "The Answer ",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Pacifico",
                                        color: Color.fromARGB(255, 42, 42, 114),
                                        decoration: TextDecoration.none),
                                  ),
                                )),
                                 Column(
                                  children: controller.AllQustion.map((element) => Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Text(element.cor.toString(),style: 
                                     TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                          decoration: TextDecoration.none), ),
                                  )).toList(),
                                 )   
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 50)),
                child: const Text(
                  'Result',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget shapeQuestion(Question Q, List<String> chose) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(Q.Qustion.toString(),
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: Colors.black54,
                    )),
              ),
            ),
            Column(
                children: Q.AllChose.map((e) => Row(
                      children: [
                        Material(
                            child: Obx(
                          () => Radio(
                              activeColor: Color.fromARGB(255, 42, 42, 114),
                              fillColor: MaterialStateProperty.all(
                             Color.fromARGB(255, 42, 42, 114),
                              ),
                              value: e.toString(),
                              groupValue: controller.selectedvalue.value,
                              onChanged: (value) {
                                controller.onChangevalue(value, Q.cor);
                              }),
                        )),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          e.toString(),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                        ),
                      ],
                    )).toList()),
          ]),
        ),
      ),
    );
  }
}

class Question {
  String? Qustion;
  List<String> AllChose = [];
  String? cor;
  String ?selectedval;
  Question(String Q, String correct, String one, String two, String three) {
    Qustion = Q;
    cor = correct;
    AllChose.add(one);
    AllChose.add(two);
    AllChose.add(three);
  }
}
