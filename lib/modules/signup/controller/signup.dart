import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/user.dart';
import 'package:graduationproject/modules/menu/view/HomePage.dart';
import 'package:image_picker/image_picker.dart';

import '../../genereted/sheard/util.dart';
import '../data/signup_repository.dart';

class SignUpController extends GetxController {
  var passtoggle = true.obs;
  RxBool hidePassword = true.obs;
  final stringPickImage = ''.obs;
  final userRpo = SingUpRepository();
  final user = User().obs;
  var selectedDate = DateTime.now().obs;
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
  @override
  void onInit() {
    super.onInit();
  }
  Future<void> signUpUser() async {
    user.value.Phone="56774765476";
    var data = await userRpo.regierterPerson(user.value);
    if (data) {
      Get.snackbar(
             'Succeful',
               "Welcom"+user.value.Name.toString(),
             //  icon: Icon(Icons.person, color: Colors.white),
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Color.fromARGB(255, 209, 143, 143),
               borderRadius: 20,
               margin: EdgeInsets.all(15),
               colorText: Colors.blueGrey,
               duration: Duration(seconds: 4),
               isDismissible: true,
              //  dismissDirection: SnackDismissDirection.HORIZONTAL,
               forwardAnimationCurve: Curves.easeOutBack,

               );
      Get.to(HomePage());
      print('trueeee');

    } else {
          Get.snackbar(
             'Error ',
               "Sure From Field "+user.value.Name.toString(),
             //  icon: Icon(Icons.person, color: Colors.white),
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: Color.fromARGB(255, 209, 143, 143),
               borderRadius: 20,
               margin: EdgeInsets.all(15),
               colorText: Colors.blueGrey,
               duration: Duration(seconds: 4),
               isDismissible: true,
              //  dismissDirection: SnackDismissDirection.HORIZONTAL,
               forwardAnimationCurve: Curves.easeOutBack,

               );
      print('false');
    }
  }

  chooseDate() async {
    DateTime? PickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        firstDate: DateTime(2005),
        lastDate: DateTime(2026),
      //  initialEntryMode: DatePickerEntryMode.input,
     //   initialDatePickerMode: DatePickerMode.year,
        helpText: 'select DOB',
        cancelText: 'close',
        confirmText: 'confirm',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter valid date range ',
        fieldLabelText: 'DOB',
        fieldHintText: 'Month/Date/Year',
      selectableDayPredicate: disableDate
        );
       if(PickedDate!=null && PickedDate!=selectedDate.value){
        selectedDate.value=PickedDate;
       }
  }
  bool disableDate(DateTime day){
    if((day.isAfter(DateTime.now().subtract(Duration(days: 1)))&&day.isBefore(DateTime.now().add(Duration(days: 5)))))
       {
        return true;
       }
       return false;
  }
}
