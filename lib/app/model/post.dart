import 'dart:convert';
import 'dart:typed_data';

import 'package:graduationproject/app/model/user.dart';

import 'content.dart';
import 'group.dart';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post(
      {this.Id,
      this.Description,
   this.content,
      this.IdUser,
      this. Image,
      this.dateTime,
      this.IdContent,
      this.IdGroup,
      this.group,
      this.user
     });

  int? Id;
  String? Description;
  DateTime? dateTime;
  Uint8List? Image;
  int?IdUser;
  int? IdContent;
   Content? content;
   int? IdGroup;
    Group? group;
    User? user ;
  factory Post.fromJson(Map<String, dynamic> json) => Post(
      Id: json["id"],
      user:json['user'],
      content: json['content'],
        IdContent: json['  IdContent'],
        IdGroup: json['IdGroup'],
        group:json[' group'],
     Description: json["description"],
      dateTime: DateTime.parse(json["dateTime"].toString()),
      IdUser: json[" idUser"],
      Image: json['image'] == null
          ? null
          : Uint8List.fromList(
              List<int>.from(json['image']! as List<dynamic>)));

  Map<String, dynamic> toJson() => {
        "id": Id == null ? 0 : Id,
        "description": Description,
        "dateTime": dateTime == null ? null : dateTime!.toIso8601String(),
            "IdGroup":  IdGroup == null ? null : IdGroup,
            "content":content,
            'group':group,
            'user':user,
        "idUser":  IdUser == null ? null :  IdUser,
        "image": Image == null ? null : Uint8List.fromList(Image!),
      };
}
