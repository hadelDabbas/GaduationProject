
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/group.dart';

import '../../../Utile/utilExpation.dart';
import 'adapter/group_adapter.dart';

class GroupRepository implements IGroupRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<bool> AddGroup(Group group)async {
 var result = await _dio.post('https://localhost:7192/api/Content',
        data: group.toJson());
    return result.statusCode == 200;
  }

  @override
  Future<bool> DeleteGroup(int idgroup)async {
   var result = await _dio.delete('https://localhost:7192/api/Content',
        queryParameters: {'id': idgroup});
    return result.statusCode == 200;
  }

  @override
  Future<List<Group>> GetAllGroup()async {
  var result = await _dio.get('');
    print(result);
    var list = <Group>[];
    for (var item in result.data) {
      list.add( Group.fromJson(item));
    }
    return list;
  }

  @override
  Future<bool> UpdateGroup(int idgroup, Group group)async {
   var result= await _dio.put('path',
    data: group.toJson(),
   );
 if(ExpastionStatus(result.statusCode!)){
          return true;
        }else{
          return false;
        }
  }


}