
// import 'package:dio/dio.dart';
// import 'package:get/get.dart';
// import 'package:graduationproject/app/model/user.dart';

// import 'adapter/password_adapter.dart';

// class PasswordRepository implements IPasswordRepository {
//   final _dio = Get.find<Dio>();
//   @override
//   Future<List<User>> getdata() async {
//     var result = await _dio.get('https://localhost:7192/api/Infuloncer');
//     var list = <User>[];
//     for (var item in result.data) {
//       list.add(User.fromJson(item));
//     }
//     return list;
//   }
  
//   @override
//   Future<bool> getEmail(String email) async {
//     var result = await _dio.get('https://localhost:7192/api/Auth/GetEmail',
//         queryParameters: {"email": email});
//        return result.statusCode == 200;
//   }

//   @override
//   Future<bool> resetPassuser(int idCompany, String newPassword) async {
//     var result = await _dio.put('https://localhost:7192/api/Company/Password',
//         queryParameters: {"Id": idCompany, "password": newPassword});
//     return result.statusCode == 200;
//   }

// }