import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../genereted/sheard/util.dart';

class AddpostController extends GetxController{
 static AddpostController get to => Get.find<AddpostController>();

   List <String> Contents=['History','Math','Arabic','English','Diversified'];
   List <String> Content=[];
   final stringPickImage = ''.obs;
   var valuechoice=''.obs;
    var dropdownvalue = 'History'.obs;
    
   final ImagePicker imagepicker=ImagePicker();
   PickedFile ?imagefile;
   
   Future takePhoto ( ImageSource source) async{
    final PiickedFile=await imagepicker.getImage(source: source);
   imagefile=PiickedFile;
  //  imagefile=PickedFile(PiickedFile!.path.toString());
  

   }

    Future pickImageFun() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      stringPickImage.value = Utility.base64String(await image.readAsBytes());
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

   
}