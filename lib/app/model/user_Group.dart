import 'package:graduationproject/app/model/user.dart';

import 'group.dart';

class UserGroup {
  int? IdGroup;
  Group? group;
  int? IdUser;
  User? user;
  UserGroup({
    this.IdGroup,
    this.group,
    this.IdUser,
    this.user,
  });

  UserGroup.fromJson(Map<String, dynamic> json) {
    IdGroup = json['idGroup'];
    group = json['group '];
    IdUser = json['idUser'];
    user = json[' user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['idGroup'] = IdGroup;
    json['idUser'] = IdUser;
    json['id'] = 0;
    return json;
  }
}
