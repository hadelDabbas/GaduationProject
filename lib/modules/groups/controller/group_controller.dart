import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../genereted/sheard/util.dart';

class  GroupController extends GetxController{
   var page=2.obs;
var click=false.obs;
var press=false.obs;
 var dropdownvalue = 'History'.obs;
 final ImagePicker imagepicker=ImagePicker();
 final stringPickImage = ''.obs;
   PickedFile ?imagefile;
 List <String> Content=['History ','IT','Culture','Senice','Math','Medical','Global']; 
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