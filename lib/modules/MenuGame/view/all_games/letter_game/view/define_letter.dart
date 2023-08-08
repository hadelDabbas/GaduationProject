import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/menu_game_controller.dart';
import 'letter4.dart';
import 'letter6.dart';
import 'letter7.dart';

class splashscreenLetter extends GetResponsiveView< MenuGameController> {
   MenuGameController controller=Get.put( MenuGameController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
          child:
           Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => Get.back(),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(
            height: 180,
          ),
          SizedBox(
            width: 150,
            height: 150,
            child: Image.asset('assets/images/letter.png'),
          ),
          TextButton(
            onPressed: () {
              switch(controller.numberlevel.value){
                case 1:
                  Get.to(Letter4pageview());
                    controller.onReady();
                  break;
                   case 2:
                  Get.to(Letter6pageview());
                    controller.onReady();
                  break;
                 default:
                  Get.to(Letter7pageview());
                    controller.onReady();
                  break;
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: const Color.fromARGB(255, 62, 153, 65), width: 2)),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Welcom to Letter Play ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black87),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
