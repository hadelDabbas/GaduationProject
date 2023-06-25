import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:graduationproject/modules/AddBook/view/addbook.dart';
import 'package:graduationproject/modules/icons/Icon.dart';

import 'package:graduationproject/modules/libraryy/controller/library_controller.dart';

import 'updatebook.dart';

class Librarypage extends GetResponsiveView<LibraryContrller> {
  LibraryContrller controller = Get.put(LibraryContrller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(
          child: Text(
            controller.Newlibrary.value.libraryName.toString(),
            style: TextStyle(
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
                    child: Container(
                        width: 450,
                        child: TextField(
                            decoration: InputDecoration(
                                labelText: 'search',
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 184, 183, 183),
                                    fontWeight: FontWeight.bold),
                                hintText: 'search',
                                prefixIcon: Icon(
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
                // TextCategory('Book'),
                //  TextCategory('Area Book'),
                TextCategory('Category'),
              ],
            ),
            SizedBox(
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
                            shape: CircleBorder(),
                            backgroundColor:
                                Color.fromARGB(255, 245, 146, 149)),
                        onPressed: () {
                          Get.dialog(Align(
                            alignment: Alignment.topRight,
                            child: Container(
                                width: 500,
                                height: 700,
                                color: Colors.white,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Basket',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontFamily: "Pacifico",
                                              color: Color.fromARGB(
                                                  255, 246, 123, 127),
                                              decoration: TextDecoration.none),
                                        ),
                                      ),
                                      shapPice('بالنيابة عنهم',
                                          'assets/images/ali1.png', '3'),
                                      shapPice('الاسود يليق بك',
                                          'assets/images/ahlam1.png', '2'),
                                      shapPice('اربعون',
                                          'assets/images/ahmad1.png', '4'),
                                      shapPice('فوضى الحواس',
                                          'assets/images/ahlam2.png', '1'),
                                      shapPice('رحلتي مع غاندي',
                                          'assets/images/ahmad2.png', '3'),
                                      shapPice('خيال', 'assets/images/ali3.png',
                                          '1'),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 160,
                                          ),
                                          Text('Total : ',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: Colors.blueGrey)),
                                          Text("45000\$",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: Colors.black54)),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Align(
                                              alignment: Alignment.bottomRight,
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                child: Icon(
                                                  Icons.check,
                                                  size: 16,
                                                  color: Colors.white,
                                                ),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          255, 246, 123, 127),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                                  shape: CircleBorder(),
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
                        },
                        child: Icon(
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
                          shape: CircleBorder(),
                          backgroundColor: Color.fromARGB(255, 245, 146, 149)),
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
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
                      child: Icon(
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
          if (states.contains(MaterialState.hovered))
            return Color.fromARGB(255, 246, 123, 127);
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
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Pacifico",
                      color: Color.fromARGB(255, 246, 123, 127),
                      decoration: TextDecoration.none),
                ),
                name == "BookType"
                    ? Column(
                        children: controller.Booktype.map(
                                (e) => buildItem(e.bookType.toString(), e.Id!,'B'))
                            .toList(),
                      )
                    : Column(
                        children:
                            controller.AllAutour.map((e) => buildItem(e.writerName.toString(),e.Id!,'A'))
                                .toList(),
                      )
              ]),
            ),
          ),
        ));
      },
      child: Text(name,
          style: TextStyle(
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
              height: 470,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueAccent)),
              ////////here item book
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                            width: 160, height: 160, child: Image.asset(url)),
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(
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
                                  style: TextStyle(
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
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                      decoration: TextDecoration.none),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Price :   ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Pacifico",
                                      color: Colors.blueGrey,
                                      decoration: TextDecoration.none),
                                ),
                                Text(price,
                                    style: TextStyle(
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
                      child: Text(
                        '  Description : ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Pacifico",
                            color: Color.fromARGB(255, 246, 123, 127),
                            decoration: TextDecoration.none),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child: Row(
                        children: <Widget>[
                          Flexible(
                              child: Center(
                            child: new Text(
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                  decoration: TextDecoration.none,
                                ),
                                "  This application gives you additional experiences through a set of scientific and entertaining tests,in addition to scientific games that strengthen perception and stimulate the brain"),
                          ))
                        ],
                      )),
                    ),
                    Text('How Many Pices Do You Want ?',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey,
                            decoration: TextDecoration.none,
                            fontFamily: "Pacifico")),
                    Row(
                      children: [
                        SizedBox(
                          width: 200,
                        ),
                        Obx(
                          () => Center(
                              child: Text(
                            controller.valuepice.value.toString(),
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black54,
                              decoration: TextDecoration.none,
                            ),
                          )),
                        ),
                        Text(' pice',
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
                          SizedBox(
                            width: 185,
                          ),
                          Material(
                              child: IconButton(
                            icon: Icon(
                              Icons.add,
                              color: Color.fromARGB(255, 246, 123, 127),
                            ),
                            onPressed: () {
                              controller.valuepice.value += 1;
                            },
                          )),
                          Material(
                              child: IconButton(
                            icon: Icon(
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
                          child: Icon(
                            AppIconn.shopping_cart,
                            size: 16,
                            color: Colors.white,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 246, 123, 127),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            shape: CircleBorder(),
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
            Container(
                width: 330,
                height: 200,
                child: Image.asset(
                  url,
                  fit: BoxFit.fill,
                )),
            Text(
              namebook,
              style: TextStyle(
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
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 246, 123, 127),
                          decoration: TextDecoration.none),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(price,
                      style: TextStyle(
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
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
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
                                icon: Icon(
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
                                              Center(
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
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GFButton(
                                                    color: Color.fromARGB(
                                                        255, 246, 123, 127),
                                                    onPressed: () {},
                                                    text: "Delete",
                                                    shape: GFButtonShape.pills,
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  GFButton(
                                                    color: Color.fromARGB(
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
        width: 450,
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
                    Container(width: 80, height: 80, child: Image.asset(url)),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.none,
                          color: Colors.blueGrey),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        Text('count :',
                            style: TextStyle(
                                fontSize: 18,
                                decoration: TextDecoration.none,
                                color: Colors.blueGrey)),
                        Text(count,
                            style: TextStyle(
                                fontSize: 18,
                                decoration: TextDecoration.none,
                                color: Colors.black54)),
                        SizedBox(
                          width: 90,
                        ),
                        Align(
                            child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
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

  Widget buildItem(String value,int id,String type) {
    return Material(
      child: InkWell(
        onTap: (){
          if(type=='B'){
            controller.getAllBookByType(id);
          }else{
  controller.getAllBookByWritter(id);
          }
        },
        child: Container(
          height: 100,
          width: 280,
          child: Text(
            value,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                decoration: TextDecoration.none),
          ),
        ),
      ),
    );
  }
}
