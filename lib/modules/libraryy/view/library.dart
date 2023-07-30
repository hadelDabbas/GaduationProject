import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:graduationproject/modules/AddBook/view/addbook.dart';
import 'package:graduationproject/modules/icons/Icon.dart';
import 'package:graduationproject/modules/libraryy/controller/library_controller.dart';

import 'updatebook.dart';

class Librarypage extends GetResponsiveView<LibraryContrller> {
  LibraryContrller contrller = Get.put(LibraryContrller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
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
                                labelText: 'search',
                                labelStyle: const TextStyle(
                                    color: Color.fromARGB(255, 184, 183, 183),
                                    fontWeight: FontWeight.bold),
                                hintText: 'search',
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
                TextCategory('Authour'),
                TextCategory('Category'),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Wrap(
              children:
                  //controller.Booklist.map((e) => shapCard(e.Id., e.BookName, e.bookImage.toString(), e.BookPrice, controller))
                  [
                shapCard('Ali Najm', 'بالنيابة عنهم', 'assets/images/ali1.png',
                    '700\$', controller),
                shapCard('Ahmad Shokari', 'اربعون', 'assets/images/ahmad1.png',
                    '1000\$', controller),
                shapCard('Ahlam Mastganmi', 'فوضى الحواس',
                    'assets/images/ahlam2.png', '600\$', controller),
                shapCard('Ahlam Mastganmi', 'الاسود يليق بك',
                    'assets/images/ahlam1.png', '1000\$', controller),
                shapCard('Ahmad Shokari', 'رحلتي مع غاندي',
                    'assets/images/ahmad2.png', '300\$', controller),
                shapCard('Ali Najm', 'خيال', 'assets/images/ali3.png', '500\$',
                    controller),
                shapCard('Ali Najm', 'زحمه حكي', 'assets/images/ali2.png',
                    '900\$', controller),
              ],
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
                            shadowColor: Colors.blueGrey,
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
                                    child: const Text(
                                      " Input Information To Buy ",
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
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: 350,
                                        height: 60,
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            prefixIcon: Icon(Icons.location_on),
                                            labelText: 'Input Location',
                                            labelStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 246, 123, 127),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onChanged: (value) {
                                            // controller.addBookType.value.bookType =
                                            //     value;
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
                                            prefixIcon: Icon(Icons.money),
                                            labelText: 'Input PayBal',
                                            labelStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 246, 123, 127),
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onChanged: (value) {
                                            // controller.addBookType.value.bookType =
                                            //     value;
                                          },
                                          validator: (value) {
                                            if (value!.isEmpty ||
                                                !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]")
                                                    .hasMatch(value)) {
                                              return "Enter Correct Paybal";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: GFButton(
                                      onPressed: () {
                                         Baket();
                                         //Get.back();
                                      },
                                      text: "Input",
                                      color: Colors.blueGrey,
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
                          shadowColor: Colors.blueGrey,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          shape: const CircleBorder(),
                          backgroundColor:
                              const Color.fromARGB(255, 245, 146, 149)),
                      onPressed: () {
                        Get.dialog(Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 450,
                            height: 500,
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
                                          "Add Book  ",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Pacifico",
                                              color: Colors.blueGrey,
                                              decoration: TextDecoration.none),
                                        ),
                                      )),
                                  Container(
                                    child: Addbookpage(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
                      },
                      child: const Icon(
                        Icons.bookmark_add,
                        color: Colors.white,
                        size: 25,
                      )),
                )
              ],
            ),
          ],
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
                border: Border.all(color: Colors.blueGrey, width: 3)),
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
  Widget shapCard(String name, String namebook, String url, String price,
      LibraryContrller controller) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: InkWell(
        onTap: () {
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
                        SizedBox(
                            width: 160, height: 160, child: Image.asset(url)),
                        Column(
                          children: [
                            Row(
                              children: [
                                const Text(
                                  'Name Book:   ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Pacifico",
                                      color: Colors.blueGrey,
                                      decoration: TextDecoration.none),
                                ),
                                Text(
                                  namebook,
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
                                const Text(
                                  'Author Name :   ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Pacifico",
                                      color: Colors.blueGrey,
                                      decoration: TextDecoration.none),
                                ),
                                Text(
                                  name,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                      decoration: TextDecoration.none),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Price :   ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Pacifico",
                                      color: Colors.blueGrey,
                                      decoration: TextDecoration.none),
                                ),
                                Text(price,
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
                      child: const Text('How Many Pices Do You Want ?',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueGrey,
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
                            controller.valuepice.value.toString(),
                            style: const TextStyle(
                              fontSize: 23,
                              color: Colors.black54,
                              decoration: TextDecoration.none,
                            ),
                          )),
                        ),
                        const Text(' pice',
                            style: TextStyle(
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
                              controller.valuepice.value += 1;
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
                          onPressed: () {},
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
                  ],
                ),
              ),
            ),
          ));
        },
        /////here bokk outside
        child: Container(
          height: 300,
          width: 305,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blueGrey,
                width: 1.3,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(3)),
          child: Column(children: [
            SizedBox(
                width: 330,
                height: 200,
                child: Image.asset(
                  url,
                  fit: BoxFit.fill,
                )),
            Text(
              namebook,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico",
                  color: Colors.blueGrey,
                  decoration: TextDecoration.none),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: Text(
                      name,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 246, 123, 127),
                          decoration: TextDecoration.none),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(price,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          decoration: TextDecoration.none)),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        /////Update book info
                        Material(
                            child: IconButton(
                                onPressed: () {
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
                                            const Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Update Book Info  ",
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: "Pacifico",
                                                        color: Colors.blueGrey,
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
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.blueGrey,
                                ))),
                        Material(
                            child: IconButton(
                                onPressed: () {
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
                                                  color: Colors.blueAccent)),
                                          child: Column(
                                            children: [
                                              const Center(
                                                child: Text(
                                                  'Are You Sure?  ',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Pacifico",
                                                      color: Colors.blueGrey,
                                                      decoration:
                                                          TextDecoration.none),
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
                                                    onPressed: () {},
                                                    text: "Delete",
                                                    shape: GFButtonShape.pills,
                                                  ),
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                  GFButton(
                                                    color: const Color.fromARGB(
                                                        255, 246, 123, 127),
                                                    onPressed: () {},
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
                                ))),
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget shapPice(String name, String url, String count) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 400,
        height: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blueGrey)),
        child: Column(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    SizedBox(width: 80, height: 80, child: Image.asset(url)),
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
                      name,
                      style: const TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.none,
                          color: Colors.blueGrey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        const Text('count :',
                            style: TextStyle(
                                fontSize: 18,
                                decoration: TextDecoration.none,
                                color: Colors.blueGrey)),
                        Text(count,
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
                                message: 'buy them',
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.check_box,
                                      color: Color.fromARGB(255, 246, 123, 127),
                                    )),
                              ),
                            ),
                            Material(
                              child: Tooltip(
                                message: 'edit count',
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.grey,
                                    )),
                              ),
                            ),
                            Material(
                              child: Tooltip(
                                message: 'delete items',
                                child: IconButton(
                                    onPressed: () {
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
                                                  color: Colors.blueAccent)),
                                          child: Column(
                                            children: [
                                              const Center(
                                                child: Text(
                                                  'Are You Sure?  ',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Pacifico",
                                                      color: Colors.blueGrey,
                                                      decoration:
                                                          TextDecoration.none),
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
                                                    onPressed: () {},
                                                    text: "Del",
                                                    shape: GFButtonShape.pills,
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  GFButton(
                                                    color: const Color.fromARGB(
                                                        255, 246, 123, 127),
                                                    onPressed: () {},
                                                    text: "Cancle",
                                                    shape: GFButtonShape.pills,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ))));
                                    },
                                    icon: Icon(
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
            ),
          ],
        ),
      ),
    );
  }

  Future Baket() {
    return Get.dialog(Align(
      alignment: Alignment.topRight,
      child: Container(
          width: 450,
          height: 700,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Basket',
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: "Pacifico",
                        color: Color.fromARGB(255, 246, 123, 127),
                        decoration: TextDecoration.none),
                  ),
                ),
                shapPice('بالنيابة عنهم', 'assets/images/ali1.png', '3'),
                shapPice('الاسود يليق بك', 'assets/images/ahlam1.png', '2'),
                shapPice('اربعون', 'assets/images/ahmad1.png', '4'),
                shapPice('فوضى الحواس', 'assets/images/ahlam2.png', '1'),
                shapPice('رحلتي مع غاندي', 'assets/images/ahmad2.png', '3'),
                shapPice('خيال', 'assets/images/ali3.png', '1'),
                Row(
                  children: [
                    const SizedBox(
                      width: 160,
                    ),
                    const Text('Total : ',
                        style: TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.none,
                            color: Colors.blueGrey)),
                    const Text("45000\$",
                        style: TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.none,
                            color: Colors.black54)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () {},
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
