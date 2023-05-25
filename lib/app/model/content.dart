
import 'dart:typed_data';

class  Content{
  int? Id;
  String? content;
  int?IdUser;
Content( {
    this.Id,
    this.content,
    this.IdUser,
  });

 Content.fromJson(Map<String, dynamic> json) {
   Id = json['id'];
   content=json['content'];
   IdUser = json['iduser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['content']=content;
    json['iduser'] = IdUser;
    return json;
  }
}
