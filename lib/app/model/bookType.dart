
import 'dart:typed_data';

class  BookType{
  int? Id;
  String?  bookType;
BookType( {
    this.Id,
    this. bookType,
  });

 BookType.fromJson(Map<String, dynamic> json) {
   Id = json['id'];
   bookType=json['bookType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['bookType']=bookType;
    return json;
  }
}
