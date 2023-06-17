import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/groups/view/edit_group.dart';

import '../../comment/view/comment.dart';
import '../../icons/Icon.dart';
import '../controller/group_controller.dart';

class GroupView extends GetResponsiveView<GroupController> {
  GroupController controller = Get.put(GroupController());
  Widget builder() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          InkWell(
            onTap: () => Get.back(),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey),
              ),
            ),
          ),
          Container(
            height: 200,
            child: Image.asset(
                width: double.infinity,
                fit: BoxFit.fill,
                'assets/images/IT.gif'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              //  shadowColor: Colors.white60,
              color: Color.fromARGB(255, 236, 236, 243),
              child: Column(
                children: [
                  Center(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 80,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Information Tecnology',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '(IT)',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 120,
                          ),
                          Obx(
                            () => Tooltip(
                              message: 'Join TO Group',
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.blueGrey,
                                  backgroundColor:
                                      controller.press.value == false
                                          ? Color.fromARGB(255, 246, 123, 127)
                                          : Colors.white,
                                ),
                                onPressed: () {
                                  if (controller.press == false) {
                                    controller.press.value = true;
                                  } else {
                                    controller.press.value = false;
                                  }
                                },
                                child: Text(
                                  'Joining',
                                  style: TextStyle(
                                      color: controller.press.value == false
                                          ? Colors.white
                                          : Color.fromARGB(255, 246, 123, 127),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Tooltip(
                            message: 'Members In This Group',
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.blueGrey,
                                backgroundColor:
                                    Color.fromARGB(255, 246, 123, 127),
                              ),
                              onPressed: () {
                                Get.dialog(Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                      width: 300,
                                      height: 700,
                                      color: Colors.white,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Members',
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontFamily: "Pacifico",
                                                    color: Color.fromARGB(
                                                        255, 246, 123, 127),
                                                    decoration:
                                                        TextDecoration.none),
                                              ),
                                            ),
                                            shapFolloword('ASIA Badnjki',
                                                'assets/images/girl.gif'),
                                            shapFolloword('HADEEL Dabbas',
                                                'assets/images/girl.gif'),
                                            shapFolloword('HAYA Ysoufi',
                                                'assets/images/girl.gif')
                                          ],
                                        ),
                                      )),
                                ));
                              },
                              child: Text(
                                'Members',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        ' Description About Group :',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Row(
                      children: <Widget>[
                        Flexible(
                            child: Center(
                          child: new Text(
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black54,
                                decoration: TextDecoration.none,
                              ),
                              "   This group talk about tecnology information and\n                     programming launguge  "),
                        ))
                      ],
                    )),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Tooltip(
                  message: 'Edit Group ',
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(EditGrpoup());
                    },
                    child: Icon(
                      Icons.edit,
                      size: 18,
                      color: Color.fromARGB(255, 246, 123, 127),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      shape: CircleBorder(),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Tooltip(
                  message: 'Add Post ',
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.add,
                      size: 18,
                      color: Color.fromARGB(255, 246, 123, 127),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      shape: CircleBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          post('Dr.Abdallah hamwe', 'The loop you can used it in flutter',
              'assets/images/loop.png', 'IT', controller),
          post('Ahmad Ahmad', 'Why Flutter Uses Dart ?',
              'assets/images/dart.png', 'IT', controller)
        ]),
      ),
    );
  }

  Widget shapFolloword(String name, String url) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blueGrey)),
        child: Row(
          children: [
            Container(width: 80, height: 80, child: Image.asset(url)),
            SizedBox(
              width: 30,
            ),
            Text(
              name,
              style: TextStyle(
                  fontSize: 18,
                  decoration: TextDecoration.none,
                  color: Colors.blueGrey),
            )
          ],
        ),
      ),
    );
  }

  Widget post(String title, String txt, String url, String post, controller) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
      child: Center(
        child: Container(
          width: 500,
          height: 280,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.3,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.group,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.blueGrey),
                        )),
                  ),
                  Text("(" + post + ")",
                      style: TextStyle(
                        color: Colors.grey,
                      )),
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20), // Image border
                child: Container(
                  width: 400,
                  height: 150,
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(48), // Image radius
                    child: Image.asset(url, fit: BoxFit.fill),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  txt,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 350,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.to(CommentPageView());
                      },
                      child: Icon(
                        AppIconn.chat,
                        size: 14,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 248, 150, 153),
                        shape: CircleBorder(),
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        if (controller.click == false) {
                          controller.click.value = true;
                        } else {
                          controller.click.value = false;
                        }
                      },
                      child: Obx(
                        () => Icon(
                          AppIconn.favorite,
                          size: 14,
                          color: controller.click.value == true
                              ? Colors.red
                              : Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 248, 150, 153),
                        shape: CircleBorder(),
                      ),
                    )
                    // Icon(Icons.add_alert),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
