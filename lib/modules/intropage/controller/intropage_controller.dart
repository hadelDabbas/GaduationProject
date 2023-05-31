import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class IntropageController extends GetxController{
late IntropageController pageController;
List<Widget>? slideList;
 int initialPage=2;
 @override
 void onInit(){
    pageController = IntropageController();
  initialPage = pageController.initialPage;
  super.onInit();
 }

}