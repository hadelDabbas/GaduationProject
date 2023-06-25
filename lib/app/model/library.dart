
import 'dart:typed_data';

class  Library{
  int? Id;
  String?  libraryName;
  String? libraryAddress ;
Library( {
    this.Id,
    this. libraryName,
    this.libraryAddress,
  });

Library.fromJson(Map<String, dynamic> json) {
   Id = json['id'];
   libraryName=json[' libraryName'];
 libraryAddress=json[' libraryAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json[' libraryName']= libraryName;
    json[' libraryAddress']= libraryAddress;
    return json;
  }
}
