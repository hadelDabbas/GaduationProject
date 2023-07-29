 import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:getwidget/components/dropdown/gf_multiselect.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';

class Givepermission extends GetResponsiveView{
  List<String>permission=['Admain All permission'
  ,'Admain All','Admain Library','Admain post','Admain Group'];
@override

  Widget build(BuildContext context){
    return Column(
      children: [
         Material(
          child: Container(
        width: 350,
        height: 60,
        child: TextField(
            decoration: InputDecoration(
          labelText: 'Administrator Name ',
          labelStyle:
              TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
          hintText: 'Enter Administrator Name ',
          prefixIcon: Icon(
            Icons.person_2_outlined,
            color: Color.fromARGB(255, 245, 146, 149),
          ),
        )),
      )),
        Material(
          child: Container(
        width: 350,
        height: 60,
        child: TextField(
            decoration: InputDecoration(
          labelText: 'Password Administrator ',
          labelStyle:
              TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
          hintText: 'Enter Password Administrator',
          prefixIcon: Icon(
            Icons.admin_panel_settings_outlined,
            color: Color.fromARGB(255, 245, 146, 149),
          ),
        )),
      )),
          Material(
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 194, 192, 192)),
                      borderRadius: BorderRadius.circular(10)),
                  child: GFAccordion(
                    title: "Admain Library",
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 246, 123, 127),
                        decoration: TextDecoration.none),
                    contentChild: Column(
                      children: controller.contents
                          .map((element) => TextButton(
                              onPressed: () {
                                controller.AddnewGroup.value.content = element;
                              },
                              child: Text(element.typeName.toString(),   style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                            decoration: TextDecoration.none))))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
         Material(
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 194, 192, 192)),
                      borderRadius: BorderRadius.circular(10)),
                  child: GFAccordion(
                    title: "Admain Group",
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color.fromARGB(255, 246, 123, 127),
                        decoration: TextDecoration.none),
                    contentChild: Column(
                      children: controller.contents
                          .map((element) => TextButton(
                              onPressed: () {
                                controller.AddnewGroup.value.content = element;
                              },
                              child: Text(element.typeName.toString(),   style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                            decoration: TextDecoration.none))))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                   checkShose(' All Permission'),
                checkShose('Add New Group'),
                   checkShose('Add New Refrence'),
                           checkShose('Add New Library'),
                           checkShose('Delete Librarys'),
                            checkShose('Delete Groups'),
              ],
            )
      ],
    );
  }
  Widget checkShose(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: TextStyle(color: Colors.black54,
        fontSize: 20,
        fontWeight: FontWeight.bold
        ),),
        Checkbox(value: false, onChanged: (value){})
      ],
    );
  }
}