
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/api/storage/storge_service.dart';
import 'package:graduationproject/app/model/user.dart';

import '../../sheard/auth_service.dart';
import 'adapter/password_adapter.dart';

class PasswordRepository implements IPasswordRepository {
  final _dio = Get.find<Dio>();
    final _auth = Get.find<AuthService>();
  @override
  Future<bool> resetPassuser(String email, String newPassword) async {
var user=_auth.getDataFromStorage();
if(user!.Email==email){
    var result = await _dio.put('https://localhost:7252/api/User/ChangePassword',
        queryParameters: {"id": user.Id, "password": newPassword});
    return result.statusCode == 200;
}
return false;
  }

}