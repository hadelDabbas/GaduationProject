
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/post.dart';

import '../../../Utile/utilExpation.dart';
import 'adapter/addpost_adapter.dart';

class AddpostRepository implements IAddpostRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<bool> AddpostUser(Post post, int iduser) async {
    var data=  await _dio.post('',data: post.toJson());
       if (ExpastionStatus(data.statusCode!)) {
      return true;
    } else
    return false;
  }
  }