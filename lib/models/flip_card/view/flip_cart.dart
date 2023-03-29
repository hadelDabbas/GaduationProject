import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/models/flip_card/controller/flip_cart_contrllor.dart';

import '../data/cart.dart';

class FlipCart extends GetResponsiveView<flipCartController>{
  Widget builder(){
    return Column(
      children: [
        Text('Hello'),
        SizedBox(width: screen.width/4,),
        Obx(()=>Wrap(
        children: controller. cartFilp.map((e) 
        {print(e.index); 
        return Card(child: InkWell(onTap: (() {
          controller.onFlip(e);
        }),child:Obx(()=>
        controller.cartSucc.any((element) => element.photo==e.photo)||
        controller.openCart.any((element) => element.photo==e.photo)?
        Image.asset(e.photo!,width: 100,height: 50,): 
        Image.asset(e.hidd!,width: 100,height: 50,)),));}
        ).toList()
        ))
      ],
    );
  }
}