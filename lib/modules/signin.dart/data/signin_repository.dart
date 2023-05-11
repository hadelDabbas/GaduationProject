import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/user.dart';

import 'adapter/sigin_adapter.dart';

class SiginRepository implements ISigninRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<User?> SignInUser(String email, String Password) async {
    var result =
        await _dio.get('https://localhost:7252/api/User/SignIn'
        ,  queryParameters: {"email": email, "password": Password});
        if(result==200){
           print(result);
     var data =
              User.fromJson(result.data['data'] as Map<String, dynamic>);
    return data;
        }
    return null;
  }
}