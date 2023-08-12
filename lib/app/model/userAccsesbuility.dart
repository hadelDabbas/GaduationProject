
import 'dart:typed_data';

import 'package:graduationproject/app/model/library.dart';
import 'package:graduationproject/app/model/user.dart';

import 'Accsessbuility.dart';
import 'content.dart';
import 'group.dart';

class  UserAccessibility{
 int? IdAccessibility;
Accessibility? accessibility;
  int ?IdUser;
  User? user;
UserAccessibility( {
    this.IdAccessibility ,
    this.accessibility,
    this.IdUser,
    this.user,
  });

UserAccessibility.fromJson(Map<String, dynamic> json) {
IdAccessibility=json['IdAccessibility'];
accessibility=json['accessibility'];
 IdUser=json[' idUser'];
 user=json[' user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json[' IdAccessibility']=IdAccessibility;
    json['accessibility']=accessibility;
    json[' user']=user;
    json[' idUser']= IdUser;
    return json;
  }
}
