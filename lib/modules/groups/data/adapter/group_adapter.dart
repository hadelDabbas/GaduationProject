import 'package:graduationproject/app/model/group.dart';

abstract class  IGroupRepository {
  Future <List<Group>> GetAllGroup();
   Future <bool> AddGroup(Group group);
   Future <bool> DeleteGroup(int idgroup);
   Future <bool> UpdateGroup(int idgroup,Group group);
}