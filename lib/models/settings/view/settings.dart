import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPageView extends GetResponsiveView {
  @override
  Widget builder() {
    return Container( height: 600,
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(85, 8, 8,8),
              child: Center(
                child: Text('Settings',
                    style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,
                     color: Colors.blueGrey,fontFamily: "Pacifico")),
              ),
            ),
            SizedBox(width: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(width: 250,height: 100,
                child: Image.asset('assets/images/setting.gif')),
            ),

            ],),
           
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: [
                  CardSetting("Group", Icons.group_add),
                  CardSetting("Post", Icons.post_add),
                  CardSetting("Content", Icons.edit_calendar),
                   CardSetting("Library", Icons.library_books),
                   CardSetting("Quiz", Icons.check_box),
                  CardSetting("Language", Icons.language),
                  CardSetting("Help", Icons.question_mark),
                  CardSetting("Logout", Icons.exit_to_app),
                   Container(
                   width: 100, height: 100,child: Card(),)
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
        child: InkWell(
          onTap: () {},
          child: Card(
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
              Icon(data, color: Color.fromARGB(255, 246, 123, 127)),
              Text(name),
            ]),
          ),
        ),
      ),
    );
  }
}
