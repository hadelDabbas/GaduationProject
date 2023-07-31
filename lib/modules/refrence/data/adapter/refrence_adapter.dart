
import 'package:graduationproject/app/model/content.dart';
import 'package:graduationproject/app/model/user.dart';

import '../../../../app/model/refrence.dart';
import '../../../../app/model/refrenceDto.dart';

abstract class IRefrenceRepository {
    Future<List< Content>> GetAllRefrence();
      Future<List< Reference>> GetRefrencelink(int id);
       Future<bool> DelRefrence(Reference reference);
        Future<bool> AddRefrence(Reference reference); 
             Future<List< RefrenceDto>> GeAllrefrenceAdmain();
 }