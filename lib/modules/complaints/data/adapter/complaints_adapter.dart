
import 'package:graduationproject/app/model/user.dart';

import '../../../../app/model/complaints.dart';
import '../../../../app/model/refrence.dart';

abstract class IComplaintsRepository {
    Future<List< Complaint>> GetAllComplaint();
      Future<List< Complaint>>  Getcomplaint(int id);
    Future< bool> Putcomplaints(int id,Complaint c);
 }