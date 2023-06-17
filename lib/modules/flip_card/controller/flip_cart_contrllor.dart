import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../view/flip_class.dart';

class GamePageController extends GetxController {
  // var gameobject= Game().obs;
  final List<String> card_list =[
  'assets/images/5.png'
'assets/images/3.png'
'assets/images/1.png'
'assets/images/2.png'
'assets/images/3.png'
'assets/images/1.png'
'assets/images/5.png'
'assets/images/2.png'
];
final String hiddencard='assets/images/1.png';
 List<String> ?gameIng;
 List<Map<int , String>>matchchet=[];

final int cardcount=8;
void initGame(){
 gameIng=List.generate(cardcount, (index) => hiddencard);
}
   var tires=0.obs;
    var score=0.obs;
    @override
  void onInit() {
    super.onInit();
    initGame();
  }}