import 'package:graduationproject/app/model/user.dart';

import '../../../../app/model/content.dart';
import '../../../../app/model/post.dart';

abstract class IProfileRepository {
  Future<User?> Getprofileuser(int iduser);
  Future <bool>UpdateProfile(User user,int iduser);
 Future<List<Post>> GetUserPost(int iduser);
 Future <bool>UpdatePost(int idpost,Post post);
  Future <bool>DeletePost(int idpost);
  Future<Post?>Getpost(int idpost);
  Future<Content?>GetIdContent(String content);
}