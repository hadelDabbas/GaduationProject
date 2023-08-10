import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';

import '../../../app/model/refrenceDto.dart';
import '../../genereted/sheard/util.dart';

class HelpPageView extends GetResponsiveView {
  @override
  Widget builder() {
    return Container(
        height: 600,
        child: SingleChildScrollView(
          child: Column(children: [
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
                        Padding(
                    padding:  EdgeInsets.fromLTRB(96, 8, 8, 8),
                    child: Center(
                      child: Text('All Help',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              color: Color.fromARGB(255, 42, 42, 114),
                              fontFamily: "Pacifico")),
                    ),
                  ),
                  
          ])));}}