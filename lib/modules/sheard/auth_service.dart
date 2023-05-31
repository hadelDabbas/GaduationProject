import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduationproject/app/model/user.dart';

import '../../api/storage/storge_service.dart';
const  String KeyData="AuthData";
class AuthService{
    final _dio = Get.find<Dio>();
  final stroge = Get.find<StorageService>();
    bool isAuth() => stroge.containsKey(KeyData);
  User? getDataFromStorage() {
    if (stroge.containsKey(KeyData)) {
      var data = jsonDecode(stroge.getData(KeyData)!) as dynamic;
        return User.fromJson(data as Map<String, dynamic>);
    }
    return null;
  }
    Future<Object?> logIn(String email, String password) async {
    var result = await _dio.get('https://localhost:7192/api/Auth/GetAuth',
        queryParameters: {"email": email, "password": password});
    print(result.data);
    if (result.statusCode == 200) {
      
          var data =
            User.fromJson(result.data['data'] as Map<String, dynamic>);
          stroge.saveData('type', jsonEncode('person'));
          stroge.saveData(KeyData, jsonEncode(data.toJson()));
          return data;
    }
    return null;
  }

}