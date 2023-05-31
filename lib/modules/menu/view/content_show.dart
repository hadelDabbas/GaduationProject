import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/types/gf_animation_type.dart';

import '../controller/menu.dart';

class contentPage extends GetResponsiveView <HomeController>{
  HomeController controller=Get.put(HomeController());
static const listcontent = ['History', 'Global', 'Math', 'Sport'];
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Row(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text('Home Page',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,
              color: Colors.blueGrey,fontFamily: "Pacifico"
            ),),
          ),
        ),
        SizedBox(width: 240,),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Align(
                  alignment: Alignment.topRight,
                   child: GFButton(
                     shape: GFButtonShape.pills,
                    color: Colors.blueGrey,
                    onPressed: () {
                        Get.dialog(
                          Align(alignment: Alignment.topRight,
                          child: Container(
                            width:120,height:900 ,  decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                         border: Border.all(color: Colors.blueAccent)
                        ),
                            child:
                          SingleChildScrollView(
                            child: Column(children: [
                               SizedBox(height: 10,),
                              Align(alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Contents ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,
                                  fontFamily: "Pacifico",color: Colors.blueGrey,decoration: TextDecoration.none),),
                                )),
                              Wrap(
                                 children: controller.Contents.map((element) => buildContent(element.typeName.toString(), element.Id!)).toList(),
                              )
                               
                            ],),
                          )
                          ,),)
                        );
                    },
                    text: "Contents",
                    textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                   
                               ),
                 ),
               ),
//                      Container(
//   width: 700,
//   child: GFAnimation(
//     controller: controller.ancontroller,
//     slidePosition: controller. offsetAnimation,
//     type: GFAnimationType.slideTransition,
//     child: Row(
//       children: [
//         Image.asset(
//           'assets/images/12.png',
//           width: 50,
//           height: 40,
//         ),
//         Text('Home Page',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,
//           color: Colors.blueGrey,fontFamily: "Pacifico"
//         ),)
//       ],
//     ),
//   ),
// ),
                // Container(
                //   height: 50,
                //   child: ListView.separated(
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (context, index) => buildContent(controller.Contents[index].typeName.toString(),controller.Contents[index].Id!),
                //      separatorBuilder: (context,_)=>SizedBox(width: 6,),
                //       itemCount: controller.Contents.length),
                // ),
       ]),
    );

  }
  Widget buildContent(String content,int idcontentt) => Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Material(
    child: InkWell(
      onTap: () {
        controller.idcontent!=idcontentt;
      controller.GetpostByType()  ; 

      },
      child: Container(
      
            width: 100,
      
            height: 40,
      
            decoration: BoxDecoration(
      
               color: Color.fromARGB(255, 248, 150, 153),
      
              borderRadius: BorderRadius.circular(14)),
              child: Center(
                child: Text(content,style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.bold
                ),),
              ),
      
          ),
    ),
  ),
);
}