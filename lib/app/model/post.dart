import 'dart:convert';
import 'dart:typed_data';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post(
      {this.Id,
      this.Description,
      this.IdType,
      this.IdUser,
      this. Image,
      this.dateTime,
     });

  int? Id;
  String? Description;
  DateTime? dateTime;
  int? IdType;
  int? jobId;
  Uint8List? Image;
  int?IdUser;
  factory Post.fromJson(Map<String, dynamic> json) => Post(
      Id: json["id"],
     Description: json["description"],
      dateTime: DateTime.parse(json["dateTime"].toString()),
     IdType: json["  idType"],
      IdUser: json[" idUser"],
      Image: json['image'] == null
          ? null
          : Uint8List.fromList(
              List<int>.from(json['image']! as List<dynamic>)));

  Map<String, dynamic> toJson() => {
        "id": Id == null ? 0 : Id,
        "description": Description,
        "dateTime": dateTime == null ? null : dateTime!.toIso8601String(),
        "idType": IdType == null ? null : IdType,
        "idUser":  IdUser == null ? null :  IdUser,
        "image": Image == null ? null : Uint8List.fromList(Image!),
      };
}
