
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduationproject/app/model/game.dart';
import 'package:graduationproject/app/model/content.dart';

import '../../../app/model/game_user.dart';
import 'adapter/game-adapter.dart';

class GameRepository implements IGameRepository {
  final _dio = Get.find<Dio>();


  @override
  Future<bool> updateUserGame( int iduserGame,GameUser gameUser) async{
     var result = await _dio.put('https://localhost:7252/api/GameUser/$iduserGame',
        data: gameUser.toJson());
    return result.statusCode == 200;
  }

  @override
  Future<bool> DelContent(int id) {
    // TODO: implement DelContent
    throw UnimplementedError();
  }

  @override
  Future<List<GameUser>> Getgame(int iduser)async {
     var result =
        await _dio.get('https://localhost:7252/api/GameUser/$iduser');
    print(result);
    var list = <GameUser>[];
    for (var item in result.data) {
      list.add(GameUser.fromJson(item));
    }
    return list;
  }
}