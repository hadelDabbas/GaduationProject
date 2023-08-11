import 'package:graduationproject/app/model/content.dart';
import 'package:graduationproject/app/model/game.dart';
import 'package:graduationproject/app/model/user.dart';

import '../../../../app/model/game_user.dart';
import '../../../../app/model/post.dart';

abstract class IGameRepository {
  Future<List<GameUser>> Getgame(int iduser);
  Future<bool> DelContent(int id);
   Future<bool>updateUserGame(int iduserGame ,GameUser gameUser);
  }