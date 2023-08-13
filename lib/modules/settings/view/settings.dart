import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/libraryy/view/show_librarys.dart';
import 'package:graduationproject/modules/testwidget/view/test.dart';
import 'package:graduationproject/routes/app_pages.dart';

import '../../complaints/view/user_complaints.dart';
import '../../give permission/view/give permission.dart';
import '../../groups/view/post_Group.dart';
import '../../groups/view/show_group.dart';
import '../../refrence/view/refrence.dart';
import '../../sheard/auth_service.dart';
import 'help.dart';

class SettingPageView extends GetResponsiveView {
  SettingPageView({super.key});

  @override
  Widget builder() {
    final auth = Get.find<AuthService>();
    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(85, 8, 8, 8),
                  child: Center(
                    child: Text('Settings',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            color: Color.fromARGB(255, 42, 42, 114),
                            fontFamily: "Pacifico")),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
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
                          // Get.to(AddGrpoup());
                          Get.to(ShowGroupPageView());
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
                          Get.rootDelegate.toNamed(Routes.booktype);
                        },
                        child: Tooltip(
                            message: 'Book Type',
                            child: CardSetting(
                              'Book Type', Icons.content_copy_rounded,
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
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Add post : ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Pacifico",
                                              color: Color.fromARGB(
                                                  255, 42, 42, 114),
                                              decoration: TextDecoration.none),
                                        ),
                                      )),
                                  Container(
                                    child: PostGrpoup(),
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
                        Get.rootDelegate.toNamed(Routes.content);
                      },
                      child: Tooltip(
                          message: 'Show content & Add & Delete',
                          child: CardSetting("Content", Icons.edit_calendar)),
                    ),
                  ),
                  Material(
                    child: InkWell(
                      onTap: () {
                        Get.rootDelegate.toNamed(Routes.libery);
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
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          "Give permission ",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Pacifico",
                                              color: Color.fromARGB(
                                                  255, 42, 42, 114),
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
                  auth.isAdmin()
                      ? Material(
                          child: InkWell(
                            onTap: () {
                              Get.rootDelegate.toNamed(Routes.complaint);
                            },
                            child: Tooltip(
                                message: 'Add Complaints',
                                child: CardSetting("Complaints",
                                    Icons.account_balance_wallet_rounded)),
                          ),
                        )
                      : const SizedBox(),
                  Material(
                    child: InkWell(
                      onTap: () {
                        Get.to(RefrencePageView());
                      },
                      child: Tooltip(
                          message: 'Show Refrences',
                          child: CardSetting(" Refrences", Icons.location_on)),
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
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        width: 1,
                                      ),
                                      const Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              "User Complaints ",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Pacifico",
                                                  color: Color.fromARGB(
                                                      255, 42, 42, 114),
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                          )),
                                      Material(
                                        child: Tooltip(
                                          message: 'Help About Page',
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: IconButton(
                                                  onPressed: () {
                                                    Get.dialog(Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .blueAccent)),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              children: [
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                const Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              8.0),
                                                                  child: Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(8.0),
                                                                        child:
                                                                            Text(
                                                                          "Help",
                                                                          style: TextStyle(
                                                                              fontSize: 25,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontFamily: "Pacifico",
                                                                              color: Color.fromARGB(255, 42, 42, 114),
                                                                              decoration: TextDecoration.none),
                                                                        ),
                                                                      )),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          10,
                                                                          8,
                                                                          10,
                                                                          10),
                                                                  child: Column(
                                                                    children: <Widget>[
                                                                      Text(
                                                                        controller
                                                                            .textcuser1,
                                                                        textAlign:
                                                                            TextAlign.left,
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            decoration:
                                                                                TextDecoration.none,
                                                                            fontWeight: FontWeight.bold,
                                                                            color: Colors.black87),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ));
                                                  },
                                                  icon: const Icon(
                                                    Icons.help_outline_outlined,
                                                    size: 30,
                                                    color: Color.fromARGB(
                                                        255, 246, 123, 127),
                                                  )),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(child: UserComplaintspageView()),
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
                  CardSetting("Quiz", Icons.check_box),
                  Material(
                      child: InkWell(
                          onTap: () {
                            Get.dialog(Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          Border.all(color: Colors.blueAccent)),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Help",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Pacifico",
                                                      color: Color.fromARGB(
                                                          255, 42, 42, 114),
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 8, 10, 10),
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                controller.text,
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black87),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ));
                          },
                          child: Tooltip(
                              message: 'Change Language ',
                              child: CardSetting("Language", Icons.language)))),
                  // Material(child: InkWell(
                  //   onTap: () {
                  //      print('trjjkkkk');
                  //   },
                  //   child:
                  //    CardSetting("Language", Icons.language))),
                  Material(
                    child: InkWell(
                        onTap: () {
                          Get.to(HelpPageView());
                        },
                        child: CardSetting("Help", Icons.question_mark)),
                  ),
                  CardSetting("Logout", Icons.exit_to_app),
                  const SizedBox(
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
                color: const Color.fromARGB(255, 42, 42, 114),
                width: 1.3,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(3)),
          child: Card(
            child: Column(children: [
              const SizedBox(
                height: 30,
              ),
              Icon(data, color: const Color.fromARGB(255, 246, 123, 127)),
              Text(
                name,
                style: const TextStyle(color: Color.fromARGB(255, 42, 42, 114)),
              ),
            ]),
          ),
        ));
  }
}
