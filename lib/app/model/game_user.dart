
import 'dart:typed_data';

import 'package:graduationproject/app/model/user.dart';

import 'game.dart';

class GameUser {
  int? Id;
  String?  userLevel;
 int? IdGame;
 Game? game;
 int ?IdUser;
 User? user ;
  int ?Score;
GameUser( {
    this.Id,
   this.IdGame,
   this.game,
   this.IdUser,
   this.user,
   this.userLevel,
   this.Score,
  });

GameUser.fromJson(Map<String, dynamic> json) {
   Id = json['id'];
 IdGame=json['IdGame'];
game=json['game'];
IdUser=json['IdUser'];
user=json['user'];
userLevel=json['userLevel'];
Score=json['Score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['IdGame']=IdGame;
   json['game']=game;
      json['IdUser']=IdUser;
         json['user']=user;
            json['userLevel']=userLevel;
             json['Score']=Score;
    return json;
  }
}
