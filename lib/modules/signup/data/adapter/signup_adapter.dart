

import 'package:graduationproject/app/model/user.dart';

abstract class IUserRepository {
  Future<bool> regierterPerson(User object);
}