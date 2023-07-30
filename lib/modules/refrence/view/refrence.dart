import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/model/refrence.dart';
import '../controller/refrence_controller.dart';

class RefrencePageView extends GetResponsiveView<RerenceController> {
  RerenceController controller = Get.put(RerenceController());
  @override
  Widget builder() {
    return Container(
        height: 600,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              children: [
                Material(
                  child: InkWell(
                    onTap: () => Get.back(),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_back_ios,
                            size: 17, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(96, 8, 8, 8),
                  child: Center(
                    child: Text('All Refrenceses',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            color: Colors.blueGrey,
                            fontFamily: "Pacifico")),
                  ),
                ),
              ],
            ),
            // Column(
            //     children: controller.refrences.map((e) => shap22(e)).toList()),
            Column(
              children: controller.ListRefrence.map(
                  (e) => shap22(e.content.toString(), e)).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Tooltip(
                  message: 'Add To Refrence',
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 246, 123, 127),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(126)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 17, horizontal: 17)),
                        onPressed: () {
                          Get.dialog(Align(
                              alignment: Alignment.center,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                width: 400,
                                height: 330,
                                child: SingleChildScrollView(
                                  child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Text(
                                        " Add To Refrence  ",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Pacifico",
                                            color: Colors.blueGrey,
                                            decoration: TextDecoration.none),
                                      ),
                                    ),
                                    Material(
                                      child: Padding(
                                        padding: const EdgeInsets.all(6),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 194, 192, 192)),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: GFAccordion(
                                              title: "Type Refrence",
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Color.fromARGB(
                                                      255, 246, 123, 127),
                                                  decoration:
                                                      TextDecoration.none),
                                              contentChild: Column(
                                                children: controller.ListRefrence
                                                    .map((element) => Container(
                                                        decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        194,
                                                                        192,
                                                                        192)),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: TextButton(
                                                          onPressed: () {
                                                            controller.Addrefrence.value.content=element.content;
                                                          },
                                                          child: Text(
                                                            element.content
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .black54,
                                                                decoration:
                                                                    TextDecoration
                                                                        .none),
                                                          ),
                                                        ))).toList(),
                                              )),
                                        ),
                                      ),
                                    ),
                                    Material(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          width: 350,
                                          height: 60,
                                          child: TextFormField(
                                            decoration: const InputDecoration(
                                              labelText: 'Add NameRefrence',
                                              labelStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 246, 123, 127),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            onChanged: (value) {
                                            controller.Addrefrence.value.referenceName=value;   
                                              // controller.addBookType.value.bookType =
                                              //     value;
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    Material(
                                      child: Container(
                                        width: 350,
                                        height: 60,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Add Link',
                                            labelStyle: TextStyle(
                                                color: Colors.black45,
                                                fontWeight: FontWeight.bold),
                                            prefixIcon: Icon(
                                              Icons.text_fields,
                                              color: Color.fromARGB(
                                                  255, 245, 146, 149),
                                            ),
                                          ),
                                          keyboardType: TextInputType.multiline,
                                          minLines:
                                              1, //Normal textInputField will be displayed
                                          maxLines:
                                              5, // when user presses enter it will adapt to it
                                          onChanged: (value) {
                                             controller.Addrefrence.value.Link=value;   
                                          },
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: GFButton(
                                        onPressed: () {
                                          controller.AddRefrence();
                                          // controller.AddBookType(
                                          //     controller.addBookType.value);
                                        },
                                        text: "Added",
                                        color: Colors.blueGrey,
                                        shape: GFButtonShape.pills,
                                      ),
                                    ),
                                  ]),
                                ),
                              )));
                        },
                        child: Text('Add To Refrence'),
                      ),
                    ),
                  ),
                ),
                Tooltip(
                  message: 'Add New Refrence',
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 246, 123, 127),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(126)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 17, horizontal: 17)),
                        onPressed: () {
                          Get.dialog(Align(
                              alignment: Alignment.center,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                width: 400,
                                height: 200,
                                child: Column(children: [
                                  const Text(
                                    " Add New Refrence  ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Pacifico",
                                        color: Colors.blueGrey,
                                        decoration: TextDecoration.none),
                                  ),
                                  Material(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 350,
                                        height: 60,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            labelText: 'Add Refrence',
                                            labelStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 246, 123, 127),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onChanged: (value) {
                                            controller.Addrefrence.value.content!.typeName=value;
                                            // controller.addBookType.value.bookType =
                                            //     value;
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: GFButton(
                                      onPressed: () {
                                        controller.AddRefrence();
                                        // controller.AddBookType(
                                        //     controller.addBookType.value);
                                      },
                                      text: "Added",
                                      color: Colors.blueGrey,
                                      shape: GFButtonShape.pills,
                                    ),
                                  ),
                                ]),
                              )));
                        },
                        child: Text('Add Refrence'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        )));
  }

  Widget shap22(String title, Reference e) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 194, 192, 192)),
              borderRadius: BorderRadius.circular(10)),
          child: GFAccordion(
            title: title,
            textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color.fromARGB(255, 246, 123, 127),
                decoration: TextDecoration.none),
            contentChild: Column(
                children: controller.ListRefrenceLink.map(
              (e) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          e.referenceName.toString(),
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ),
                      // IconButton(
                      //     onPressed: () {
                      //       Get.dialog(Align(
                      //           alignment: Alignment.center,
                      //           child: Container(
                      //               width: 220,
                      //               height: 120,
                      //               decoration: BoxDecoration(
                      //                   color: Colors.white,
                      //                   borderRadius: BorderRadius.circular(10),
                      //                   border: Border.all(
                      //                       color: Colors.blueAccent)),
                      //               child: SingleChildScrollView(
                      //                   child: Column(
                      //                 children: [
                      //                   const Text(
                      //                     "Are Sure To Remove?",
                      //                     style: TextStyle(
                      //                         fontSize: 18,
                      //                         fontWeight: FontWeight.bold,
                      //                         fontFamily: "Pacifico",
                      //                         color: Colors.blueGrey,
                      //                         decoration: TextDecoration.none),
                      //                   ),
                      //                   Padding(
                      //                     padding: const EdgeInsets.all(8.0),
                      //                     child: Center(
                      //                       child: Row(
                      //                         mainAxisAlignment:
                      //                             MainAxisAlignment.center,
                      //                         children: [
                      //                           TextButton(
                      //                               onPressed: () {
                      //                                 controller.DelRefrence
                      //                                     .value.Id = e.Id;
                      //                                 controller.DelRefrence
                      //                                     .value.Link = e.Link;
                      //                                 controller
                      //                                         .DelRefrence
                      //                                         .value
                      //                                         .referenceName =
                      //                                     e.referenceName;
                      //                                 controller.DeleRefrence();
                      //                               },
                      //                               child: const Text(
                      //                                 'Yes',
                      //                                 style: TextStyle(
                      //                                     color: Color.fromARGB(
                      //                                         255,
                      //                                         245,
                      //                                         146,
                      //                                         149)),
                      //                               )),
                      //                           TextButton(
                      //                               onPressed: () {
                      //                                 Get.back();
                      //                               },
                      //                               child: const Text(
                      //                                 'No',
                      //                                 style: TextStyle(
                      //                                     color: Color.fromARGB(
                      //                                         255,
                      //                                         245,
                      //                                         146,
                      //                                         149)),
                      //                               )),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   )
                      //                 ],
                      //               )))));
                      //     },
                      //     icon: Icon(
                      //       Icons.delete,
                      //       color: Color.fromARGB(255, 184, 183, 183),
                      //     ))
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      e.Link.toString(),
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.none,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ).toList()),
          ),
        ),
      ),
    );
  }

  // Widget shap(String title, Reference e) {
  //   return Material(
  //     child: Padding(
  //       padding: const EdgeInsets.all(6),
  //       child: Container(
  //         decoration: BoxDecoration(
  //             border: Border.all(color: Color.fromARGB(255, 194, 192, 192)),
  //             borderRadius: BorderRadius.circular(10)),
  //         child: GFAccordion(
  //           title: title,
  //           textStyle: TextStyle(
  //               fontWeight: FontWeight.bold,
  //               fontSize: 20,
  //               color: Color.fromARGB(255, 246, 123, 127),
  //               decoration: TextDecoration.none),
  //           contentChild: Column(
  //               //////////we need list link
  //               children: controller.ListRefrenceLink.map((e) => InkWell(
  //                   onTap: () async {
  //                     // final url = e;
  //                     if (await canLaunch(e.Link.toString())) {
  //                       await launch(
  //                        e.Link.toString(),
  //                         //  forceSafariVC: false,
  //                       );
  //                     }
  //                   },
  //                   child: Align(
  //                     alignment: Alignment.topLeft,
  //                     child: Text(
  //                       e,
  //                       style: TextStyle(
  //                           color: Colors.blue,
  //                           decoration: TextDecoration.none,
  //                           fontSize: 17,
  //                           fontWeight: FontWeight.bold),
  //                     ),
  //                   ))).toList()),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
