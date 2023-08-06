
import 'package:graduationproject/app/model/user.dart';

import '../../../../app/model/refrence.dart';
import '../../../../app/model/test.dart';

abstract class ITestRepository {
    Future<List< Test>> GetAllTypeTest();
      Future< Test?> GetTest(int id);
       Future<bool> DelRefrence(Reference reference);
        Future<bool> AddRefrence(Reference reference); 
 }