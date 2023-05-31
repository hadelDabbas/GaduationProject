import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/group_controller.dart';

class PostGrpoup extends GetResponsiveView<GroupController> {
  GroupController controller = Get.put(GroupController());
  @override
  Widget builder() {
    return Scaffold();
    
  }}