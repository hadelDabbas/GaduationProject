import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/MenuGame/controller/menu_game_controller.dart';

import 'math4n.dart';
import 'math7.dart';
import 'mathn1.dart';

class DefineMath extends GetResponsiveView<MenuGameController> {
  MenuGameController controller=Get.put(MenuGameController());
  DefineMath({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: const AssetImage(
                      'assets/images/d.png',
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.25), BlendMode.modulate))),
            child: Column(
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back_ios,
                          size: 20, color: Colors.grey),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 80, 8, 8),
                  child: Center(
                      child: Text(
                    'Math Game',
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: "Pacifico",
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 170,
                      width: 170,
                      child: Image.asset('assets/images/10.png')),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                         switch(controller.numberlevel.value){
                case 1:
                  Get.to(MathNew11PageView());
                    controller.onReady();
                  break;
                   case 2:
                  Get.to(MathNew4PageView());
                    controller.onReady();
                  break;
                    case 3:
                  Get.to(MathNew7PageView());
                    controller.onReady();
                  break;
                 default:
                    Get.to(MathNew7PageView());
                  break;
              }
            
                   
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color.fromARGB(255, 62, 153, 65),
                            width: 2)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Are You Want To Start ?',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black87),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
