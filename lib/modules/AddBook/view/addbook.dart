import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../genereted/sheard/util.dart';
import '../controller/AddBook_controller.dart';

class Addbookpage extends GetResponsiveView < AddBookController>{
   AddBookController controller =Get.put( AddBookController());
     Uint8List? image;
  @override
  Widget builder() {
    return Column(children: [

         Center(
                child: Column(
              children: [
                SizedBox(width: 170),
                Material(child: Imageprofile(controller)),
              ],
            )),
              Padding(
               padding: const EdgeInsets.all(8.0),
               child: Material(
                       child: Container(
                     width: 450,
                     child: TextField(
                decoration: InputDecoration(
                       labelText: 'Name Book',
                       labelStyle:
                  TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
                       hintText: 'Name Book',
                       prefixIcon: Icon(
                Icons.bookmark_add_outlined,
                color: Color.fromARGB(255, 245, 146, 149),
                       ),
                     )
                     ),
                   )),
             ),
               Padding(
               padding: const EdgeInsets.all(8.0),
               child: Material(
                       child: Container(
                     width: 450,
                     child: TextField(
                decoration: InputDecoration(
                       labelText: 'Name Writter',
                       labelStyle:
                  TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
                       hintText: 'Name Writter',
                       prefixIcon: Icon(
                Icons.person_2_outlined,
                color: Color.fromARGB(255, 245, 146, 149),
                       ),
                     )
                     ),
                   )),
             ),
               Padding(
               padding: const EdgeInsets.all(8.0),
               child: Material(
                       child: Container(
                     width: 450,
                     child: TextField(
                decoration: InputDecoration(
                       labelText: 'Price Book',
                       labelStyle:
                  TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
                       hintText: 'Price Book',
                       prefixIcon: Icon(
                Icons.price_change,
                color: Color.fromARGB(255, 245, 146, 149),
                       ),
                     )
                     ),
                   )),
             ),
               Container(
                  width: 450,
                  child: Material(
                    child: TextField(
                        decoration: InputDecoration(
                         labelText: 'Descrintion About Book',
                         labelStyle:
                    TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
                         hintText: 'Descrintion About Book',
                         prefixIcon: Icon(
                                  Icons.text_fields,
                                  color: Color.fromARGB(255, 245, 146, 149),
                         ),
                       ),
                      keyboardType: TextInputType.multiline,
                      minLines: 1,//Normal textInputField will be displayed
                      maxLines: 5,// when user presses enter it will adapt to it
                      ),
                  ),
                ),
               
  GFButton(
    color: Colors.blueGrey,
    onPressed: (){},
    text: "Add Book",
  ), 

    ],

    );}
     Widget Imageprofile( AddBookController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Stack(
          children: <Widget>[
            Obx(() => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                      
                        border: Border.all(
                            color: Color.fromARGB(255, 192, 189, 189))),
                    //    radius: 80.0,
                    //  borderRadius: BorderRadius.circular(100),
                    child: controller.stringPickImage.value.isNotEmpty
                        ? Utility.imageFromBase64String(
                            controller.stringPickImage.value, 200, 200)
                        : image == null
                            ? Image.asset(
                                'assets/images/d.png',
                                width: 200,
                                height: 200,
                                fit: BoxFit.fill,
                              )
                            : Utility.imageFromBase64String(
                                Utility.base64String(image!), 200, 200),
                  ),
                )),
            Positioned(
                bottom: 20.0,
                right: 20.0,
                child: InkWell(
                  onTap: () async {
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
      ),
    );
  }
}

void openBottomSheet( AddBookController controller) {
  Get.bottomSheet(
    Container(
      height: 120.0,
      width: 500,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
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
              Row(
                children: [
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
                ],
              )
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