
import 'dart:typed_data';

import 'bookType.dart';
import 'bookType.dart';
class   Writer{
  int? Id;
  String?writerName;
 Writer( {
    this.Id,
   this.writerName,
  });

  Writer.fromJson(Map<String, dynamic> json) {
   Id = json['id'];
 writerName =json['writerName '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['writerName']=writerName;
    return json;
  }
}
