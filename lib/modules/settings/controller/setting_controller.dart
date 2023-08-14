import 'package:get/get.dart';
import 'package:graduationproject/app/model/user.dart';

import '../../../api/storage/storge_service.dart';
import '../../sheard/auth_service.dart';
import '../data/setting-repository.dart';

class SettingController extends GetxController {
  final userSingn = User().obs;
  static const String KeyData = "AuthData";
  final stroge = Get.find<StorageService>();
  final text = 'settingHelp'.tr;
  final setRepo = SettingRepository();
  final auth = Get.find<AuthService>();
  final user = User().obs;
  final test = false.obs;
  @override
  void onInit() {
    super.onInit();
    GetUser();
    // getUser();
  }

  Future<void> GetUser() async {
    user.value = auth.getDataFromStorage() as User;
//  print(user.value.Email);
  }

  Future<void> getUser() async {
    var s = stroge.getData(KeyData);
    print(s);
  }

  Future<void> DelUser() async {
    await setRepo.Deluser(user.value);
  }
}
