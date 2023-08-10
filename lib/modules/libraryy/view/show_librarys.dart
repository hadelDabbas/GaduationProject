import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:graduationproject/modules/libraryy/view/library.dart';

import '../../../app/model/library.dart';
import '../../settings/view/settings.dart';
import '../controller/library_controller.dart';

class ShowLibraryspage extends GetResponsiveView<LibraryContrller> {
  final _formfield = GlobalKey<FormState>();
  List<String> namelibrary = [
    ' Al Tourath',
    ' Al Arabi',
    ' Al Quraa',
    ' Al Hadara'
  ];

  ShowLibraryspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Form(
            key: _formfield,
            child: Column(children: [
                  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Material(
                    child: InkWell(
                      onTap: () => Get.to(SettingPageView()),
                      child: const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_back_ios,
                              size: 20, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        " Librarays  ",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Pacifico",
                            color: Color.fromARGB(255, 42, 42, 114),
                            decoration: TextDecoration.none),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      width: 90,
                      height: 90,
                      child: Image.asset("assets/images/doda.png"),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      width: 90,
                      height: 90,
                      child: Image.asset("assets/images/book3.png"),
                    ),
                  ),
                ],
              ),
            ],
                  ),
                  Obx(() => Wrap(
                children: controller.listLibrary
                    .map((e) => shapelibrarycard(context, e))
                    .toList(),
              )),
                  Tooltip(
            message: 'Help About Page',
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    onPressed: () {
                      Get.dialog(Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.blueAccent)),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: const Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Help",
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Pacifico",
                                                color: Color.fromARGB(
                                                    255, 42, 42, 114),
                                                decoration: TextDecoration.none),
                                          ),
                                        )),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 8, 10, 10),
                                    child: Column(
                                      children: <Widget>[
                                        new Text(
                                          controller.textshowlibrary,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 18,
                                              decoration: TextDecoration.none,
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
                    icon: Icon(
                      Icons.help_outline_outlined,
                      size: 30,
                      color: Color.fromARGB(255, 246, 123, 127),
                    )),
              ),
            ),
                  )
                ]),
          )),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Get.dialog(Align(
                alignment: Alignment.center,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blueAccent)),
                  width: 400,
                  height: 250,
                  child: Column(children: [
                    const Text(
                      " Add New Librarays  ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Pacifico",
                          color: Color.fromARGB(255, 42, 42, 114),
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
                              icon: Icon(
                                Icons.library_books,
                                color: Color.fromARGB(255, 246, 123, 127),
                              ),
                              labelText: 'Add Library Name',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 246, 123, 127),
                                  fontWeight: FontWeight.bold),
                            ),
                               validator: (value) {
                  // for number
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "Enter Correct Name";
                  } else {
                    return null;
                  }
                },
                            onChanged: (value) {
                              controller.Addlibrary.value.libraryName = value;
                            },
                          ),
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
                              icon: Icon(
                                Icons.location_on,
                                color: Color.fromARGB(255, 246, 123, 127),
                              ),
                              labelText: 'Add Library Postion',
                              labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 246, 123, 127),
                                  fontWeight: FontWeight.bold),
                            ),
                               validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "Enter Correct Adress";
                  } else {
                    return null;
                  }
                },
                            onChanged: (value) {
                              controller.Addlibrary.value.libraryAddress =
                                  value;
                            },
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: GFButton(
                        onPressed: () {
                                   if (_formfield.currentState!.validate()) {
                  print("Data Added Successfully");
                          controller.addLibrary(controller.Addlibrary.value);
                        }},
                        text: "Added",
                        color: Color.fromARGB(255, 42, 42, 114),
                        shape: GFButtonShape.pills,
                      ),
                    ),
                    Tooltip(
                      message: 'Help About Page',
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                              onPressed: () {
                                Get.dialog(Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                              color: Colors.blueAccent)),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: const Align(
                                                  alignment: Alignment.center,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Text(
                                                      "Help",
                                                      style: TextStyle(
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              "Pacifico",
                                                          color: Color.fromARGB(
                                                              255, 42, 42, 114),
                                                          decoration:
                                                              TextDecoration
                                                                  .none),
                                                    ),
                                                  )),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 8, 10, 10),
                                              child: Column(
                                                children: <Widget>[
                                                  new Text(
                                                    controller.addlibrary,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        decoration:
                                                            TextDecoration.none,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                              icon: Icon(
                                Icons.help_outline_outlined,
                                size: 30,
                                color: Color.fromARGB(255, 246, 123, 127),
                              )),
                        ),
                      ),
                    )
                  ]),
                )));
          }),
    );
  }

  Widget shapelibrarycard(BuildContext context, Library library) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
      child: Material(
        child: InkWell(
          onTap: () {
            controller.IdLibrary.value = library.Id!;
            controller.Newlibrary.value = library;
            Get.to(Librarypage());
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.0),
                border: Border.all(color: Color.fromARGB(255, 42, 42, 114))),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                elevation: 10.0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 6,
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              library.libraryName!,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                  decoration: TextDecoration.none),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              /////// /////////////////////////////////////// ////update library
                              Tooltip(
                                message: 'Edit Library',
                                child: IconButton(
                                    onPressed: () {
                                      Get.dialog(Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          width: 400,
                                          height: 300,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.blueAccent)),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Align(
                                                    alignment: Alignment.center,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Text(
                                                        "Update Library ",
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                "Pacifico",
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    42,
                                                                    42,
                                                                    114),
                                                            decoration:
                                                                TextDecoration
                                                                    .none),
                                                      ),
                                                    )),
                                                Material(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: SizedBox(
                                                      width: 350,
                                                      height: 40,
                                                      child: TextFormField(
                                                           initialValue: library
                                                              .libraryName!,
                                                        //   controller:name.toString() ,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: library
                                                              .libraryName!,
                                                          labelStyle:
                                                              const TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          246,
                                                                          123,
                                                                          127),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        onChanged: (value) {
                                                          controller
                                                                  .updatelibrary
                                                                  .value
                                                                  .libraryName =
                                                              value;
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Material(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: SizedBox(
                                                      width: 350,
                                                      height: 60,
                                                      child: TextFormField(
                                                        initialValue:library
                                                              .libraryAddress! ,
                                                        decoration:

                                                            InputDecoration(
                                                          labelText: library
                                                              .libraryAddress!,
                                                          labelStyle:
                                                              const TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          246,
                                                                          123,
                                                                          127),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                        ),
                                                        onChanged: (value) {
                                                          controller
                                                                  .updatelibrary
                                                                  .value
                                                                  .libraryAddress =
                                                              value;
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 90,
                                                      child: Image.asset(
                                                          'assets/images/book2.png'),
                                                    ),
                                                    const SizedBox(
                                                      width: 80,
                                                    ),
                                                    GFButton(
                                                      shape:
                                                          GFButtonShape.pills,
                                                      color: Color.fromARGB(
                                                          255, 42, 42, 114),
                                                      onPressed: () async {
                                                        controller
                                                            .updatelibrary
                                                            .value
                                                            .libraryName = controller
                                                                .updatelibrary
                                                                .value
                                                                .libraryName ??
                                                            library
                                                                .libraryName!;
                                                        controller
                                                            .updatelibrary
                                                            .value
                                                            .libraryAddress = controller
                                                                .updatelibrary
                                                                .value
                                                                .libraryAddress ??
                                                            library
                                                                .libraryAddress!;
                                                        controller
                                                            .updatelibrary
                                                            .value
                                                            .Id = library.Id;
                                                        await controller
                                                            .UpdateLibrary(
                                                                library.Id!);
                                                        Get.snackbar(
                                                          ' Ok ',
                                                          "Saved Data ",
                                                          //  icon: Icon(Icons.person, color: Colors.white),
                                                          snackPosition:
                                                              SnackPosition
                                                                  .BOTTOM,
                                                          backgroundColor:
                                                              const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  209,
                                                                  143,
                                                                  143),
                                                          borderRadius: 20,
                                                          margin:
                                                              const EdgeInsets
                                                                  .all(15),
                                                          colorText:
                                                              Colors.white,
                                                          duration:
                                                              const Duration(
                                                                  seconds: 4),
                                                          isDismissible: true,
                                                          //  dismissDirection: SnackDismissDirection.HORIZONTAL,
                                                          forwardAnimationCurve:
                                                              Curves
                                                                  .easeOutBack,
                                                        );
                                                      },
                                                      text: "Save",
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                  ],
                                                ),
                                                Tooltip(
                                                  message: 'Help About Page',
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.bottomRight,
                                                      child: IconButton(
                                                          onPressed: () {
                                                            Get.dialog(Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(8.0),
                                                              child: Align(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child:
                                                                    Container(
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20),
                                                                      border: Border.all(
                                                                          color:
                                                                              Colors.blueAccent)),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        const SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(8.0),
                                                                          child: const Align(
                                                                              alignment: Alignment.center,
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(8.0),
                                                                                child: Text(
                                                                                  "Help",
                                                                                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, fontFamily: "Pacifico", color: Color.fromARGB(255, 42, 42, 114), decoration: TextDecoration.none),
                                                                                ),
                                                                              )),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.fromLTRB(
                                                                              10,
                                                                              8,
                                                                              10,
                                                                              10),
                                                                          child:
                                                                              Column(
                                                                            children: <Widget>[
                                                                              new Text(
                                                                                controller.textupdatelibrary,
                                                                                textAlign: TextAlign.left,
                                                                                style: TextStyle(fontSize: 18, decoration: TextDecoration.none, fontWeight: FontWeight.bold, color: Colors.black87),
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
                                                          icon: Icon(
                                                            Icons
                                                                .help_outline_outlined,
                                                            size: 30,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    246,
                                                                    123,
                                                                    127),
                                                          )),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ));
                                    },
                                    icon: const Icon(
                                      Icons.edit,
                                      color: Color.fromARGB(255, 245, 146, 149),
                                    )),
                              ),
                              ////////////////////////////////////////delete library
                              Align(
                                alignment: Alignment.topRight,
                                child: Tooltip(
                                  message: 'delete Library',
                                  child: IconButton(
                                      onPressed: () {
                                        Get.dialog(Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                width: 200,
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
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              "Pacifico",
                                                          color: Color.fromARGB(
                                                              255, 42, 42, 114),
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
                                                                  controller
                                                                      .dellibrary(
                                                                          library
                                                                              .Id!);
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
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.black54,
                                      )),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.add_location_sharp,
                            color: Color.fromARGB(255, 245, 146, 149),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            library.libraryAddress!,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ],
                    )
                  ]),
                )),
          ),
        ),
      ),
    );
  }
}
