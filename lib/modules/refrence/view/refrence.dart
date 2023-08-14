import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../../app/model/content.dart';
import '../../../app/model/refrence.dart';
import '../controller/refrence_controller.dart';

class RefrencePageView extends GetResponsiveView<RerenceController> {
  @override
  RerenceController controller = Get.put(RerenceController());
  final _formfield = GlobalKey<FormState>();

  RefrencePageView({super.key});
  @override
  Widget builder() {
    return SizedBox(
        height: 600,
        child: SingleChildScrollView(
            child: Form(
          key: _formfield,
          child: Column(
            children: [
              Row(
                children: [
                  Material(
                    child: InkWell(
                      onTap: () => Get.back(),
                      child: const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_back_ios,
                              size: 17, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(96, 8, 8, 8),
                    child: Center(
                      child: Text('AllRefrenceses'.tr,
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              color: Color.fromARGB(255, 42, 42, 114),
                              fontFamily: "Pacifico")),
                    ),
                  ),
                ],
              ),
              // Column(
              //     children: controller.refrences.map((e) => shap22(e)).toList()),
              Obx(() => Column(
                    children:
                        controller.contenst.map((e) => shap22(e)).toList(),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tooltip(
                    message: 'AddToRefrence'.tr,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 246, 123, 127),
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
                                        child: Text(
                                          "AddToRefrence".tr,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Pacifico",
                                              color: Color.fromARGB(
                                                  255, 42, 42, 114),
                                              decoration: TextDecoration.none),
                                        ),
                                      ),
                                      Material(
                                        child: Padding(
                                          padding: const EdgeInsets.all(6),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color.fromARGB(
                                                        255, 194, 192, 192)),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: GFAccordion(
                                                title: "TypeRefrence".tr,
                                                textStyle: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                    color: Color.fromARGB(
                                                        255, 246, 123, 127),
                                                    decoration:
                                                        TextDecoration.none),
                                                contentChild: Column(
                                                  children: controller.contenst
                                                      .map(
                                                        (element) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  8, 8, 8, 8),
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              controller
                                                                      .Addrefrence
                                                                      .value
                                                                      .content =
                                                                  element;
                                                            },
                                                            style: ElevatedButton.styleFrom(
                                                                backgroundColor:
                                                                    const Color
                                                                            .fromARGB(
                                                                        255,
                                                                        42,
                                                                        42,
                                                                        114),
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30)),
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        20,
                                                                    horizontal:
                                                                        50)),
                                                            child: Text(
                                                              element.typeName!
                                                                  .toString(),
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .white,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none),
                                                            ),
                                                          ),
                                                        ),
                                                        // child: TextButton(
                                                        //   onPressed: () {

                                                        //   },
                                                        //   child:

                                                        // )
                                                      )
                                                      .toList(),
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
                                              decoration: InputDecoration(
                                                labelText: 'AddNameRefrence'.tr,
                                                labelStyle: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 246, 123, 127),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              validator: (value) {
                                                if (value!.isEmpty ||
                                                    !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]")
                                                        .hasMatch(value)) {
                                                  return "EnterCorrectText".tr;
                                                } else {
                                                  return null;
                                                }
                                              },
                                              onChanged: (value) {
                                                controller.Addrefrence.value
                                                    .referenceName = value;
                                                // controller.addBookType.value.bookType =
                                                //     value;
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: SizedBox(
                                          width: 350,
                                          height: 60,
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value!.isEmpty ||
                                                  !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]")
                                                      .hasMatch(value)) {
                                                return "EnterCorrectText".tr;
                                              } else {
                                                return null;
                                              }
                                            },

                                            decoration: InputDecoration(
                                              labelText: 'AddLink'.tr,
                                              labelStyle: const TextStyle(
                                                  color: Colors.black45,
                                                  fontWeight: FontWeight.bold),
                                              prefixIcon: const Icon(
                                                Icons.text_fields,
                                                color: Color.fromARGB(
                                                    255, 245, 146, 149),
                                              ),
                                            ),

                                            keyboardType:
                                                TextInputType.multiline,
                                            minLines:
                                                1, //Normal textInputField will be displayed
                                            maxLines:
                                                5, // when user presses enter it will adapt to it
                                            onChanged: (value) {
                                              controller.Addrefrence.value
                                                  .Link = value;
                                            },
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: GFButton(
                                          onPressed: () {
                                            if (_formfield.currentState!
                                                .validate()) {
                                              print("Data Added Successfully");
                                            }
                                            controller.AddRefrence();
                                            // controller.AddBookType(
                                            //     controller.addBookType.value);
                                          },
                                          text: "Added".tr,
                                          color: const Color.fromARGB(
                                              255, 42, 42, 114),
                                          shape: GFButtonShape.pills,
                                        ),
                                      ),
                                    ]),
                                  ),
                                )));
                          },
                          child: Text(
                            "AddToRefrence".tr,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Tooltip(
                    message: 'AddNewRefrence'.tr,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 246, 123, 127),
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
                                    Text(
                                      'AddNewRefrence'.tr,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Pacifico",
                                          color:
                                              Color.fromARGB(255, 42, 42, 114),
                                          decoration: TextDecoration.none),
                                    ),
                                    Material(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          width: 350,
                                          height: 60,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              labelText: 'AddRefrence'.tr,
                                              labelStyle: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 246, 123, 127),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            onChanged: (value) {
                                              controller.valuetext.value =
                                                  value;
                                              controller.Addrefrence.value
                                                  .content!.typeName = value;
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
                                          if (controller.valuetext.value ==
                                              null) {
                                            Get.snackbar(
                                              'Error'.tr,
                                              "PleaseInputValue".tr,
                                              icon: const Icon(Icons.person,
                                                  color: Colors.white),
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 246, 123, 127),
                                              borderRadius: 20,
                                              margin: const EdgeInsets.all(15),
                                              colorText: Colors.white,
                                              duration:
                                                  const Duration(seconds: 4),
                                              isDismissible: true,
                                              forwardAnimationCurve:
                                                  Curves.easeOutBack,
                                            );
                                          } else {
                                            controller.AddRefrence();
                                          }

                                          // controller.AddBookType(
                                          //     controller.addBookType.value);
                                        },
                                        text: "Added".tr,
                                        color: const Color.fromARGB(
                                            255, 42, 42, 114),
                                        shape: GFButtonShape.pills,
                                      ),
                                    ),
                                  ]),
                                )));
                          },
                          child: Text('AddRefrence'.tr),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Material(
                child: Tooltip(
                  message: 'HelpAboutPage'.tr,
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
                                      border:
                                          Border.all(color: Colors.blueAccent)),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Help".tr,
                                                  style: const TextStyle(
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
                                                controller.textallrefrence,
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
                          icon: const Icon(
                            Icons.help_outline_outlined,
                            size: 30,
                            color: Color.fromARGB(255, 246, 123, 127),
                          )),
                    ),
                  ),
                ),
              )
            ],
          ),
        )));
  }

  Widget shap22(Content r) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Container(
          decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 194, 192, 192)),
              borderRadius: BorderRadius.circular(10)),
          child: Material(
            child: InkWell(
              onTap: () {
                controller.getRefrence(r.Id!);
              },
              child: GFAccordion(
                title: r.typeName!,
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 246, 123, 127),
                    decoration: TextDecoration.none),
                contentChild: Column(
                    children:
                        controller.ListRefrenceLink.map((element) => Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        element.referenceName.toString(),
                                        style: const TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: InkWell(
                                    onTap: () {
                                      js.context
                                          .callMethod('open', [element.Link!]);
                                    },
                                    child: Text(
                                      element.Link.toString(),
                                      style: const TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.none,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            )).toList()),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
