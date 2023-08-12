
import 'dart:typed_data';

import 'package:graduationproject/app/model/post.dart';

import 'comment.dart';
import 'content.dart';

class  Reference {
  int? Id;
  String?referenceName;
  String?  Link;
   int ?IdContent;
   Content? content;
   Reference(
      {this.Id,
      this.referenceName,
      this. Link,
      this.IdContent,
      this.content,
      });

 Reference.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
   referenceName = json['referenceName'];
    Link= json[' Link'];
    IdContent = json['IdContent'];
   content= json['content'];
 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['id'] = Id;
    json['referenceName'] = referenceName;
    json[' Link'] =  Link;
    json['IdContent'] = IdContent;
    json['content'] = content;
   
    return json;
  }
}
