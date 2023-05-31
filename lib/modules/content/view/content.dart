import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controller/content_controller.dart';

class Contentpage extends GetResponsiveView<ContentController> {
  ContentController controller = Get.put(ContentController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Material(
                child: InkWell(
                  onTap: () => Get.back(),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back_ios,
                          size: 20, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "  All Content  ",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Pacifico",
                          color: Colors.blueGrey,
                          decoration: TextDecoration.none),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children:
           // controller.contents.map((element) => CardContent(element.content.toString(), context)).toList()
             [
              CardContent('History', context),
              CardContent('Comidi', context),
              CardContent('Culthre', context),
              CardContent('mathes', context),
              CardContent('Sport', context),
              CardContent('Natura', context),
              CardContent('It', context),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GFButton(
                 shape: GFButtonShape.pills,
                color: Colors.blueGrey,
                onPressed: () {
                         Get.dialog(
                      Align(alignment: Alignment.center,
                      child: Container(
                        width: 320,height: 180,  decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                     border: Border.all(color: Colors.blueAccent)
                    ),
                        child: Column(
                          children: [
                                Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "   Add Content  ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pacifico",
                    color: Colors.blueGrey,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
          Material(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 400,
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Add New Content',
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 246, 123, 127),
                        fontWeight: FontWeight.bold),
                  ),
                  onChanged: (value) {
                    if(!controller.contents.contains(value)){
                      controller.addcontent.value.typeName=value;
                   
                    }
                    else{
                              Get.snackbar(
             ' Error',
               " Add New content ",
             //  icon: Icon(Icons.person, color: Colors.white),
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Color.fromARGB(255, 209, 143, 143),
               borderRadius: 20,
               margin: EdgeInsets.all(15),
               colorText: Colors.white,
               duration: Duration(seconds: 4),
               isDismissible: true,
              //  dismissDirection: SnackDismissDirection.HORIZONTAL,
               forwardAnimationCurve: Curves.easeOutBack,

               );
                    }
                  },
                ),
              ),
            ),
          ),
               Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    controller.show.value = true;
                      if(!controller.contents.contains(controller.addcontent.value)){
                           controller. addcontentelement(controller.addcontent.value);
                    }
                    else{
                              Get.snackbar(
             ' Error',
               " Add New content ",
             //  icon: Icon(Icons.person, color: Colors.white),
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Color.fromARGB(255, 209, 143, 143),
               borderRadius: 20,
               margin: EdgeInsets.all(15),
               colorText: Colors.white,
               duration: Duration(seconds: 4),
               isDismissible: true,
              //  dismissDirection: SnackDismissDirection.HORIZONTAL,
               forwardAnimationCurve: Curves.easeOutBack,

               );
                    }
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(120)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15)),
                ),
              ),
            ),
          ),
                          ],
                        )
                      
                      )));
                },
                text: "Add Content",
                textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                icon: Icon(
                  Icons.add,
                  size: 17,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 6,
              ),
               GFButton(
                 shape: GFButtonShape.pills,
                color: Colors.blueGrey,
                onPressed: () {
                   Get.snackbar(
             ' Ok ',
               "Saved Data ",
             //  icon: Icon(Icons.person, color: Colors.white),
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Color.fromARGB(255, 209, 143, 143),
               borderRadius: 20,
               margin: EdgeInsets.all(15),
               colorText: Colors.white,
               duration: Duration(seconds: 4),
               isDismissible: true,
              //  dismissDirection: SnackDismissDirection.HORIZONTAL,
               forwardAnimationCurve: Curves.easeOutBack,

               );
                },
                text: "Save",
                textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                icon: Icon(
                  Icons.check,
                  size: 17,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }

  Widget CardContent(String name, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child:
          GFBorder(
        radius: Radius.circular(20),
        color: Color.fromARGB(
          255,
          246,
          123,
          127,
        ),
        dashedLine: [4, 0],
        type: GFBorderType.rRect,
        child: Container(
          height: 40,
          color: Color.fromARGB(255, 252, 253, 252),
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Center(
                child: Text(
                  name,
                  style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Material(
                      child: IconButton(
                          onPressed: () {
                 //        controller.delcontentelement(content)   ;
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Color.fromARGB(255, 245, 74, 62),
                          ))))
            ],
          ),
        ),
      ),
    );
  }
}
