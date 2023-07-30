
import 'dart:typed_data';

import 'package:graduationproject/app/model/library.dart';
import 'package:graduationproject/app/model/user.dart';

import 'content.dart';
import 'group.dart';

class  UserGroup{
  int? IdGroup;
  Group? group ;
  int ?IdUser;
  User? user;
UserGroup( {
 this. IdGroup,
    this.group ,
    this.IdUser,
    this.user,
  });

UserGroup.fromJson(Map<String, dynamic> json) {
   IdGroup = json['IdGroup'];
group =json['group '];
 IdUser=json[' idUser'];
 user=json[' user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['group ']=group ;
    json[' idUser']=IdUser;
    json[' user']=user;
    return json;
  }
}
