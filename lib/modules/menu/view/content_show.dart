import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/types/gf_animation_type.dart';

import '../controller/menu.dart';

class contentPage extends GetResponsiveView <HomeController>{
static const listcontent = ['History', 'Global', 'Math', 'Sport'];
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(children: [
                     Container(
  width: 700,
  child: GFAnimation(
    controller: controller.ancontroller,
    slidePosition: controller. offsetAnimation,
    type: GFAnimationType.slideTransition,
    child: Row(
      children: [
        Image.asset(
          'assets/images/12.png',
          width: 50,
          height: 40,
        ),
        Text('Home Page',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,
          color: Colors.blueGrey,fontFamily: "Pacifico"
        ),)
      ],
    ),
  ),
),
                Container(
                  height: 50,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => buildContent(listcontent[index]),
                     separatorBuilder: (context,_)=>SizedBox(width: 6,),
                      itemCount: listcontent.length),
                ),
       ]),
    );

  }
  Widget buildContent(String content) => Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Container(
  
        width: 100,
  
        height: 40,
  
        decoration: BoxDecoration(
  
           color: Color.fromARGB(255, 248, 150, 153),
  
          borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(content,style: TextStyle(color: Colors.white,
            fontWeight: FontWeight.bold
            ),),
          ),
  
      ),
);
}