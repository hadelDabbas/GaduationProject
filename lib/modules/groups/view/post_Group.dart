import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/group_controller.dart';

class PostGrpoup extends GetResponsiveView<GroupController> {
  @override
  GroupController controller = Get.put(GroupController());

  PostGrpoup({super.key});
  @override
  Widget builder() {
    return const Scaffold();
  }
}
