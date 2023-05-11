import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'adapter/sigin_adapter.dart';

class SiginRepository implements ISigninRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<bool> SignInUser(String email, String Password) async {
    var result = await _dio.put('https://localhost:7192/api/',
        queryParameters: {"Email": email, "password": Password});
    return result.statusCode == 200;
  }
}