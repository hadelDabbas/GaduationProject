import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/groups/controller/group_controller.dart';
import 'package:graduationproject/modules/groups/view/group.dart';

class ShowGroupPageView extends GetResponsiveWidget<GroupController>{
  GroupController controller=Get.put(GroupController());
  @override
  Widget builder() {
    final random = Random();
    return SingleChildScrollView(
      child: Column(
        children: [
            Material(
              child: InkWell(
                onTap: () => Get.back(),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey),
                  ),
                ),
              ),
            ),
             Text(
                " All Groups ",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pacifico",
                    color: Colors.blueGrey,
                    decoration: TextDecoration.none),
              ),
              // SingleChildScrollView(
              //   child: Container(
              //            height: 40,
              //     child: Wrap(children:controller.Content.map((e) => BuildcontentGroup(e)).toList() ,)),
              // ),
               SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                      width: 500,
                      child:  Material(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: 'search',labelStyle: TextStyle(color: Color.fromARGB(255, 184, 183, 183),fontWeight: FontWeight.bold),
                              
                            hintText: 'search',
                              prefixIcon: Icon(Icons.search,color: Color.fromARGB(255, 196, 195, 195),),
                             enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(width: 3, color: Color.fromARGB(255, 196, 195, 195)),
                                borderRadius: BorderRadius.circular(15),
                                
                              ),
                                 focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(width: 3, color: Color.fromARGB(255, 196, 195, 195)),
                                borderRadius: BorderRadius.circular(15),
                              )
                          )
                          ),
                      )
                      ),
              ),
              SizedBox(height: 8,),
   Cardgroup('assets/images/IT.gif','Information tecnology'),
    Cardgroup('assets/images/history.gif','Historyical'),
     Cardgroup('assets/images/welcom.png','Global'),
      Cardgroup('assets/images/team.png','Medical'),

          
        ],
      ),
    );
  }
  Widget Cardgroup(String url,String name){
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Material(
        child: InkWell(
          onTap: () {
            Get.to(GroupView());
          },
          child: Container( width: 800,
            height: screen.height/6,
              child: Card(
                  margin: EdgeInsets.all(10),
             
             shadowColor: Colors.blueGrey,
              elevation: 30,
              child: Column( crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
               Row(children: [
                 Container(width: 80, height: 80, child: Image.asset( url)),
                 SizedBox(width: 10,),
               Text(name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
               color: Colors.black54),)
               ],)
                // Flexible(
                //      child: new Text(discribtion,style: TextStyle(fontSize: 18))),
                    
            
              ])
                
              ),
            ),
        ),
      ),
    );
  }
  Widget BuildcontentGroup(String txt){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 40,
          width: 90,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.3,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Text(
            txt,
            style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(
                  255,
                  246,
                  123,
                  127,
                ),
                decoration: TextDecoration.none),
          )),
        ),
    );
  }
}