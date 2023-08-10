import 'dart:io';
import 'dart:js';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/content/view/content.dart';
import 'package:graduationproject/modules/libraryy/view/library.dart';
import 'package:image_picker/image_picker.dart';

import '../../genereted/sheard/util.dart';
import '../controller/profile_controller.dart';
class EditPostview extends GetResponsiveView<ProfileController> {
 ProfileController controller = Get.put(ProfileController());
    final _formfield = GlobalKey<FormState>();
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
    TextEditingController _controller=TextEditingController(text: controller.postidnew.value.Description);
    return Form(
          key: _formfield,
      child: Column(children: [
        // Material(
        //     child: Obx(
        //   () => Container(
        //     width: 300,
        //     child: DropdownButton<String>(
        //         items: controller.Contents.map<DropdownMenuItem<String>>(
        //           (String value) {
        //             return DropdownMenuItem<String>(
        //               value: value,
        //               child: Text(
        //                 value,
        //                 style: TextStyle(
        //                     color: Colors.black45, fontWeight: FontWeight.bold),
        //               ),
        //             );
        //           },
        //         ).toList(),
        //         isExpanded: true,
        //         value: controller.Contents.first,
        //         iconSize: 24,
        //         elevation: 16,
        //         onChanged: (String? newval) {
        //           controller.updatepost.value.content!.typeName!=newval;
        //           controller.Contents.value.first.typeName= newval!;
        //         }),
        //   ),
        // )),
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
            controller: _controller,
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
             validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]")
                              .hasMatch(value)) {
                        return "Enter Correct Text";
                      } else {
                        return null;
                      }},
          onChanged: (value) {
            controller.postidnew.value.Description=value;
          },
          ),
        )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shadowColor: Color.fromARGB(255, 42, 42, 114),
                backgroundColor: Color.fromARGB(255, 42, 42, 114)),
            onPressed: () {
                                            if (_formfield.currentState!.validate()) {
                    print("Data Added Successfully");
                   
                  }
             controller.UpdatePost();
            },
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
             Tooltip(
                message: 'Help About Page',
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
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
                                                                 controller.texteditpost,
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
              )
      ]),
    );
  }

  Widget Imageprofile(ProfileController controller) {
    return Center(
      child: Stack(
        children: <Widget>[
           Obx(() =>  CircleAvatar(
            radius: 80.0,
                    //  borderRadius: BorderRadius.circular(100),
                      child: controller.stringPickImage.value.isNotEmpty
                          ? Utility.imageFromBase64String(
                              controller.stringPickImage.value, 200, 200)
                          : controller.postidnew.value.Image == null
                              ? Image.asset(
                                  'assets/images/boy.gif',
                                  width: 200,
                                  height: 200,
                                )
                              : Utility.imageFromBase64String(
                                  Utility.base64String(controller.postidnew.value.Image!), 200, 200),
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
void openBottomSheet( ProfileController controller) {
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