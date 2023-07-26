
import 'package:graduationproject/app/model/user.dart';

import '../../../../app/model/refrence.dart';

abstract class IRefrenceRepository {
    Future<List< Reference>> GetAllRefrence();
      Future< Reference?> GetRefrence(int id);

 }