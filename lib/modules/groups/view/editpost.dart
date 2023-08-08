import 'dart:io';
import 'dart:js';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/content/view/content.dart';
import 'package:graduationproject/modules/groups/controller/group_controller.dart';
import 'package:graduationproject/modules/libraryy/view/library.dart';
import 'package:image_picker/image_picker.dart';

import '../../genereted/sheard/util.dart';
class EditPostgroupview extends GetResponsiveView<GroupController> {
GroupController controller = Get.put(GroupController());
 Uint8List? image;
  List<String> Contents = [
    'History',
    'Math',
    'Arabic',
    'English',
    'Diversified'
  ];

  // var dropdownvalue;
  @override
  Widget build(BuildContext context) {
    //TextEditingController _controller=TextEditingController(text: controller.editpost.value.Description);
    return Column(children: [
      Material(
          child: Obx(
        () => Container(
          width: 300,
          child: DropdownButton<String>(
              items:Contents.map<DropdownMenuItem<String>>(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                          color: Colors.black45, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ).toList(),
              isExpanded: true,
              value: Contents.first,
              iconSize: 24,
              elevation: 16,
              onChanged: (String? newval) {
              Contents.first = newval!;
               // controller.Updatecontentpost(newval);
               // controller.editpost.value.IdType=controller.newcontent.value.Id;
              }),
        ),
      )),
      Center(
          child: Column(
        children: [
          SizedBox(width: 170),
            Material(child: Imageprofile()),
        ],
      )),
      Material(
          child: Container(
        width: 300,
        child: TextField(
         // controller: _controller,
            decoration: InputDecoration(
          labelText: 'Description',
          labelStyle:
              TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
          hintText: 'Description',
          prefixIcon: Icon(
            Icons.text_fields,
            color: Color.fromARGB(255, 245, 146, 149),
          ),
        ),
        onChanged: (value) {
       //   controller.editpost.value.Description=value;
        },
        ),
      )),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shadowColor: Color.fromARGB(255, 42, 42, 114),
              // padding:
              //         const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              backgroundColor:Color.fromARGB(255, 42, 42, 114)),
          onPressed: () {
           // controller.updatepost();
         //  controller.UpdatePostUser(controller.editpost.value.Id!);
          },
          child: Text(
            'Save',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ]);
  }

  Widget Imageprofile() {
    return Center(
      child: Stack(
        children: <Widget>[
           Obx(() =>  CircleAvatar(
            radius: 80.0,
                    //  borderRadius: BorderRadius.circular(100),
                      child: controller.stringPickImage.value.isNotEmpty
                          ? Utility.imageFromBase64String(
                              controller.stringPickImage.value, 200, 200)
                          : image == null
                              ? Image.asset(
                                  'assets/images/boy.gif',
                                  width: 200,
                                  height: 200,
                                )
                              : Utility.imageFromBase64String(
                                  Utility.base64String(image!), 200, 200),
                    )
                    ),
          Positioned(
              bottom: 20.0,
              right: 20.0,
              child: InkWell(
                onTap: ()async {
             openBottomSheet();
                },
                child: Icon(
                  Icons.camera_alt,
                  color: Color.fromARGB(255, 245, 146, 149),
                  size: 28.0,
                ),
              ))
        ],
      ),
    );
  }
}
void openBottomSheet( ) {
  Get.bottomSheet(
    Container(height: 120.0,
    width: 500,
    margin: EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 20
    ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Choose Post Photo',
              style: TextStyle(fontSize: 18),
            ),
          ),
           SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
               FloatingActionButton(
                backgroundColor: Color.fromARGB(255, 246, 123, 127),
                foregroundColor: Colors.white,
                mini: true,
                onPressed: () {
           
                },
                child: Icon(Icons.camera),
              ),
              Text('  Camera'),
                ],
              ),
             
                SizedBox(
            width: 10,
          ),
          Row(children: [
               FloatingActionButton(
                backgroundColor: Color.fromARGB(255, 246, 123, 127),
                foregroundColor: Colors.white,
                mini: true,
                onPressed: () {
               //    controller.pickImageFun();
                },
                child: Icon(Icons.image),
              ),
                 Text('  Gallery'),
          ],)
              
            ],
          ),
        ],
      ),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}