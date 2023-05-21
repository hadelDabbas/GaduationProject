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
  @override
  void onInit() {
    super.onInit();
  }
  Future<void> signUpUser() async {
    user.value.Phone="56774765476";
    var data = await userRpo.regierterPerson(user.value);
    if (data) {
      Get.to(HomePage());
      print('trueeee');
    } else {
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
