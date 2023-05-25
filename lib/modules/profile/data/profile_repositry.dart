import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/user.dart';

import '../../../Utile/utilExpation.dart';
import '../../../app/model/content.dart';
import '../../../app/model/post.dart';
import 'adapter/profile_adapter.dart';

class ProfileRepository implements IProfileRepository {
  final _dio = Get.find<Dio>();
      @override
      Future<User?> Getprofileuser(int iduser) async{
     var result= await _dio .get('https://localhost:7252/api/User/GetUser/$iduser',
     queryParameters: {"id":iduser} );
     if(ExpastionStatus(result.statusCode!)){
      var data= User.fromJson(result.data as Map<String, dynamic>);
      return data;
     }else{
      return null;
     }
      }
      
        @override
        Future<bool> UpdateProfile(User user,int iduser)async {
        var result= await _dio .put('https://localhost:7252/api/User/GetUser/$iduser',
        data: user.toJson(),);
        if(ExpastionStatus(result.statusCode!)){
          return true;
        }else{
          return false;
        }
        } 
    
     @override
  Future<List<Post>> GetUserPost(int iduser) async {
    var result = await _dio
        .get('https://localhost:7192/api/Infulonser/GetAllPosts/$iduser');
    var list = <Post>[];
    if (result.statusCode == 200) {
      for (var item in result.data) {
        list.add(Post.fromJson(item));
      }
    }
    return list;
  }
  
  @override
  Future<bool> UpdatePost(int idpost, Post post)async {
   var result= await _dio.put('path',
    data: post.toJson(),
   );
 if(ExpastionStatus(result.statusCode!)){
          return true;
        }else{
          return false;
        }

  }
  
  @override
  Future<bool> DeletePost(int idpost)async {
    var result= await _dio.delete('path',);
 if(ExpastionStatus(result.statusCode!)){
       return true;
  }else{
    return false;
  }

  
}

  @override
  Future<Post?> Getpost(int idpost)async {
    var result=await _dio.get('path');
    if(ExpastionStatus(result.statusCode!)){
    var data =
              Post.fromJson(result.data as Map<String, dynamic>);
              return data;}
              else{
                return null;
              }}
              
                @override
                Future< Content?> GetIdContent(String content)async {
               var result= await _dio.get("path",
               queryParameters: {'content':content}
               );
                if(ExpastionStatus(result.statusCode!)){
             var data =
              Content.fromJson(result.data as Map<String, dynamic>);
              return data;  }
              else{
                return null;
              }
                }
}
  