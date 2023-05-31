
import 'dart:typed_data';

class  Library{
  int? Id;
  String?  libraryName;
  int?IdUser;
Library( {
    this.Id,
    this. libraryName,
    this.IdUser,
  });

Library.fromJson(Map<String, dynamic> json) {
   Id = json['id'];
   libraryName=json[' libraryName'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json[' libraryName']= libraryName;
    return json;
  }
}
