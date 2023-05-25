import 'package:graduationproject/app/model/user.dart';

import '../../../../app/model/post.dart';

abstract class IAddpostRepository {
  Future<bool> AddpostUser(Post post,int iduser);
  }