import 'package:get/get.dart';
import 'package:graduationproject/app/model/user.dart';
import 'package:graduationproject/routes/app_pages.dart';

import '../../../api/storage/storge_service.dart';
import '../../sheard/auth_service.dart';
import '../data/signin_repository.dart';

const String KeyData = "AuthData";

class SignIncontroller extends GetxController {
  var passtoggle = true.obs;
  final userSingn = User().obs;
  RxBool hidePassword = true.obs;
  final userRepo = SiginRepository();
  final text='siginhelp'.tr;
  final stroge = Get.find<StorageService>();
  final auth = Get.find<AuthService>();
  var email = ''.obs;
  //  var useruses=userUsed().obs;
  var password = ''.obs;
  Future<void> SignIn() async {
    await auth.logIn(email.value, password.value);
    Get.rootDelegate.toNamed(Routes.home);
  }
}
