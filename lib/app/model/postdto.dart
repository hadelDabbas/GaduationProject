
import 'dart:typed_data';

import 'package:graduationproject/app/model/post.dart';

import 'comment.dart';

class PostDto {
  int? Id;
  String? UserName;
  String? GroupName;
  bool? Interaction;
  Post?post;
 // Double? NumberLike;
  Comments? comment;
  Uint8List? UserImage;
  Uint8List? GroupImage;
  PostDto(
      {this.Id,
      this.UserName,
      this.GroupName,
      this.Interaction,
    //  this.NumberLike,
      this.comment,
      this.UserImage,
      this.GroupImage,
      this.post
      });

  PostDto.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    UserName = json['userName'];
    GroupName = json['groupName'];
    Interaction = json['interaction'];
    //NumberLike = json['numberLike'];
    comment = json['comment'];
    UserImage = json['userImage'];
    GroupImage = json[' groupImage'];
post = json[' post'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['id'] = Id;
    json['userName'] = UserName;
    json['groupName'] = GroupName;
    json['interaction'] = Interaction;
    //json['numberLike'] = NumberLike;
    json['comment'] = comment;
    json['userImage'] = UserImage;
    json[' groupImage'] = GroupImage;
        json[' post'] = post;
    return json;
  }
}
