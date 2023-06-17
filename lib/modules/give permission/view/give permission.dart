 import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/dropdown/gf_multiselect.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';

class Givepermission extends GetResponsiveView{
  List<String>permission=['Admain All permission','Admain All','Admain Library','Admain post','Admain Group'];
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
        child: GFMultiSelect(
        items:permission,
        onSelect: (value) {
          print('selected $value ');
        },
        dropdownTitleTileText: ' ',
        dropdownTitleTileMargin: EdgeInsets.only(
        top: 22, left: 18, right: 18, bottom: 5),
        dropdownTitleTilePadding: EdgeInsets.all(10),
        dropdownUnderlineBorder:
        const BorderSide(color: Colors.transparent, width: 2),
        dropdownTitleTileBorder:
        Border.all(color: Colors.blueGrey, width: 1),
        dropdownTitleTileBorderRadius: BorderRadius.circular(5),
        expandedIcon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black54,
        ),
        collapsedIcon: const Icon(
          Icons.keyboard_arrow_up,
          color: Colors.black54,
        ),
        submitButton: Text('OK'),buttonColor: Color.fromARGB(255, 246, 123, 127) ,
        cancelButton: Text('Cancel'),
        dropdownTitleTileTextStyle:
        const TextStyle(fontSize: 14, color: Colors.black54),
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.all(6),
        type: GFCheckboxType.basic,
        activeBgColor: Color.fromARGB(255, 246, 123, 127),
        activeBorderColor: Color.fromARGB(255, 246, 123, 127),
        inactiveBorderColor: Colors.blueGrey,
      ),
      ),
      
      

      ],
    );
  }
}