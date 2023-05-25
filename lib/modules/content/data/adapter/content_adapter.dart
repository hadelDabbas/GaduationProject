import 'package:graduationproject/app/model/content.dart';
import 'package:graduationproject/app/model/user.dart';

import '../../../../app/model/post.dart';

abstract class IContentRepository {
  Future<List<Content>> GetContent();
  Future<bool> DelContent(int id);
   Future<bool>AddContent(Content content);
  }