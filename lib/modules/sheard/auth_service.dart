// class AuthService{
//     final _dio = Get.find<Dio>();
//   final stroge = Get.find<StorageService>();
//   Object? getDataFromStorage() {
//     if (stroge.containsKey('AuthData')) {
//       var data = jsonDecode(stroge.getData('AuthData')!) as dynamic;
//         return Person.fromJson(data as Map<String, dynamic>);
//     }
//     return null;
//   }
//     Future<Object?> logIn(String email, String password) async {
//     var result = await _dio.get('https://localhost:7192/api/Auth/GetAuth',
//         queryParameters: {"email": email, "password": password});
//     print(result.data);
//     if (result.statusCode == 200) {
      
//           var data =
//             Person.fromJson(result.data['data'] as Map<String, dynamic>);
//           stroge.saveData('type', jsonEncode('person'));
//           stroge.saveData('AuthData', jsonEncode(data.toJson()));
//           return data;
//     }
//     return null;
//   }
//   class AuthMiddlware extends GetMiddleware {
//   var storge = Get.put(StorageService());
//   @override
//   RouteSettings? redirect(String? route) => !storge.containsKey('type')
//       ? const RouteSettings(name: Routes.Intro)
//       : null;
// }
// }