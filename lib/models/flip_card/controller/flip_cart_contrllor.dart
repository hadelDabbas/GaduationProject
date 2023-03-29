import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/cart.dart';

class flipCartController extends GetxController{
   final levalNum=[6,8,12];
   final currentLeval=6.obs;
   final openCart=<Cart>[].obs;
   final cartSucc=<Cart>[].obs;
      final cartFilp=<Cart>[].obs;
final seedsCart=
<Cart>
[Cart(photo: 'assets/images/1.png'),Cart(photo: 'assets/images/2.png'),Cart(photo: 'assets/images/5.png'),Cart(photo: 'assets/images/7.png'),Cart(photo: 'assets/images/4.png')];
  @override
  void onInit() {
    super.onInit();
    initia();
  }

void initia(){
  switch(currentLeval.value){
    case 6:
    var list=<Cart>[];
    while(list.length<3){
      var item=seedsCart[Random().nextInt(seedsCart.length)];
      if(!list.any(((element) => element.photo==item.photo))){
    item.hidd='assets/images/d.jpg';
      list.add(item);
      }
    }
      cartFilp.addAll(list);
      cartFilp.addAll(list);
      cartFilp .shuffle();
    break;

  }
}
void onFlip(Cart item){
if(openCart.length==1){
if(openCart[0].photo==item.photo){
  cartSucc.add(item);
    cartSucc.add(openCart[0]);
    openCart.clear();
}else{
      openCart.clear();
}
}else{
  openCart.add(item);
}
}
}