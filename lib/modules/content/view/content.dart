import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/content_controller.dart';

class Contentpage extends GetResponsiveView<ContentController> {
  ContentController controller = Get.put(ContentController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: [
            CardContent('History'),
            CardContent('Comidi'),
            CardContent('Culthre'),
            CardContent('mathes'),
          ],
        ),
        SizedBox(
          height: 6,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              " Add Content : ",
              style: TextStyle(
                  fontSize: 18,
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
              width: 250,
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Add New Content',
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 246, 123, 127),
                      fontWeight: FontWeight.bold),
                ),
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
        SizedBox(
          height: 12,
        ),
      ],
    );
  }

  Widget CardContent(String name) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        height: 30,
        width: 70,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1.3,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          name,
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
