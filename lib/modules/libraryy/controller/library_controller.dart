

import 'package:get/get.dart';
import 'package:graduationproject/app/model/book.dart';
import 'package:image_picker/image_picker.dart';

import '../../../api/storage/storge_service.dart';
import '../../genereted/sheard/util.dart';
import '../data/libraray_repositry.dart';

class LibraryContrller extends GetxController{
 var valuepice=0.obs;
     static const  String KeyData="AuthData";
      final stroge = Get.find<StorageService>();
  final Booklist=<Book>[].obs;
  final libraryRepo=LibraryRepository();
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