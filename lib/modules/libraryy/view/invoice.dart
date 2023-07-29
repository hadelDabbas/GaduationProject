import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../genereted/sheard/util.dart';
import '../controller/library_controller.dart';

class Invoicepage extends GetResponsiveView<LibraryContrller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Material(
            child: InkWell(
              onTap: () => Get.back(),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child:
                      Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey),
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "  Invoce  ",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Pacifico",
                      color: Color.fromARGB(255, 42, 42, 114),
                      decoration: TextDecoration.none),
                ),
              )),
          CardInvoic('Al Hekma', context),
            CardInvoic('Al World', context),
        ]),
      ),
    );
  }

  Widget CardInvoic(String nameLIbr, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Align(
        alignment: Alignment.center,
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 1.1,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 248, 251, 253),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(22.0)),
            child: Center(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      nameLIbr,
                      style: TextStyle(
                          fontFamily: "Pacifico",
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 246, 123, 127),
                      ),
                    ),
                  ),
                ),
                itemBook(),
                itemBook(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          'Total : 4556\$',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Pacifico",
                                fontWeight: FontWeight.bold,
                         color: Color.fromARGB(255, 42, 42, 114),
                                decoration: TextDecoration.none),
                          ),
                      ),
                    ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget itemBook() {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        child: Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Color.fromARGB(255, 206, 204, 204), width: 1),
              borderRadius: BorderRadius.circular(12)),
          child: Column(children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "  Name Book :",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                               fontFamily: "Pacifico",
                            color: Color.fromARGB(255, 109, 157, 197),
                            decoration: TextDecoration.none),
                      ),
                      Text(
                        "  رحلتي مع غاندي",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "  Count :",
                            style: TextStyle(
                                fontSize: 19,
                                   fontFamily: "Pacifico",
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 109, 157, 197),
                                decoration: TextDecoration.none),
                          ),
                          Text(
                            ' 4 ',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          // Text(
                          //   "  price one :",
                          //   style: TextStyle(
                          //       fontSize: 20,
                          //       fontWeight: FontWeight.bold,
                          //       color: Color.fromARGB(255, 109, 157, 197),
                          //       decoration: TextDecoration.none),
                          // ),
                          Text(
                            '500\$ to one' ,
                            style: TextStyle(
                                fontSize: 20,
                                   fontFamily: "Pacifico",
                                fontWeight: FontWeight.bold,
                          color:   Color.fromARGB(255, 246, 123, 127),
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
