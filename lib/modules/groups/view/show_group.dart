import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/groups/controller/group_controller.dart';
import 'package:graduationproject/modules/groups/view/group.dart';

import '../../../app/model/group.dart';
import '../../genereted/sheard/util.dart';

class ShowGroupPageView extends GetResponsiveWidget<GroupController> {
  GroupController controller = Get.put(GroupController());
  @override
  Widget builder() {
    final random = Random();
    return SizedBox(
      height: screen.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Material(
              child: InkWell(
                onTap: () => Get.back(),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back_ios,
                        size: 20, color: Colors.grey),
                  ),
                ),
              ),
            ),
            Text(
              " All Groups ",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico",
                  color: Colors.blueGrey,
                  decoration: TextDecoration.none),
            ),
            // SingleChildScrollView(
            //   child: Container(
            //            height: 40,
            //     child: Wrap(children:controller.Content.map((e) => BuildcontentGroup(e)).toList() ,)),
            // ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: 500,
                  child: Material(
                    child: TextField(
                        decoration: InputDecoration(
                            labelText: 'search',
                            labelStyle: TextStyle(
                                color: Color.fromARGB(255, 184, 183, 183),
                                fontWeight: FontWeight.bold),
                            hintText: 'search',
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 196, 195, 195),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3,
                                  color: Color.fromARGB(255, 196, 195, 195)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 3,
                                  color: Color.fromARGB(255, 196, 195, 195)),
                              borderRadius: BorderRadius.circular(15),
                            ))),
                  )),
            ),
            SizedBox(
              height: 8,
            ),
            Column(children: controller.AllGroups.map((e) => Cardgroup(e.Image!, e.groupName.toString(),e)).toList(),),
            // Cardgroup('assets/images/IT.gif', 'Information tecnology'),
            // Cardgroup('assets/images/history.gif', 'Historyical'),
            // Cardgroup('assets/images/welcom.png', 'Global'),
            // Cardgroup('assets/images/team.png', 'Medical'),
            // Cardgroup('assets/images/welcom.png', 'Global'),
            // Cardgroup('assets/images/team.png', 'Medical'),
            Container(
              height: 100,
            )
          ],
        ),
      ),
    );
  }

  Widget Cardgroup(Uint8List url, String name,Group g) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Material(
        child: InkWell(
          onTap: () {
            controller.getGroup(g.Id!);
            Get.to(GroupView());
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 1.3,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(22.0)),
            height: screen.height / 4.6,
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                margin: EdgeInsets.all(10),
                shadowColor: Colors.blueGrey,
                elevation: 30,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Material(
                              child: InkWell(
                                onTap: (){
                                     Get.dialog(Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                width: 250,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color:
                                                            Colors.blueAccent)),
                                                child: SingleChildScrollView(
                                                    child: Column(
                                                  children: [
                                                    const Text(
                                                      "Are Sure To Remove?",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              "Pacifico",
                                                          color:
                                                              Colors.blueGrey,
                                                          decoration:
                                                              TextDecoration
                                                                  .none),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Center(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            TextButton(
                                                                onPressed: () {
                                                                  controller.delGroup(g.Id!);
                                                                  // controller
                                                                  //     .dellibrary(
                                                                  //         library
                                                                  //             .Id!);
                                                                },
                                                                child:
                                                                    const Text(
                                                                  'Yes',
                                                                  style: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          245,
                                                                          146,
                                                                          149)),
                                                                )),
                                                            TextButton(
                                                                onPressed: () {
                                                                  Get.back();
                                                                },
                                                                child:
                                                                    const Text(
                                                                  'No',
                                                                  style: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          245,
                                                                          146,
                                                                          149)),
                                                                )),
                                                          ],
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )))));
                                },
                                  child: Icon(
                            Icons.close,
                            size: 16,
                          ))),
                        ),
                      ),
                      Row(
                        children: [
                         url == null
                        ? Image.asset(
                            'assets/images/1.png',
                            width: screen.width,
                            fit: BoxFit.fill,
                          )
                        : Utility.imageFromBase64String(
                            Utility.base64String(
                                url),
                            screen.width,
                            null),
                          SizedBox(
                            width: 23,
                          ),
                          Text(
                            name,
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                        ],
                      )
                      // Flexible(
                      //      child: new Text(discribtion,style: TextStyle(fontSize: 18))),
                    ])),
          ),
        ),
      ),
    );
  }

  Widget BuildcontentGroup(String txt) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        width: 90,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1.3,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          txt,
          style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(
                255,
                246,
                123,
                127,
              ),
              decoration: TextDecoration.none),
        )),
      ),
    );
  }
}
