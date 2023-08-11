
import 'dart:typed_data';

class Game {
  int? Id;
  String? GameName;
 String?GameLevel;
  Uint8List? Image;
Game( {
    this.Id,
    this.GameName,
    this.GameLevel,
    this.Image
  });

 Game.fromJson(Map<String, dynamic> json) {
   Id = json['id'];
  GameName=json['GameName'];
 GameLevel=json['GameLevel'];
 Image=json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['GameName']=GameName;
   json['GameLevel']=GameLevel;
   json['Image']=Image;
    return json;
  }
}
