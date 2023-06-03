
import 'dart:typed_data';

import 'package:graduationproject/app/model/library.dart';
import 'package:graduationproject/app/model/user.dart';

import 'content.dart';

class  Group{
  int? Id;
  String? groupName ;
  String? Description;
  int ?IdUser;
  User? user;
  int? IdContent;
   Content? content;
    Uint8List? Image ;
Group( {
    this.Id,
  this.Description,
    this.groupName ,
    this.IdUser,
    this.user,
    this.IdContent,
    this.content,
    this.Image
  });

Group.fromJson(Map<String, dynamic> json) {
   Id = json['id'];
groupName =json['groupName '];
Description=json['description '];
 IdUser=json[' idUser'];
 user=json[' user'];
IdContent= json['idContent'];
 content = json['content'];
  Image = json['image'] == null
        ? null
        : Uint8List.fromList(List<int>.from(json['image']!));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
  json['description']=Description;
    json['groupName ']=groupName ;
    json[' idUser']=IdUser;
    json[' user']=user;
    json['idContent']=IdContent;
    json['content']=content;
        json['image'] = Image == null ? null : Uint8List.fromList(Image!);
    return json;
  }
}
