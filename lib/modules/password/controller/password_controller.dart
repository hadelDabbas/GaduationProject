import 'package:get/get.dart';
import 'package:graduationproject/modules/menu/view/HomePage.dart';

import '../data/password_repostiry.dart';

class passwordController extends GetxController{
  var passtoggle = true.obs;
  RxBool hidePassword = true.obs;
  var newPassword=''.obs;
  var confirmpassword=''.obs;
  final pass=PasswordRepository();
  var email = Get.arguments;
   Future Confirmpass()async{
     var data=pass.resetPassuser(email, newPassword.value);
     if(data==true){
      print(true);
      Get.to(HomePage());
     }else{
      print('false');
     }
   }
}