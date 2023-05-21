import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool ExpastionStatus(int stateCode){
  var errorMassege='';
  switch(stateCode){
    case 200:
    errorMassege="The Requst Completed Succ";
    //  Get.snackbar(
    //           errorMassege,
    //            "Hello everyone",
    //            icon: Icon(Icons.person, color: Colors.white),
    //            snackPosition: SnackPosition.BOTTOM,
    //            backgroundColor: Colors.green,
    //            borderRadius: 20,
    //            margin: EdgeInsets.all(15),
    //            colorText: Colors.white,
    //            duration: Duration(seconds: 4),
    //            isDismissible: true,
    //           //  dismissDirection: SnackDismissDirection.HORIZONTAL,
    //            forwardAnimationCurve: Curves.easeOutBack,

    //            );
    return true;
  case 404:
   errorMassege="Error Not Found";
  //  Get.snackbar(
  //           errorMassege,
  //              "Hello everyone",
  //              icon: Icon(Icons.person, color: Colors.white),
  //              snackPosition: SnackPosition.BOTTOM,
  //              backgroundColor: Colors.green,
  //              borderRadius: 20,
  //              margin: EdgeInsets.all(15),
  //              colorText: Colors.white,
  //              duration: Duration(seconds: 4),
  //              isDismissible: true,
  //             //  dismissDirection: SnackDismissDirection.HORIZONTAL,
  //              forwardAnimationCurve: Curves.easeOutBack,

  //              );
   return false;
   case 400:
      errorMassege="Error Bad Requst";
      // Get.snackbar(
      //        errorMassege,
      //          "Hello everyone",
      //          icon: Icon(Icons.person, color: Colors.white),
      //          snackPosition: SnackPosition.BOTTOM,
      //          backgroundColor: Colors.green,
      //          borderRadius: 20,
      //          margin: EdgeInsets.all(15),
      //          colorText: Colors.white,
      //          duration: Duration(seconds: 4),
      //          isDismissible: true,
      //         //  dismissDirection: SnackDismissDirection.HORIZONTAL,
      //          forwardAnimationCurve: Curves.easeOutBack,

      //          );
   return false;
   default:
   return false;
  }
 
  //Open Overlaymnet
}
