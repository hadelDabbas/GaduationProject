
import 'dart:typed_data';

import 'package:graduationproject/app/model/post.dart';

import 'comment.dart';
import 'content.dart';

class  Test {
  int? Id;
   String ?test;
   int ?IdContent;
   Content? content;
 Test(
      {this.Id,
      this.test,
      this.IdContent,
      this.content,
      });

Test.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
   test = json['test'];
    IdContent = json['IdContent'];
   content= json['content'];
 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['id'] = Id;
    json['test'] = test;
    json['IdContent'] = IdContent;
    json['content'] = content;
   
    return json;
  }
}
