import 'package:graduationproject/app/model/user.dart';

class Complaint {
  int? id;
  String ?complaint;
 int? IdUser;
 User? user;
  Complaint({
    this.id,
    this.complaint,
  });

  Complaint.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    complaint = json['complaint'];
   IdUser = json['IdUser'];
   user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['complaint'] = complaint;
      json['IdUse'] = IdUser;
        json['user'] = user;
    return json;
  }
}
