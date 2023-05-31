import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../genereted/sheard/util.dart';

class AddBookController extends GetxController{
  final ImagePicker imagepicker=ImagePicker();
 final stringPickImage = ''.obs;
   PickedFile ?imagefile;
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