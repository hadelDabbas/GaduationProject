
import 'dart:typed_data';

class  Content{
  int? Id;
  String? typeName;
  int?IdUser;
Content( {
    this.Id,
    this.typeName,
    this.IdUser,
  });

Content.fromJson(Map<String, dynamic> json) {
   Id = json['id'];
   typeName=json['typeName'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['typeName']=typeName;
    return json;
  }
}
