
import 'package:graduationproject/app/model/user.dart';

import '../../../../app/model/refrence.dart';

abstract class IRefrenceRepository {
    Future<List< Reference>> GetAllRefrence();
      Future<List< Reference>> GetRefrencelink(int id);
       Future<bool> DelRefrence(Reference reference);
        Future<bool> AddRefrence(Reference reference); 
 }