import 'package:get/get.dart';

import '../controller/signup.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
  }
}