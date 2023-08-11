import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';
import 'package:getwidget/components/border/gf_border.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_border_type.dart';
import 'package:graduationproject/app/model/library.dart';
import 'package:graduationproject/modules/libraryy/view/library.dart';

import '../../refrence/view/refrence.dart';
import '../../refrence/view/user_refrence.dart';
import '../controller/booktype_controller.dart';

class BookTypePageView extends GetResponsiveView<BookTypeController> {
  BookTypeController controller = Get.put(BookTypeController());
   final _formfield = GlobalKey<FormState>();
  //  final textfield=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
           key: _formfield,
          child: Column(
            children: [
              Material(
                child: InkWell(
                  onTap: () => Get.back(),
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
              const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "  BookTypes  ",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Pacifico",
                          color: Color.fromARGB(255, 42, 42, 114),
                          decoration: TextDecoration.none),
                    ),
                  )),
                   Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "  All BookType Here ",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Pacifico",
                          color: Colors.grey,
                          decoration: TextDecoration.none),
                    ),
                  )),
             
              // CardBookType('history', context, 9),
              // CardBookType('Medicine', context, 9),
              // CardBookType('Culture', context, 9),
              // CardBookType('Arabic', context, 9),
              // CardBookType('Love', context, 9),
              // CardBookType('Math', context, 9),
              Column(
                  children: controller.AllBookType.map((element) => CardBookType(
                          element.bookType.toString(), context, element.id!))
                      .toList()),
                  Row(
                    children: [
                Tooltip(
                message: 'Add New BookType',
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
                                    border: Border.all(color: Colors.blueAccent)),
                                width: 400,
                                height: 200,
                                child: Column(children: [
                                  const Text(
                                    " Add New BookType  ",
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
                                              color: Color.fromARGB(
                                                  255, 246, 123, 127),
                                            ),
                                            labelText: 'Add BookTpe',
                                            labelStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 246, 123, 127),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onChanged: (value) {
                                            controller.addBookType.value.bookType =
                                                value;
                                          },
                                                                  validator: (value) {
                  // for number
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "Enter Correct Name";
                  } else {
                    return null;
                  }},
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: GFButton(
                                      onPressed: () {
                                           if (_formfield.currentState!.validate()) {
                  print("Data Added Successfully");
                                        controller.AddBookType(
                                            controller.addBookType.value);
                                       } else{
                                               Get.snackbar(
                                              ' Error',
                                              " Add New BookType ",
                                              //  icon: Icon(Icons.person, color: Colors.white),
                                              snackPosition: SnackPosition.BOTTOM,
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 209, 143, 143),
                                              borderRadius: 20,
                                              margin: const EdgeInsets.all(15),
                                              colorText: Colors.white,
                                              duration:
                                                  const Duration(seconds: 4),
                                              isDismissible: true,
                                              //  dismissDirection: SnackDismissDirection.HORIZONTAL,
                                              forwardAnimationCurve:
                                                  Curves.easeOutBack,
                                            );
                                       }

                                       },
                                      text: "Added",
                                      color: Color.fromARGB(255, 42, 42, 114),
                                      shape: GFButtonShape.pills,
                                    ),
                                  ),
                                ]),
                              )));
                        },
                        child: Icon(Icons.add)),
                  ),
                ),
              ),
              Tooltip(
              message: 'Help About Page',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(onPressed: (){
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
                                                  color: Color.fromARGB(255, 42, 42, 114),
                                                  decoration: TextDecoration.none),
                                            ),
                                          )),
                                    ),
                                             Padding(
                                               padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                                               child: Column(
                                                           children: <Widget>[
                                                             new Text(
                                                               controller.text,
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
                  }, icon: Icon(Icons.help_outline_outlined,
                  size: 30,
                  color:Color.fromARGB(255, 246, 123, 127) ,)),
                ),
              ),
            )
                    ],
                  )  ,
              
            ],
          ),
        ),
      ),
    );
  }

  Widget CardBookType(String name, BuildContext context, int idBooktupe) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        width: 350,
        child: GFBorder(
          radius: const Radius.circular(20),
          color: const Color.fromARGB(
            255,
            246,
            123,
            127,
          ),
          dashedLine: const [4, 0],
          type: GFBorderType.rRect,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 21,
              color: const Color.fromARGB(255, 252, 253, 252),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 6,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      name,
                      style: const TextStyle(
                          fontSize: 20,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ),
                  Material(
                      child: IconButton(
                          onPressed: () async {
                            Get.dialog(Align(
                                alignment: Alignment.center,
                                child: Container(
                                    width: 280,
                                    height: 120,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border:
                                            Border.all(color: Colors.blueAccent)),
                                    child: Column(
                                      children: [
                                        const Center(
                                          child: Text(
                                            'Are You Sure?  ',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Pacifico",
                                                color: Color.fromARGB(255, 42, 42, 114),
                                                decoration: TextDecoration.none),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            GFButton(
                                              color: const Color.fromARGB(
                                                  255, 246, 123, 127),
                                              onPressed: () {
                                                controller
                                                    .delBookType(idBooktupe);
                                              },
                                              text: "Delete",
                                              shape: GFButtonShape.pills,
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            GFButton(
                                              color: const Color.fromARGB(
                                                  255, 246, 123, 127),
                                              onPressed: () {
                                                Get.to(BookTypePageView());
                                              },
                                              text: "Cancle",
                                              shape: GFButtonShape.pills,
                                            ),
                                          ],
                                        )
                                      ],
                                    ))));
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            //    color: Color.fromARGB(255, 245, 74, 62),
                          )))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
