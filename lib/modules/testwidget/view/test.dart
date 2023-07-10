import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/MenuGame/Menu_game.dart';

import 'question.dart';

class TestPageView extends GetResponsiveView {
  @override
  Widget builder() {
    return Container(
      child: SingleChildScrollView(
        child: Column(children: [
          Text('Tests',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  color: Colors.blueGrey,
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
                  children: [
                      shap('IT  Test',Icons.integration_instructions_outlined ),
                shap('Arabic Test',Icons.abc_sharp),
                shap('Math Test', Icons.calculate_outlined),
                       shap('Medical Test',Icons.medical_services_outlined),
                       shap('Chamistry Test', Icons.biotech_sharp),
                   shap('Phaysis Test', Icons.airline_stops_outlined)
                  ],
                ),
              )
        ]),
      ),
    );
  }

  Widget shap(String title, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Material(
        child: InkWell(
          onTap: (){
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
                               Padding(
                                 padding: EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Icon(
                                       iconData ,
                                                 size: 40,
                                                 color: Color.fromARGB(255, 246, 123, 127),
                                      ),
                                    ),
                               ), 
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
