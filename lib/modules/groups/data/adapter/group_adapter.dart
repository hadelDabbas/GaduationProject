import 'package:graduationproject/app/model/group.dart';

import '../../../../app/model/content.dart';
import '../../../../app/model/postdto.dart';
import '../../../../app/model/user.dart';

abstract class  IGroupRepository {
  Future <List<Group>> GetAllGroup();
   Future <bool> AddGroup(Group group);
   Future <bool> DeleteGroup(int idgroup);
   Future <bool> UpdateGroup(int idgroup,Group group);
   Future<Group?>GetGroup(int idgroup);
   Future<List<User>>GetMembers(int idgroup);
   Future<bool>AddMember(int idperson,int idGroup);
    Future<List<PostDto>> GetAllPost(int idgroup);
    Future<List<Content>> GetContent();
}