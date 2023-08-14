import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:graduationproject/modules/icons/Icon.dart';
import 'package:graduationproject/modules/libraryy/controller/library_controller.dart';

import '../../../app/model/book.dart';
import '../../../app/model/booklibrary.dart';
import '../../../app/model/buy_book.dart';
import '../../genereted/sheard/util.dart';
import '../../sheard/text_feild_GP.dart';
import 'AddBook.dart';
import 'updatebook.dart';

class Librarypage extends GetResponsiveView<LibraryContrller> {
  final _formfield = GlobalKey<FormState>();

  Librarypage({super.key});

  @override
  Widget build(BuildContext context) {
    var accessLib = controller.access
        .where((element) => element.object!.id == controller.IdLibrary.value)
        .first
        .accessibility;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 42, 42, 114),
        title: Center(
          child: Text(
            controller.Newlibrary.value.libraryName.toString(),
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico",
                color: Colors.white,
                decoration: TextDecoration.none),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formfield,
          child: Column(
            children: [
              Container(
                child: Row(children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: 450,
                          child: TextField(
                              decoration: InputDecoration(
                                  labelText: 'search'.tr,
                                  labelStyle: const TextStyle(
                                      color: Color.fromARGB(255, 184, 183, 183),
                                      fontWeight: FontWeight.bold),
                                  hintText: 'search'.tr,
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: Color.fromARGB(255, 245, 146, 149),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3,
                                        color:
                                            Color.fromARGB(255, 245, 146, 149)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3,
                                        color:
                                            Color.fromARGB(255, 245, 146, 149)),
                                    borderRadius: BorderRadius.circular(15),
                                  )))),
                    ),
                  )
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextCategory('Authour'.tr),
                  TextCategory('Category'.tr),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Obx(() => Wrap(
                      children: controller.Booklist.map(
                          (element) => shapCard(element)).toList())
                  //     [
                  //   shapCard('Ali Najm', 'بالنيابة عنهم', 'assets/images/ali1.png',
                  //       '700\$', controller),
                  //   shapCard('Ahmad Shokari', 'اربعون', 'assets/images/ahmad1.png',
                  //       '1000\$', controller),
                  //   shapCard('Ahlam Mastganmi', 'فوضى الحواس',
                  //       'assets/images/ahlam2.png', '600\$', controller),
                  //   shapCard('Ahlam Mastganmi', 'الاسود يليق بك',
                  //       'assets/images/ahlam1.png', '1000\$', controller),
                  //   shapCard('Ahmad Shokari', 'رحلتي مع غاندي',
                  //       'assets/images/ahmad2.png', '300\$', controller),
                  //   shapCard('Ali Najm', 'خيال', 'assets/images/ali3.png', '500\$',
                  //       controller),
                  //   shapCard('Ali Najm', 'زحمه حكي', 'assets/images/ali2.png',
                  //       '900\$', controller),
                  // ],
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shadowColor:
                                  const Color.fromARGB(255, 42, 42, 114),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              shape: const CircleBorder(),
                              backgroundColor:
                                  const Color.fromARGB(255, 245, 146, 149)),
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
                                  height: 260,
                                  child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "infobuy".tr,
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
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                            width: 350,
                                            height: 60,
                                            child: TextFieldGPWidget(
                                              obscureText: false,
                                              type: TextInputType.text,
                                              label: 'InputLocation'.tr,
                                              validator: (value) {
                                                if (value!.isEmpty ||
                                                    !RegExp(r'^[a-z A-Z]+$')
                                                        .hasMatch(value)) {
                                                  return "EnterCorrectAdress"
                                                      .tr;
                                                } else {
                                                  return null;
                                                }
                                              },
                                              prefIcon: Icons.location_on,
                                              onChanged: (value) {
                                                controller.buybook.value
                                                    .address = value;
                                              },
                                            )),
                                      ),
                                    ),
                                    Material(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                            width: 350,
                                            height: 60,
                                            child: TextFieldGPWidget(
                                              obscureText: false,
                                              type: TextInputType.text,
                                              label: 'InputPayBal'.tr,
                                              validator: (value) {
                                                if (value!.isEmpty ||
                                                    !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]")
                                                        .hasMatch(value)) {
                                                  return "EnterCorrectPaybal"
                                                      .tr;
                                                } else {
                                                  return null;
                                                }
                                              },
                                              prefIcon: Icons.money,
                                              onChanged: (value) {
                                                if (controller
                                                        .user.value.Paypal ==
                                                    value) {
                                                  controller.staute.value = 'A';
                                                } else {
                                                  controller.staute.value = 'B';
                                                }
                                                value;
                                              },
                                            )),
                                      ),
                                    ),
                                    Center(
                                      child: GFButton(
                                        onPressed: () {
                                          if (_formfield.currentState!
                                              .validate()) {
                                            print("Data Added Successfully");

                                            if (controller.staute.value ==
                                                'A') {
                                              Get.back();
                                              Baket();
                                            } else {
                                              Get.snackbar(
                                                'Error'.tr,
                                                "SureFromPayBal".tr,
                                                //  icon: Icon(Icons.person, color: Colors.white),
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 246, 123, 127),
                                                borderRadius: 20,
                                                margin:
                                                    const EdgeInsets.all(15),
                                                colorText: Colors.white,
                                                duration:
                                                    const Duration(seconds: 4),
                                                isDismissible: true,
                                                //  dismissDirection: SnackDismissDirection.HORIZONTAL,
                                                forwardAnimationCurve:
                                                    Curves.easeOutBack,
                                              );
                                            }
                                          }
                                          //Get.back();
                                        },
                                        text: "Input".tr,
                                        color: const Color.fromARGB(
                                            255, 42, 42, 114),
                                        shape: GFButtonShape.pills,
                                      ),
                                    ),
                                  ]),
                                )));
                          },
                          child: const Icon(
                            AppIconn.shopping_cart,
                            color: Colors.white,
                            size: 25,
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: const Color.fromARGB(255, 42, 42, 114),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            shape: const CircleBorder(),
                            backgroundColor:
                                const Color.fromARGB(255, 245, 146, 149)),
                        onPressed: accessLib!.id == 1 || accessLib.id == 2
                            ? () {
                                Get.dialog(Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 450,
                                    height: 500,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.blueAccent)),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "AddBook".tr,
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
                                          Container(
                                            child: Addbookpage22(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                              }
                            : null,
                        child: const Icon(
                          Icons.bookmark_add,
                          color: Colors.white,
                          size: 25,
                        )),
                  )
                ],
              ),
              Tooltip(
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
                                                    fontWeight: FontWeight.bold,
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
                                              controller.textlibrary,
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget TextCategory(String name) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.focused)) return Colors.red;
          if (states.contains(MaterialState.hovered)) {
            return const Color.fromARGB(255, 246, 123, 127);
          }
          if (states.contains(MaterialState.pressed)) return Colors.blue;
          return Colors.blueGrey; // null throus error in flutter 2.2+.
        }),
      ),
      onPressed: () {
        Get.dialog(Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: const Color.fromARGB(255, 42, 42, 114), width: 3)),
            width: 300,
            height: 300,
            child: SingleChildScrollView(
              child: Column(children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 24,
                      fontFamily: "Pacifico",
                      color: Color.fromARGB(255, 246, 123, 127),
                      decoration: TextDecoration.none),
                ),
                name == "BookType"
                    ? Column(
                        children: controller.Booktype.map((e) =>
                                buildItem(e.bookType.toString(), e.id!, 'B'))
                            .toList(),
                      )
                    : Column(
                        children: controller.AllAutour.map((e) =>
                                buildItem(e.writerName.toString(), e.id!, 'A'))
                            .toList(),
                      )
              ]),
            ),
          ),
        ));
      },
      child: Text(name,
          style: const TextStyle(
              fontSize: 18,
              fontFamily: "Pacifico",
              fontWeight: FontWeight.bold)),
    );
  }
  //  Widget BookCard(){

  //  }
  Widget shapCard(Book d) {
    var accessLib = controller.access
        .where((element) => element.object!.id == controller.IdLibrary.value)
        .first
        .accessibility;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: InkWell(
        onTap: () {
          // controller.getIdBookLibrary(d.id!, controller.IdLibrary.value);
          Get.dialog(Align(
            alignment: Alignment.center,
            child: Container(
              width: 450,
              height: 350,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueAccent)),
              ////////here item book
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'NameBook'.tr,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Pacifico",
                                      color: Color.fromARGB(255, 42, 42, 114),
                                      decoration: TextDecoration.none),
                                ),
                                Text(
                                  d.bookName ?? '',
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Pacifico",
                                      color: Colors.black54,
                                      decoration: TextDecoration.none),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Price'.tr,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Pacifico",
                                      color: Color.fromARGB(255, 42, 42, 114),
                                      decoration: TextDecoration.none),
                                ),
                                Text('${d.bookPrice!}\$',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                        decoration: TextDecoration.none)),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('nu'.tr,
                          style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 42, 42, 114),
                              decoration: TextDecoration.none,
                              fontFamily: "Pacifico")),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 200,
                        ),
                        Obx(
                          () => Center(
                              child: Text(
                            // controller.buybook.value.Count.toString(),
                            controller.valuepice.value.toString(),
                            style: const TextStyle(
                              fontSize: 23,
                              color: Colors.black54,
                              decoration: TextDecoration.none,
                            ),
                          )),
                        ),
                        Text('pice'.tr,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black54,
                              decoration: TextDecoration.none,
                            ))
                      ],
                    ),
                    Center(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 185,
                          ),
                          Material(
                              child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Color.fromARGB(255, 246, 123, 127),
                            ),
                            onPressed: () {
                              if (controller.valuepice.value < 21) {
                                controller.valuepice.value += 1;
                              }
                            },
                          )),
                          Material(
                              child: IconButton(
                            icon: const Icon(
                              Icons.remove,
                              color: Color.fromARGB(255, 246, 123, 127),
                            ),
                            onPressed: () {
                              if (controller.valuepice.value > 0) {
                                controller.valuepice.value -= 1;
                              }
                            },
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            var price =
                                (d.bookPrice! * controller.valuepice.value);
                            controller.buybook.value.Count =
                                controller.valuepice.value;
                            controller.buybook.value.price =
                                double.parse(price.toString());
                            controller.buybook.value.bookLibrary = BookLibrary(
                              IdBook: d.id,
                              book: d,
                              IdLibrary: controller.IdLibrary.value,
                            );
                            controller.AddToBuyBooktempority(
                                controller.buybook.value);
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 246, 123, 127),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            shape: const CircleBorder(),
                          ),
                          child: const Icon(
                            AppIconn.shopping_cart,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Tooltip(
                      message: 'HelpAboutPage'.tr,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Material(
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
                                                child: Align(
                                                    alignment: Alignment.center,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        "Help".tr,
                                                        style: const TextStyle(
                                                            fontSize: 25,
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
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 8, 10, 10),
                                                child: Column(
                                                  children: <Widget>[
                                                    Text(
                                                      controller.textbook,
                                                      textAlign: TextAlign.left,
                                                      style: const TextStyle(
                                                          fontSize: 18,
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Colors.black87),
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
              ),
            ),
          ));
        },
        /////here bokk outside
        child: Container(
          width: 305,
          decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 42, 42, 114),
                width: 1.3,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(3)),
          child: Column(children: [
            Text(
              d.bookName ?? '',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico",
                  color: Color.fromARGB(255, 42, 42, 114),
                  decoration: TextDecoration.none),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Text(d.bookPrice!.toString(),
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                              decoration: TextDecoration.none)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      /////Update book info
                      Material(
                          child: IconButton(
                              onPressed: accessLib!.id == 1 || accessLib.id == 3
                                  ? () {
                                      controller.currentBook.value = d;
                                      controller.getIdBookWritter(
                                          controller.currentBook.value.id!);
                                      Get.dialog(Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          width: 350,
                                          height: 500,
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
                                                Align(
                                                    alignment: Alignment.center,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        "up".tr,
                                                        style: const TextStyle(
                                                            fontSize: 25,
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
                                                    )),
                                                Container(child: UpdateBook()),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ));
                                    }
                                  : null,
                              icon: const Icon(
                                Icons.edit,
                                color: Color.fromARGB(255, 42, 42, 114),
                              ))),
                      Material(
                          child: IconButton(
                              onPressed: accessLib.id == 1 || accessLib.id == 4
                                  ? () {
                                      Get.dialog(Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                              width: 280,
                                              height: 120,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color:
                                                          Colors.blueAccent)),
                                              child: Column(
                                                children: [
                                                  Center(
                                                    child: Text(
                                                      'AreSureToRemove'.tr,
                                                      style: const TextStyle(
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
                                                  ),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      GFButton(
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 246, 123, 127),
                                                        onPressed: () {
                                                          controller
                                                              .dellBookLibrary(
                                                                  controller
                                                                      .IdLibrary
                                                                      .value,
                                                                  d.id!);
                                                        },
                                                        text: "Delete".tr,
                                                        shape:
                                                            GFButtonShape.pills,
                                                      ),
                                                      const SizedBox(
                                                        width: 2,
                                                      ),
                                                      GFButton(
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 246, 123, 127),
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        text: "Cancle".tr,
                                                        shape:
                                                            GFButtonShape.pills,
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ))));
                                    }
                                  : null,
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ))),
                    ],
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget shapPice(int idlibrarybook, int count, Buybook m) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 400,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color.fromARGB(255, 42, 42, 114))),
        child: Column(
          children: [
            Row(
                children:
                    controller.ListBookLibrary.where(
                            (p0) => p0.Id == idlibrarybook)
                        .map((e) => Row(
                              children: [
                                Row(
                                  children: [
                                    e.book!.bookImage == null
                                        ? Image.asset(
                                            'assets/images/It.png',
                                            width: 80,
                                            height: 80,
                                            fit: BoxFit.fill,
                                          )
                                        : Utility.imageFromBase64String(
                                            Utility.base64String(
                                                e.book!.bookImage!),
                                            80,
                                            80),
                                    // SizedBox(
                                    //   width: 80, height: 80,
                                    //    child: Image.asset(url)),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      e.book!.bookName.toString(),
                                      style: const TextStyle(
                                          fontSize: 18,
                                          decoration: TextDecoration.none,
                                          color:
                                              Color.fromARGB(255, 42, 42, 114)),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        Text('count'.tr,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                decoration: TextDecoration.none,
                                                color: Color.fromARGB(
                                                    255, 42, 42, 114))),
                                        Text(count.toString(),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                decoration: TextDecoration.none,
                                                color: Colors.black54)),
                                        const SizedBox(
                                          width: 40,
                                        ),
                                        Row(
                                          children: [
                                            Material(
                                              child: Tooltip(
                                                message: 'buythem'.tr,
                                                child: IconButton(
                                                    onPressed: () {
                                                      controller.sum.value +=
                                                          (e.book!.bookPrice! *
                                                                  count)
                                                              .toDouble();
                                                      controller
                                                          .AddToBuyBookback(m);
                                                    },
                                                    icon: const Icon(
                                                      Icons.check_box,
                                                      color: Color.fromARGB(
                                                          255, 246, 123, 127),
                                                    )),
                                              ),
                                            ),
                                            Material(
                                              child: Tooltip(
                                                message: 'editcount'.tr,
                                                child: IconButton(
                                                    onPressed: () {
                                                      Get.dialog(Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Container(
                                                              width: 300,
                                                              height: 250,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .blueAccent)),
                                                              child: Column(
                                                                children: [
                                                                  Center(
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Text(
                                                                        'UpdateCount'
                                                                            .tr,
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontFamily:
                                                                                "Pacifico",
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                42,
                                                                                42,
                                                                                114),
                                                                            decoration:
                                                                                TextDecoration.none),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Text(
                                                                      "${'p'.tr}  $count",
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color: Colors
                                                                              .black54,
                                                                          decoration:
                                                                              TextDecoration.none),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: Text(
                                                                      'NewCount'
                                                                          .tr,
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color: Colors
                                                                              .black54,
                                                                          decoration:
                                                                              TextDecoration.none),
                                                                    ),
                                                                  ),
                                                                  Center(
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Material(
                                                                            child:
                                                                                IconButton(
                                                                          icon:
                                                                              const Icon(
                                                                            Icons.add,
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                246,
                                                                                123,
                                                                                127),
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            controller.valuepice.value +=
                                                                                1;
                                                                          },
                                                                        )),
                                                                        Obx(
                                                                          () => Center(
                                                                              child: Text(
                                                                            controller.valuepice.value.toString(),
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 23,
                                                                              color: Colors.black54,
                                                                              decoration: TextDecoration.none,
                                                                            ),
                                                                          )),
                                                                        ),
                                                                        Material(
                                                                            child:
                                                                                IconButton(
                                                                          icon:
                                                                              const Icon(
                                                                            Icons.remove,
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                246,
                                                                                123,
                                                                                127),
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            if (controller.valuepice.value >
                                                                                0) {
                                                                              controller.valuepice.value -= 1;
                                                                            }
                                                                          },
                                                                        )),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      GFButton(
                                                                        color: const Color.fromARGB(
                                                                            255,
                                                                            246,
                                                                            123,
                                                                            127),
                                                                        onPressed:
                                                                            () {
                                                                          // contrller.sum.value -=   (e.book!.bookPrice! * count).toDouble();
                                                                          m.Count = controller
                                                                              .valuepice
                                                                              .value;
                                                                          //  contrller.sum.value +=
                                                                          //  (e.book!.bookPrice! * count).toDouble();
                                                                          // contrller.UpdateBuyBook(m);
                                                                        },
                                                                        text: "Save"
                                                                            .tr,
                                                                        shape: GFButtonShape
                                                                            .pills,
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            4,
                                                                      ),
                                                                      // GFButton(
                                                                      //   color: const Color.fromARGB(
                                                                      //       255, 246, 123, 127),
                                                                      //   onPressed: () {},
                                                                      //   text: "Cancle",
                                                                      //   shape: GFButtonShape.pills,
                                                                      // ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ))));
                                                    },
                                                    icon: const Icon(
                                                      Icons.edit,
                                                      color: Color.fromARGB(
                                                          255, 42, 42, 114),
                                                    )),
                                              ),
                                            ),
                                            Material(
                                              child: Tooltip(
                                                message: 'rd'.tr,
                                                child: IconButton(
                                                    onPressed: () {
                                                      Get.dialog(Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Container(
                                                              width: 280,
                                                              height: 120,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .blueAccent)),
                                                              child: Column(
                                                                children: [
                                                                  Center(
                                                                    child: Text(
                                                                      'AreYouSureRemove'
                                                                          .tr,
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontFamily:
                                                                              "Pacifico",
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              42,
                                                                              42,
                                                                              114),
                                                                          decoration:
                                                                              TextDecoration.none),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 20,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      GFButton(
                                                                        color: const Color.fromARGB(
                                                                            255,
                                                                            246,
                                                                            123,
                                                                            127),
                                                                        onPressed:
                                                                            () {
                                                                          controller
                                                                              .wishListBuyBook
                                                                              .remove(m);
                                                                        },
                                                                        text: "Delete"
                                                                            .tr,
                                                                        shape: GFButtonShape
                                                                            .pills,
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            4,
                                                                      ),
                                                                      GFButton(
                                                                        color: const Color.fromARGB(
                                                                            255,
                                                                            246,
                                                                            123,
                                                                            127),
                                                                        onPressed:
                                                                            () {
                                                                          Get.back();
                                                                        },
                                                                        text: "Cancle"
                                                                            .tr,
                                                                        shape: GFButtonShape
                                                                            .pills,
                                                                      ),
                                                                    ],
                                                                  )
                                                                ],
                                                              ))));
                                                    },
                                                    icon: const Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                    )),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ))
                        .toList())
          ],
        ),
      ),
    );
  }

  Future Baket() {
    for (var element in controller.wishListBuyBook) {
      controller.sum.value += element.price!;
    }

    return Get.dialog(Align(
      alignment: Alignment.topRight,
      child: Container(
          width: 450,
          height: 700,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Basket'.tr,
                    style: const TextStyle(
                        fontSize: 24,
                        fontFamily: "Pacifico",
                        color: Color.fromARGB(255, 246, 123, 127),
                        decoration: TextDecoration.none),
                  ),
                ),
                Column(
                    children: controller.wishListBuyBook
                        .map((element) => shapPice(
                            element.IdBookLibrary!, element.Count!, element))
                        .toList()),
                Row(
                  children: [
                    const SizedBox(
                      width: 160,
                    ),
                    Text('t'.tr,
                        style: const TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.none,
                            color: Color.fromARGB(255, 42, 42, 114))),
                    Text('${controller.sum.value}\$',
                        style: const TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.none,
                            color: Colors.black54)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {
                            for (var element in controller.wishListBuyBook) {
                              controller.AddToBuyBookback(element);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 246, 123, 127),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            shape: const CircleBorder(),
                          ),
                          child: const Icon(
                            Icons.check,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    ));
  }

  Widget buildItem(String value, int id, String type) {
    return Material(
      child: InkWell(
        onTap: () {
          if (type == 'B') {
            controller.getAllBookByType(id);
          } else {
            controller.getAllBookByWritter(id);
          }
        },
        child: SizedBox(
          height: 100,
          width: 280,
          child: Text(
            value,
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 18,
                decoration: TextDecoration.none),
          ),
        ),
      ),
    );
  }
}
