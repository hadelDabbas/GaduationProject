import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/content/view/content.dart';
import 'package:graduationproject/modules/groups/view/add_group.dart';
import 'package:graduationproject/modules/libraryy/view/library.dart';

import '../../Addpost/view/addpost.dart';

class SettingPageView extends GetResponsiveView {
  @override
  Widget builder() {
    return Container(
      height: 600,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(85, 8, 8, 8),
                  child: Center(
                    child: Text('Settings',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            color: Colors.blueGrey,
                            fontFamily: "Pacifico")),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 250,
                      height: 100,
                      child: Image.asset('assets/images/setting.gif')),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: [
                  Material(
                    child: InkWell(
                      onTap: (){
                        Get.to(AddGrpoup());
                      },
                      child: CardSetting("Group", Icons.group_add)),
                  ),

                  Material(
                    child: InkWell(
                      onTap: () {
                             Get.dialog(
                      Align(alignment: Alignment.center,
                      child: Container(
                        width:500,height:370 ,  decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                     border: Border.all(color: Colors.blueAccent)
                    ),
                        child:
                      SingleChildScrollView(
                        child: Column(children: [
                           SizedBox(height: 10,),
                          Align(alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Add post : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,
                              fontFamily: "Pacifico",color: Colors.blueGrey,decoration: TextDecoration.none),),
                            )),
                           Container(child: Addpostview(),),
                           
                        ],),
                      )
                      ,),)
                    );
                      },
                      child: CardSetting("Post", Icons.post_add),
                    ),
                  ),
                    Material(
                    child: InkWell(
                      onTap: () {
                        Get.to(Contentpage());
                    //       Get.dialog(
                    //   Align(alignment: Alignment.center,
                    //   child: Container(
                    //     width: 320,height: 310,  decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       borderRadius: BorderRadius.circular(10),
                    //  border: Border.all(color: Colors.blueAccent)
                    // ),
                    //     child:
                    //   SingleChildScrollView(
                    //     child: Column(children: [
                    //        SizedBox(height: 10,),
                    //       Align(alignment: Alignment.topLeft,
                    //         child: Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Text("All Content : ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,
                    //           fontFamily: "Pacifico",color: Colors.blueGrey,decoration: TextDecoration.none),),
                    //         )),
                    //        Container(child: Contentpage(),)
                    //     ],),
                    //   )
                    //   ,),)
                    // );
                      },
                      child: CardSetting("Content", Icons.edit_calendar),
                    ),
                  ),
                   Material(
                    child: InkWell(
                      onTap: () {
                         Get.to(Librarypage());
                      },
                      child: CardSetting("Library", Icons.library_books),
                    ),
                  ),
                 
                  CardSetting("Quiz", Icons.check_box),
                  CardSetting("Language", Icons.language),
                  CardSetting("Help", Icons.question_mark),
                  CardSetting("Logout", Icons.exit_to_app),
                  Container(
                    width: 100,
                    height: 100,
                    child: Card(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CardSetting(String name, IconData data) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(60, 8, 10, 8),
        child: Container(
          height: 120,
          width: 150,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.3,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(3)),
          child: Card(
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
              Icon(data, color: Color.fromARGB(255, 246, 123, 127)),
              Text(name),
            ]),
          ),
        ));
  }
}
