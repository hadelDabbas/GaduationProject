
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/user.dart';

import 'adapter/password_adapter.dart';

class PasswordRepository implements IPasswordRepository {
  final _dio = Get.find<Dio>();
  @override
  Future<bool> resetPassuser(String email, String newPassword) async {
    var result = await _dio.put('https://localhost:7252/api/User/ChangePassword',
        queryParameters: {"Email": email, "password": newPassword});
    return result.statusCode == 200;
  }

}