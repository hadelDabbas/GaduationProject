
import 'dart:typed_data';

import 'game.dart';
import 'game_user.dart';

class GameDto {
  Game? game;
 List<GameUser>? gameUser;
GameDto( {
    this. game,
    this.gameUser,
  });

 GameDto.fromJson(Map<String, dynamic> json) {
   game= json[' game'];
  gameUser=json['gameUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json[' game']= game;
   json['gameUser']=gameUser;
    return json;
  }
}
