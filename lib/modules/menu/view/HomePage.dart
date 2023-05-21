import 'dart:html';
import 'dart:js';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/animation/gf_animation.dart';
import 'package:getwidget/types/gf_animation_type.dart';
import 'package:graduationproject/modules/MenuGame/Menu_game.dart';
import 'package:graduationproject/modules/MenuGame/view/splash_game.dart';
import 'package:graduationproject/modules/foucs/view/foucs1.dart';
import 'package:graduationproject/modules/groups/view/show_group.dart';
import 'package:graduationproject/modules/letter_game/view/letter1.dart';
import 'package:graduationproject/modules/menu/controller/menu.dart';
import 'package:graduationproject/modules/menu/view/post.dart';
import 'package:graduationproject/modules/profile/view/profile.dart';
import 'package:graduationproject/modules/settings/view/settings.dart';

class HomePage extends GetResponsiveView<HomeController> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        // backgroundColor: Colors.blue,
        backgroundColor: Colors.white70,
        bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.white70,
            height: 60,
            buttonBackgroundColor: Colors.blueGrey,
            animationCurve: Curves.bounceInOut,
            index: controller.page.value,
            color: Colors.blueGrey,
            animationDuration: Duration(milliseconds: 300),
            onTap: (index) {
              controller.page.value = index;
            },
            items: [
              Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
              ),
              Icon(
                Icons.games,
                color: Colors.white,
              ),
              Icon(
                Icons.home,
                color: Colors.white,
              ),
              Icon(
                Icons.search,
                color: Colors.white,
              ),
              Icon(
                Icons.group,
                color: Colors.white,
              ),
              Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
      
              Obx(() => getselectedwidget(index: controller.page.value))
            ],
          ),
        ));
  }
}

Widget getselectedwidget({required int index}) {
  Widget widget;
  switch (index) {
    case 0:
      widget = Profileview();
      break;
    case 1:
      widget = MenuGamePageView();
      break;
    case 2:
      widget = postPage();

      break;
    case 3:
      widget = Container(
        child: Text('0'),
      );
      break;
    case 4:
      widget = ShowGroupPageView();
      break;
    default:
      widget = SettingPageView();

      break;
  }
  return widget;
}

