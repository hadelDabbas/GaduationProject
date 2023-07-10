import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/complaints/view/complaints.dart';
import 'package:graduationproject/modules/content/view/content.dart';
import 'package:graduationproject/modules/groups/view/add_group.dart';
import 'package:graduationproject/modules/groups/view/edit_group.dart';
import 'package:graduationproject/modules/libraryy/view/library.dart';
import 'package:graduationproject/modules/libraryy/view/show_librarys.dart';
import 'package:graduationproject/modules/testwidget/view/test.dart';

import '../../AddBook/view/addbook.dart';
import '../../Addpost/view/addpost.dart';
import '../../complaints/view/user_complaints.dart';
import '../../give permission/view/give permission.dart';
import '../../refrence/view/refrence.dart';

class SettingPageView extends GetResponsiveView {
  @override
  Widget builder() {
    return Container(
      height: 600,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(85, 8, 8, 8),
                  child: Center(
                    child: Text('Settings',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            color: Colors.blueGrey,
                            fontFamily: "Pacifico")),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 250,
                      height: 100,
                      child: Image.asset('assets/images/setting.gif')),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: [
                  Material(
                    child: InkWell(
                        onTap: () {
                          Get.to(AddGrpoup());
                        },
                        child: Tooltip(
                            message: 'Add New Group',
                            child: CardSetting(
                              "Group", Icons.group_add,
                              // Color.fromARGB(255, 63, 201, 214))
                            ))),
                  ),
                  Material(
                    child: InkWell(
                      onTap: () {
                        Get.dialog(Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 500,
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
                                          "Add post : ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Pacifico",
                                              color: Colors.blueGrey,
                                              decoration: TextDecoration.none),
                                        ),
                                      )),
                                  Container(
                                    child: Addpostview(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
                      },
                      child: Tooltip(
                          message: 'Add Post',
                          child: CardSetting("Post", Icons.post_add)),
                    ),
                  ),
                  Material(
                    child: InkWell(
                      onTap: () {
                        Get.to(Contentpage());
                      },
                      child: Tooltip(
                          message: 'Show content & Add & Delete',
                          child: CardSetting("Content", Icons.edit_calendar)),
                    ),
                  ),
                  Material(
                    child: InkWell(
                      onTap: () {
                        Get.to(ShowLibraryspage());
                      },
                      child: Tooltip(
                          message: 'Show Library & Add & Delete & update ',
                          child: CardSetting("Library", Icons.library_books)),
                    ),
                  ),
                  Material(
                    child: InkWell(
                      onTap: () {
                        Get.dialog(Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 400,
                            height: 400,
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
                                          "Give permission ",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Pacifico",
                                              color: Colors.blueGrey,
                                              decoration: TextDecoration.none),
                                        ),
                                      )),
                                  Container(
                                    child: Givepermission(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
                      },
                      child: Tooltip(
                          message: 'Add Permission',
                          child: CardSetting(
                              "permission", Icons.workspace_premium_sharp)),
                    ),
                  ),
                  Material(
                    child: InkWell(
                      onTap: () {
                        Get.to(ComplaintspageView());
                      },
                      child: Tooltip(
                          message: 'Add Complaints',
                          child: CardSetting("Complaints",
                              Icons.account_balance_wallet_rounded)),
                    ),
                  ),
                         Material(
                    child: InkWell(
                      onTap: () {
                        Get.to(RefrencePageView());
                      },
                      child: Tooltip(
                          message: 'Show Refrences',
                          child: CardSetting(" Refrences",
                              Icons.location_on)),
                    ),
                  ),
                  Material(
                    child: InkWell(
                      onTap: () {
                                  Get.dialog(Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 400,
                            height: 400,
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
                                          "User Complaints ",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Pacifico",
                                              color: Colors.blueGrey,
                                              decoration: TextDecoration.none),
                                        ),
                                      )),
                                  Container(
                                    child: UserComplaintspageView()),
                                  
                                ],
                              ),
                            ),
                          ),
                        ));
                      },
                      child: Tooltip(
                          message: 'User Complaints',
                          child: CardSetting(" User Complaints",
                              Icons.account_balance_wallet_rounded)),
                    ),
                  ),
                  Material(
                      child: InkWell(
                          onTap: () {
                            Get.to(TestPageView());
                          },
                          child: Tooltip(
                              message: 'Show all Quiz',
                              child: CardSetting("Quiz", Icons.check_box)))),
                  CardSetting("Language", Icons.language),
                  CardSetting("Help", Icons.question_mark),
                  CardSetting("Logout", Icons.exit_to_app),
                  Container(
                    width: 100,
                    height: 100,
                    child: Card(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CardSetting(String name, IconData data) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(60, 8, 10, 8),
        child: Container(
          height: 120,
          width: 150,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.3,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(3)),
          child: Card(
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
              Icon(data, color: Color.fromARGB(255, 246, 123, 127)),
              Text(name),
            ]),
          ),
        ));
  }
}
