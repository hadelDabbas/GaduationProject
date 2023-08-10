import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:graduationproject/modules/MenuGame/Menu_game.dart';

import '../controller/test_controller.dart';
import 'question.dart';

class AddTestPageView extends GetResponsiveView<TestController> {
  TestController controller=Get.put(TestController());
   final _formfield = GlobalKey<FormState>();
  @override
  Widget builder() {
    return Form(
      key: _formfield,
      child: Container(
        child: SingleChildScrollView(
          child: Column(children: [
            Text('Add New Test',
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: Color.fromARGB(255, 42, 42, 114),
                      fontFamily: "Pacifico")),
                          Material(
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(255, 194, 192, 192)),
                    borderRadius: BorderRadius.circular(10)),
                child: GFAccordion(
                  title: "Choose Type Test",
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Color.fromARGB(255, 246, 123, 127),
                      decoration: TextDecoration.none),
                  contentChild:Column(
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
                                              labelText: 'Add Question',
                                              labelStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 246, 123, 127),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                               validator: (value) {
                      validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]")
                            .hasMatch(value)) {
                      return "Enter Correct Text";
                    } else {
                      return null;
                    }};
                  },
                                            onChanged: (value) {
                                           controller.Addtest.value.test=value;
                                           controller.addQution( controller.Addtest.value);
                                           controller.GetId(value);
                                           //////save for id test
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
                                              labelText: 'Add Correct Answer',
                                              labelStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 246, 123, 127),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            
                                                                        
                      validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]")
                            .hasMatch(value)) {
                      return "Enter Correct Text";
                    } else {
                      return null;
                    };
                  },
                                            onChanged: (String value) {
                                              controller.answer.value.IdTest=controller.idTest.value;
                                          controller.answer.value.answer=value ;
                                           controller.answer.value.CorrectAnswer=true;
                                           controller.addAnswer(controller.answer.value);
                                            
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
                                              labelText: 'Add First Choose',
                                              labelStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 246, 123, 127),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            onChanged: (value) {
                                          controller.answer.value.IdTest=controller.idTest.value;
                                          controller.answer.value.answer=value ;
                                           controller.answer.value.CorrectAnswer=false;
                                           controller.addAnswer(controller.answer.value);
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
                                              labelText: 'Add Second Choose',
                                              labelStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 246, 123, 127),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                                                         validator: (value) {
                      validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]")
                            .hasMatch(value)) {
                      return "Enter Correct Text";
                    } else {
                      return null;
                    }};
                  },
                                            onChanged: (value) {
                                             controller.answer.value.IdTest=controller.idTest.value;
                                          controller.answer.value.answer=value ;
                                           controller.answer.value.CorrectAnswer=false;
                                           controller.addAnswer(controller.answer.value);
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
                                              labelText: 'Add Thired Choose',
                                              labelStyle: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 246, 123, 127),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                                                       
                      validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]")
                            .hasMatch(value)) {
                      return "Enter Correct Text";
                    } else {
                      return null;
                    }},
                  
                                            onChanged: (value) {
                                             controller.answer.value.IdTest=controller.idTest.value;
                                          controller.answer.value.answer=value ;
                                           controller.answer.value.CorrectAnswer=false;
                                           controller.addAnswer(controller.answer.value);
                                            },
                                          ),
                                        ),
                                      ),
                                    ),     
                                        Tooltip(
                    message: 'Save Test',
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:  Color.fromARGB(255, 42, 42, 114),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(126)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 17)),
                          onPressed: () {
                             if (_formfield.currentState!.validate()) {
                    print("Data Added Successfully");
                   
                  }
                          },
                          child: Text('Save'),
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
                                                                 controller. textadd,
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
          ]))),
    );}
        
         Widget shap(String title, int id
  // IconData iconData
  ) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Material(
        child: InkWell(
          onTap: (){
            controller.idtest.value=id;
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