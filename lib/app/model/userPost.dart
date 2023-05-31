
import 'dart:typed_data';

import 'package:graduationproject/app/model/post.dart';
import 'package:graduationproject/app/model/user.dart';

class  UserPost{
  int? Id;
  bool?Interaction ;
   int? IdUser;
  User?user;
  int? IdPost ;
  Post ?post;
 
 UserPost( {
    this.Id,
    this.Interaction,
     this.IdUser,
    this.user,
    this.IdPost,
    this.post,
   
  });
 UserPost.fromJson(Map<String, dynamic> json) {
   Id = json['id'];
   Interaction=json['interaction '];
     IdUser=json[' idUser '];
   user=json['user'];
   IdPost=json[' idPost '];
   post=json[' post '];
 


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json[' interaction']= Interaction;
     json[' idUser ']=IdUser;
    json['user']=user;
    json[' idPost ']=IdPost;
    json[' post ']=post;
   
    return json;
  }
}
