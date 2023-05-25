import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/post.dart';
import 'package:graduationproject/modules/Addpost/data/addpost_repositry.dart';
import 'package:image_picker/image_picker.dart';

import '../../../api/storage/storge_service.dart';
import '../../../app/model/user.dart';
import '../../genereted/sheard/util.dart';

class AddpostController extends GetxController{
 static AddpostController get to => Get.find<AddpostController>();

   List <String> Contents=['History','Math','Arabic','English','Diversified'];
   List <String> Content=[];
   final stringPickImage = ''.obs;
      static const  String KeyData="AuthData";
       final stroge = Get.find<StorageService>();
   var valuechoice=''.obs;
    var dropdownvalue = 'History'.obs;
    final newpost=Post().obs;
    final postRepo= AddpostRepository();
    
   final ImagePicker imagepicker=ImagePicker();
   PickedFile ?imagefile;
   
   Future takePhoto ( ImageSource source) async{
    final PiickedFile=await imagepicker.getImage(source: source);
   imagefile=PiickedFile;
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
 Future <void>AddPost( Post post)async{
   var iduser=(stroge.getData(KeyData) as User).Id ;
  var data= await  postRepo.AddpostUser(post, iduser!);
  if(data){
     Get.snackbar(
             'Good',
               "  Add New Post Succsful ",
             //  icon: Icon(Icons.person, color: Colors.white),
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Color.fromARGB(255, 246, 123, 127),
               borderRadius: 20,
               margin: EdgeInsets.all(15),
               colorText: Colors.white,
               duration: Duration(seconds: 4),
               isDismissible: true,
              //  dismissDirection: SnackDismissDirection.HORIZONTAL,
               forwardAnimationCurve: Curves.easeOutBack,

               );
  }else{
       Get.snackbar(
             'Error ',
               "The new post dont added",
             //  icon: Icon(Icons.person, color: Colors.white),
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Color.fromARGB(255, 246, 123, 127),
               borderRadius: 20,
               margin: EdgeInsets.all(15),
               colorText: Colors.white,
               duration: Duration(seconds: 4),
               isDismissible: true,
              //  dismissDirection: SnackDismissDirection.HORIZONTAL,
               forwardAnimationCurve: Curves.easeOutBack,

               );
  }
 }
   
}