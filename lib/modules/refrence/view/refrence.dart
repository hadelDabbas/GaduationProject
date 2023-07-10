import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/refrence_controller.dart';

class RefrencePageView extends GetResponsiveView <RerenceController>{
  RerenceController controller=Get.put(RerenceController());
  @override
  Widget builder() {
    return Container(
        height: 600,
        child: SingleChildScrollView(
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
                            size: 17, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 18,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(96, 8, 8, 8),
                  child: Center(
                    child: Text('All Refrenceses',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            color: Colors.blueGrey,
                            fontFamily: "Pacifico")),
                  ),
                ),
              ],
            ),
        Column(
          children: controller.refrences.map((e) => shap(e)).toList(),
        ),
          ],
        )));
  }
  Widget shap( String title){
    return         Material(
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Container(
                  decoration: BoxDecoration(border: Border.all(color: Color.fromARGB(255, 194, 192, 192)),
                  borderRadius: BorderRadius.circular(10)
                  ),
                  child: GFAccordion(
                      title: title,
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 246, 123, 127),
                          decoration: TextDecoration.none),
                          contentChild: 
                          Column
                          (children:controller.ItRefrence.map((e) => InkWell(
                            onTap:() async {
                        final url = e;
                        if (await canLaunch(url)) {
                          await launch(
                            url,
                          //  forceSafariVC: false,
                          );
                        }} ,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(e,
                              style: TextStyle(color: Colors.blue,decoration: TextDecoration.none,fontSize: 17,
                              fontWeight: FontWeight.bold
                              ),
                              ),
                            ))).toList() ),
                   ),
                ),
              ),
            );
  }
}
