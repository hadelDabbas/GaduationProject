import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/post.dart';
import 'package:graduationproject/modules/Addpost/data/addpost_repositry.dart';
import 'package:image_picker/image_picker.dart';

import '../../../api/storage/storge_service.dart';
import '../../../app/model/content.dart';
import '../../../app/model/user.dart';
import '../../genereted/sheard/util.dart';
import '../../sheard/auth_service.dart';

class AddpostController extends GetxController {
  static AddpostController get to => Get.find<AddpostController>();

  List<String> Contents = [
    'History',
    'Math',
    'Arabic',
    'English',
    'Diversified'
  ];
  final stringPickImage = ''.obs;
  static const String KeyData = "AuthData";
  final stroge = Get.find<StorageService>();
  var valuechoice = ''.obs;
  var dropdownvalue = 'History'.obs;
   final contents = <Content>[].obs;
  var user = User().obs;
  final newpost = Post().obs;
  final postRepo = AddpostRepository();
  final auth = Get.find<AuthService>();

  final ImagePicker imagepicker = ImagePicker();
  PickedFile? imagefile;
  @override
  Future<void> onInit() async {
    super.onInit();
    await GetUser();
  }

  Future takePhoto(ImageSource source) async {
    final PiickedFile = await imagepicker.getImage(source: source);
    imagefile = PiickedFile;
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

  Future<void> GetUser() async {
    user.value = auth.getDataFromStorage() as User;
//  print(user.value.Email);
  }

  Future<void> GetContens() async {
 var data = await postRepo.GetAllContent();
    contents.assignAll(data );

  }
  Future<void> AddPost() async {
    newpost.value.Image = Utility.dataFromBase64String(stringPickImage.value);
    var data = await postRepo.AddpostUser(newpost.value, user.value.Id!);
    if (data) {
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
    } else {
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
