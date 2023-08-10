import 'dart:io';
import 'dart:js';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:graduationproject/modules/content/view/content.dart';
import 'package:graduationproject/modules/libraryy/view/library.dart';
import 'package:image_picker/image_picker.dart';

import '../../genereted/sheard/util.dart';
import '../controller/group_controller.dart';

class Addpostviewas extends GetResponsiveView<GroupController> {
 GroupController controller = Get.put(GroupController());
  final _formfield = GlobalKey<FormState>();
 Uint8List? image;

  // var dropdownvalue;
  @override
  Widget build(BuildContext context) {
    return Form(
       key: _formfield,
      child: Column(children: [
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
          Material(
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 194, 192, 192)),
                        borderRadius: BorderRadius.circular(10)),
                    child: GFAccordion(
                      title: "Post Type",
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,  
                          color: Color.fromARGB(255, 246, 123, 127),
                          decoration: TextDecoration.none),
                      contentChild: Column(
                        children: controller.contents
                            .map((element) => TextButton(
                                onPressed: () {
                                  controller.newpost.value.content = element;
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
        Center(
            child: Column(
          children: [
            SizedBox(width: 170),
              Material(child: Imageprofile(controller)),
          ],
        )),
        Material(
            child: Container(
          width: 300,
          child: TextFormField(
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
          onChanged: (value){
         controller.newpost.value.Description=value;
          },
                    validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]")
                            .hasMatch(value)) {
                      return "Enter Correct Description";
                    } else {
                      return null;
                    }},
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
           if (_formfield.currentState!.validate()) {
                    print("Data Added Successfully");
              controller.AddPost();
              }  },
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ]),
    );
  }

  Widget Imageprofile( GroupController controller) {
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
             openBottomSheet(controller);
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
void openBottomSheet( GroupController controller) {
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
               controller.pickImageFun();
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
                   controller.pickImageFun();
                },
                child: Icon(Icons.image),
              ),
                 Text('  Gallery'),
          ],)
              
            ],
          ),
          // OutlinedButton(
          //   onPressed: () {
          //     Get.back();
          //   },
          //   child: const Text('Close'),
          // ),
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