import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/packet_controller.dart';

class PacketPageView extends GetResponsiveView <PacketController> {
  PacketController controller =Get.put(PacketController());
  List<int>values=[2,6,2,6];
  @override
  Widget builder() {
    return Container(
      
      child: Column(
        children: [
          Container(
                  height: 35, width: 170,
                              decoration:BoxDecoration(borderRadius: BorderRadius.circular(15),
                               color:Colors.blueGrey,
                                         ) ,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Text(' Remiming :', style: TextStyle(color: Colors.white,
                 decoration: TextDecoration.none,
                 fontSize: 18
                 ),),
                Obx(() => Text(controller.reminning.value.toString(), style: TextStyle(color: Colors.white,
                 decoration: TextDecoration.none,
                 fontSize: 18),),)
                 
              ],
            ),
          ),
            // Container( 
            //                    height: 35, width:35,
            //                   decoration:BoxDecoration(borderRadius: BorderRadius.circular(15),
            //                    color:Colors.blueGrey,
            //                              ) ,
            //                  child: Row(mainAxisSize: MainAxisSize.min,
            //                   children: [
            //         Obx(() => Center(
            //        child: Text(controller.reminning.value.toString(),
            //        style: TextStyle(
            //        color: Colors.white,  ),),  )),
            //          Text(' : Timer', style: TextStyle(
            //                    color: Colors.white))
            //       ],),
            //              ),
        Center(
          child: Wrap(
              children:
              controller.listpacket.map((e) => shap(e.photo,e.hidd,e.index,e.rotate)).toList(),
            ),
        ),
        ],
      ),

    );
    
    }
    Widget shap(String url1,String url2,int index,int rot){
      return  Material(
        child: InkWell(
          onTap: (){
            if(  controller.prev.value==0){
                controller.prev.value=index;
            }else if(  controller.prev.value!=0 &&   controller.last.value==0){
                controller.last.value=index;
    if(controller.prev.value ==controller.last.value){
                print('true');
                controller.result.value=1;
                // controller.saveindex.value=index;
                // controller.reminning.value+=1;
              } else{
               controller.prev.value=0;
               controller.last.value=0; 
               print('False');
              }
            } 
          },
          child:
          Obx(() =>  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blueGrey,width: 3)
              ),
             child:
             // controller.result.value!=1 && index!=controller.saveindex.value?
                  
             controller.viewpacket.value==0 && controller.reminning.value!=3?
              Image.asset(url2): Image.asset(url1),
              
            ),
          ),
         ) ),
      );

    }
    }
  
    class Packet{
  String photo;
  String hidd;
  int  index;
  int rotate;
 // int  previous;
  Packet({required this.photo,required this.hidd,required  this.index,required this.rotate});
}