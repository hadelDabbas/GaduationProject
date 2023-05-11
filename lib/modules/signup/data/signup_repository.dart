
// import 'package:get/get.dart';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../app/model/user.dart';
import 'adapter/signup_adapter.dart';



class UserRepository extends IUserRepository {
  final _dio = Get.find<Dio>();
  @override
  Future<bool> regierterPerson(User object) async {
    var data = await _dio.post('https://localhost:7192/api/Company/AddCompany',
        data: object.toJson());
    if (data.statusCode == 200) {
      return true;
    } else
      print(data.statusMessage);
    return false;
  }}