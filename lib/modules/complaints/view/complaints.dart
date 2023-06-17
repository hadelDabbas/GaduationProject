import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:graduationproject/modules/complaints/controller/complaints_controller.dart';

import '../../AddBook/controller/AddBook_controller.dart';

class ComplaintspageView extends GetResponsiveView<ComplaintsController> {
  ComplaintsController controller = Get.put(ComplaintsController());
  Uint8List? image;
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
              Text(
                " Complaints  ",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pacifico",
                    color: Colors.blueGrey,
                    decoration: TextDecoration.none),
              ),
              SizedBox(width: 190,),
              // Container(
              //   height: 80,
              // child: Image.asset('assets/images/c2.png'),
              // ),
               Container(
                height: 80,
                width: 100,
              child: Image.asset('assets/images/c1.png'),
              ),
            ],
          ),
          Text(
            " Here All Complaints  ",
            style: TextStyle(
                fontSize: 18,
                   fontFamily: "Pacifico",
                color: Color.fromARGB(255, 141, 140, 140),
                decoration: TextDecoration.none),
          ),
          SizedBox(
            height: 20,
          ),
          CardComplaints('Maya Ahmad', 'I Want To By Admain for group IT',
              context, 'assets/images/2.png'),
          CardComplaints(
              'Hadel Dabase',
              'I Will Publish Post in Group Math I wamt to apply',
              context,
              'assets/images/team.png'),
          CardComplaints(
              'Haya Yosofi',
              'I want to by Admain for publish question and testing',
              context,
              'assets/images/11.png'),
          CardComplaints(
              'Asia Badnjki',
              'I dont love Your App And I hope to improved it',
              context,
              'assets/images/12.png'),
        ],
      ),
    );
  }

  Widget CardComplaints(
      String name, String Complaints, BuildContext context, String url) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GFImageOverlay(
                height: 40,
                width: 40,
                shape: BoxShape.circle,
                image: AssetImage(url),
                boxFit: BoxFit.cover,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              // height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.3,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22.0)),
              child: Card(
                       shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                child: Column(children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      name,
                      style: TextStyle(
                        fontFamily: "Pacifico",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 246, 123, 127),
                      ),
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.all(16.0),
                    width: 300,
                    child: new Column(
                      children: <Widget>[
                        new Text(
                          Complaints,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 250,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Tooltip(
                            message: 'Not Accept',
                            child: ElevatedButton(
                              onPressed: () async {},
                              child: Icon(
                                Icons.close,
                                size: 18,
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 238, 106, 97),
                                shape: CircleBorder(),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Tooltip(
                            message: ' Accept',
                            child: ElevatedButton(
                              onPressed: () async {},
                              child: Icon(
                                Icons.check,
                                size: 18,
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: CircleBorder(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  //   Icon(Icons.abc, color: Color.fromARGB(255, 246, 123, 127)),
                ]),
              ),
            ),
          ],
        ));
  }
}
