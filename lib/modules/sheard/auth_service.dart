import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/user.dart';

import '../../api/storage/storge_service.dart';

const String KeyData = "AuthData";

class AuthService {
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

  Future<User?> logIn(String email, String password) async {
    var result = await _dio.get('https://localhost:7252/api/User/SignIn',
        queryParameters: {"email": email, "password": password});
    print(result.data);
    if (result.statusCode == 200) {
      var data = User.fromJson(result.data as Map<String, dynamic>);
      stroge.saveData(KeyData, jsonEncode(data.toJson()));
      return data;
    }
    return null;
  }

  Future<bool> signUp(User object) async {
    var result = await _dio.post('https://localhost:7252/api/User/AddUser',
        data: object.toJson());
    if (result.statusCode == 200) {
      var data = await logIn(object.Email!, object.Password!);
      stroge.saveData(KeyData, jsonEncode(data!.toJson()));
      return true;
    }
    return false;
  }
}
