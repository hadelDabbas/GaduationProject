import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:graduationproject/modules/MenuGame/Menu_game.dart';

import '../controller/test_controller.dart';
import 'add-test.dart';
import 'question.dart';

class TestPageView extends GetResponsiveView<TestController> {
  TestController controller=Get.put(TestController());
  @override
  Widget builder() {
    return Container(
      child: SingleChildScrollView(
        child: Column(children: [
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
          Text('Tests',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  color: Color.fromARGB(255, 42, 42, 114),
                  fontFamily: "Pacifico")),
              Center(
                child: Text('Show Your Tests Do You Want',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
              color:Colors.grey ,
             )),
              ),
              SizedBox(height: 40,),
              Center(
                child: Column(
                  children:
                  controller.ListTestContent.map((e) => shap(e.typeName.toString(),e.Id!)).toList()
                //    [
                //       shap('IT  Test',Icons.integration_instructions_outlined ),
                // shap('Arabic Test',Icons.abc_sharp),
                // shap('Math Test', Icons.calculate_outlined),
                //        shap('Medical Test',Icons.medical_services_outlined),
                //        shap('Chamistry Test', Icons.biotech_sharp),
                //    shap('Phaysis Test', Icons.airline_stops_outlined)
                //   ],
                ),
              ),
              Row(children: [
                   Tooltip(
                  message: 'Add New Test',
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
                                height: 400,
                                child: AddTestPageView()
                            
                              )));
                        },
                        child: Text('Add Test'),
                      ),
                    ),
                  ),
                ),
                   Tooltip(
              message: 'Help About Page',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Material(
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
                                                                 controller. text,
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
              ),
            )
              ],),
            
        ]),
      ),
    );
  }

  Widget shap(String title, int id
  // IconData iconData
  ) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Material(
        child: InkWell(
          onTap: (){
         controller.getTestForContent(id);
              Get.to(QuestionPageView());
          },
          child: Container(
                  height: 75,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30), //border corner radius
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 185, 97, 123).withOpacity(0.5), //color of shadow
                        spreadRadius: 3, //spread radius
                        blurRadius: 7, // blur radius
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child:  Padding(
                      padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(width: 40,),
                              //  Padding(
                              //    padding: EdgeInsets.all(8.0),
                              //       child: Center(
                              //         child: Icon(
                              //          iconData ,
                              //                    size: 40,
                              //                    color: Color.fromARGB(255, 246, 123, 127),
                              //         ),
                              //       ),
                              //  ), 
                                 SizedBox(width: 4,),
                               Center(
                                 child: Text(title,
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.none,
                                      color: Colors.black54,
                                    )),
                               ),
                           
                          ],
                        ),
                      ),
                    ),
        ),
      ),
      
    );
  }
}
