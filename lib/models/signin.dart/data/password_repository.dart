// class PasswordRepository implements IPasswordRepository {
//   final _dio = Get.find<Dio>();
//   @override
//    Future<List<>> getdataAllperson() async {
//     var result = await _dio.get('https://localhost:7192/api/');
//     var list = <>[];
//     for (var item in result.data) {
//       list.add(.fromJson(item));
//     }
//     return list;
//   }
  
//   @override
//   Future<bool> resetPassWord(int id, String newPassword) async {
//     var result = await _dio.put('https://localhost:7192/api/',
//         queryParameters: {"Id": id, "password": newPassword});
//     return result.statusCode == 200;
//   }
// }