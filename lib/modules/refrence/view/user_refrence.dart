import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controller/refrence_controller.dart';

class UserRefrencePageView extends GetResponsiveView<RerenceController> {
  RerenceController controller = Get.put(RerenceController());
  @override
  Widget builder() {
    return Container(
        height: 600,
        child: SingleChildScrollView(
          child: Column(children: [
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
                    child: Text('Added Refrenceses',
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
            shapeUser('Aya Ahmad',),
                  shapeUser('Randa  Ahjkdw',)
          ]),
        ),
        );}
        Widget shapeUser(String nameuser){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
               decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 194, 192, 192)),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                              Row(
                          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: GFImageOverlay(
                  height: 40,
                  width: 40,
                  shape: BoxShape.circle,
                  image: AssetImage(
                    'assets/images/2.png'),
                  boxFit: BoxFit.cover,
                ),
              ),
                    Text(
                        nameuser,
                        style: TextStyle(
                            fontFamily: "Pacifico",
                          fontSize: 20,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                       color: Colors.black54,
                        ),
                      ),
                          ],
                        ),
                Column(
                  children: controller.refrences.map((e) =>       Material(
                    child: GFAccordion(
                    title: e,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 246, 123, 127),
                        decoration: TextDecoration.none),
                    contentChild: Column(
                        children: controller.ItRefrence.map(
                      (e) => Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Sql Server',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54),
                                ),
                              ),
                              // IconButton(
                              //     onPressed: () {
                              //        Get.dialog(Align(
                              //                       alignment: Alignment.center,
                              //                       child: Container(
                              //                           width: 220,
                              //                           height: 120,
                              //                           decoration: BoxDecoration(
                              //                               color: Colors.white,
                              //                               borderRadius:
                              //                                   BorderRadius.circular(
                              //                                       10),
                              //                               border: Border.all(
                              //                                   color:
                              //                                       Colors.blueAccent)),
                              //                           child: SingleChildScrollView(
                              //                               child: Column(
                              //                             children: [
                              //                               const Text(
                              //                                 "Are Sure To Remove?",
                              //                                 style: TextStyle(
                              //                                     fontSize: 18,
                              //                                     fontWeight:
                              //                                         FontWeight.bold,
                              //                                     fontFamily:
                              //                                         "Pacifico",
                              //                                     color:
                              //                                         Colors.blueGrey,
                              //                                     decoration:
                              //                                         TextDecoration
                              //                                             .none),
                              //                               ),
                              //                               Padding(
                              //                                 padding:
                              //                                     const EdgeInsets.all(
                              //                                         8.0),
                              //                                 child: Center(
                              //                                   child: Row(
                              //                                     mainAxisAlignment:
                              //                                         MainAxisAlignment
                              //                                             .center,
                              //                                     children: [
                              //                                       TextButton(
                              //                                           onPressed: () {
                                                                        
                              //                                           },
                              //                                           child:
                              //                                               const Text(
                              //                                             'Yes',
                              //                                             style: TextStyle(
                              //                                                 color: Color.fromARGB(
                              //                                                     255,
                              //                                                     245,
                              //                                                     146,
                              //                                                     149)),
                              //                                           )),
                              //                                       TextButton(
                              //                                           onPressed: () {
                              //                                             Get.back();
                              //                                           },
                              //                                           child:
                              //                                               const Text(
                              //                                             'No',
                              //                                             style: TextStyle(
                              //                                                 color: Color.fromARGB(
                              //                                                     255,
                              //                                                     245,
                              //                                                     146,
                              //                                                     149)),
                              //                                           )),
                              //                                     ],
                              //                                   ),
                              //                                 ),
                              //                               )
                              //                             ],
                              //                           )))));
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
                              e,
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
                  ), ).toList()
            
                  
                )
               
              ],
            ),
            
              // child: Column(
              //   children: [
              
              //   ],
              // ),
            ),
          );
        }
        }