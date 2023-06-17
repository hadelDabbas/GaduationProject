import 'package:graduationproject/app/model/user.dart';

import '../../../../app/model/content.dart';
import '../../../../app/model/post.dart';
import '../../../../app/model/postdto.dart';
import '../../../../app/model/userPost.dart';

abstract class IProfileRepository {
  Future<User?> Getprofileuser(int iduser);
  Future <bool>UpdateProfile(User user,int iduser);
 Future<List<PostDto>> GetUserPost(int iduser);
 Future <bool>UpdatePost(int idpost,Post post);
  Future <bool>DeletePost(int idpost);
  Future<Post?>Getpost(int idpost);
  Future<Content?>GetIdContent(String content);
}