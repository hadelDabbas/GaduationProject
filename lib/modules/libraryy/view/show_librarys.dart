import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/getwidget.dart';
import 'package:graduationproject/modules/libraryy/view/library.dart';

import '../../../app/model/library.dart';
import '../controller/library_controller.dart';

class ShowLibraryspage extends GetResponsiveView<LibraryContrller> {
  LibraryContrller controller = Get.put(LibraryContrller());
  List<String> namelibrary = [
    ' Al Tourath',
    ' Al Arabi',
    ' Al Quraa',
    ' Al Hadara'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                          size: 20, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    " Librarays  ",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Pacifico",
                        color: Colors.blueGrey,
                        decoration: TextDecoration.none),
                  ),
                ),
              ),
              SizedBox(
                width: 100,
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 90,
                  height: 90,
                  child: Image.asset("assets/images/doda.png"),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 90,
                  height: 90,
                  child: Image.asset("assets/images/book3.png"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 22,
          ),

          Wrap(
            children:
               controller.listLibrary.map((e) => shapelibrarycard(context, e.libraryName.toString()
               ,e.libraryAddress.toString(),e.Id!,e)).toList(),
          ),
          ////////Add New Library
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Material(
                child: Tooltip(
                  message: 'Add New Library',
                  child: GFIconButton(
                    color: Colors.blueGrey,
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
                              Text(
                                " Add New Librarays  ",
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
                                  child: Container(
                                    width: 350,
                                    height: 60,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.library_books,
                                          color: Color.fromARGB(
                                              255, 246, 123, 127),
                                        ),
                                        labelText: 'Add Library Name',
                                        labelStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 246, 123, 127),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onChanged: (value) {
                                        controller.Addlibrary.value.libraryName=value;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Material(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 350,
                                    height: 60,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.location_on,
                                          color: Color.fromARGB(
                                              255, 246, 123, 127),
                                        ),
                                        labelText: 'Add Library Postion',
                                        labelStyle: TextStyle(
                                            color: Color.fromARGB(
                                                255, 246, 123, 127),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onChanged: (value) {
                                        controller.Addlibrary.value.libraryAddress=value;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: GFButton(
                                  onPressed: () {
                                 controller.addLibrary(controller.Addlibrary.value)  ; 
                                  },
                                  text: "Added",
                                  color: Colors.blueGrey,
                                  shape: GFButtonShape.pills,
                                ),
                              ),
                            ]),
                          )));
                    },
                    icon: Icon(Icons.add),
                    shape: GFIconButtonShape.pills,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget shapelibrarycard(BuildContext context, String name,String address,int idlibrary,Library library) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
      child: Material(
        child: InkWell(
          onTap: () {
            controller.IdLibrary.value=idlibrary;
            controller.Newlibrary.value=library;
            Get.to(Librarypage());
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22.0),
                border: Border.all(color: Colors.blueGrey)),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                elevation: 10.0,
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  height: MediaQuery.of(context).size.height / 6,
                  child: Column(children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            name,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 2.3),
                        Align(
                          alignment: Alignment.topRight,
                          child: Row(
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
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Align(
                                                    alignment: Alignment.center,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        "Update Library ",
                                                        style: TextStyle(
                                                            fontSize: 18,
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
                                                Material(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      width: 350,
                                                      height: 40,
                                                      child: TextFormField(
                                                     //   controller:name.toString() ,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Update Library Name',
                                                          labelStyle: TextStyle(
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
                                                          controller.updatelibrary.value.libraryName=value;
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
                                                    child: Container(
                                                      width: 350,
                                                      height: 60,
                                                      child: TextFormField(
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Update Library Postion',
                                                          labelStyle: TextStyle(
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
                                                            controller.updatelibrary.value.libraryAddress=value;
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 90,
                                                      child: Image.asset(
                                                          'assets/images/book2.png'),
                                                    ),
                                                    SizedBox(
                                                      width: 80,
                                                    ),
                                                    GFButton(
                                                      shape:
                                                          GFButtonShape.pills,
                                                      color: Colors.blueGrey,
                                                      onPressed: () {
                                                        controller.UpdateLibrary(idlibrary);
                                                        Get.snackbar(
                                                          ' Ok ',
                                                          "Saved Data ",
                                                          //  icon: Icon(Icons.person, color: Colors.white),
                                                          snackPosition:
                                                              SnackPosition
                                                                  .BOTTOM,
                                                          backgroundColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  209,
                                                                  143,
                                                                  143),
                                                          borderRadius: 20,
                                                          margin:
                                                              EdgeInsets.all(
                                                                  15),
                                                          colorText:
                                                              Colors.white,
                                                          duration: Duration(
                                                              seconds: 4),
                                                          isDismissible: true,
                                                          //  dismissDirection: SnackDismissDirection.HORIZONTAL,
                                                          forwardAnimationCurve:
                                                              Curves
                                                                  .easeOutBack,
                                                        );
                                                      },
                                                      text: "Save",
                                                      textStyle: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ));
                                    },
                                    icon: Icon(
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
                                                    Text(
                                                      "Are Sure To Remove?",
                                                      style: TextStyle(
                                                          fontSize: 18,
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
                                                                onPressed:
                                                                    () {
                                                              controller.dellibrary(idlibrary)   ;     
                                                                    },
                                                                child: Text(
                                                                  'Yes',
                                                                  style: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          245,
                                                                          146,
                                                                          149)),
                                                                )),
                                                            TextButton(
                                                                onPressed:
                                                                    () {
                                                                      Get.back();
                                                                    },
                                                                child: Text(
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
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.black54,
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.add_location_sharp,
                            color: Color.fromARGB(255, 245, 146, 149),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            address,
                            style: TextStyle(
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
