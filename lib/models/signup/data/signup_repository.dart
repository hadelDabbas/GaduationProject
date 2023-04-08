// class InfluencerRepository extends IInfluencerRepository {
//   final _dio = Get.find<Dio>();
//   @override
//   Future<bool> Addperson(Person object) async {
//     var data = await _dio.post(
//       'https://localhost:7192/api/Infulonser/Addperson',
//       data: jsonEncode(object.toJson()),
//       options: Options(headers: {
//         HttpHeaders.contentTypeHeader: "application/json",
//       }),
//     );
//     if (data.statusCode == 200) {
//       return true;
//     } else {
//       print(data.statusMessage);
//     }
//     return false;
//   }}