
import 'dart:typed_data';

class Game {
  int? Id;
  String? GameName;
 String?GameLevel;
Game( {
    this.Id,
    this.GameName,
    this.GameLevel,
  });

 Game.fromJson(Map<String, dynamic> json) {
   Id = json['id'];
  GameName=json['GameName'];
 GameLevel=json['GameLevel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['GameName']=GameName;
   json['GameLevel']=GameLevel;
    return json;
  }
}
