
import 'dart:typed_data';

import 'package:graduationproject/app/model/library.dart';
import 'package:graduationproject/app/model/user.dart';

class  Buybook{
  int? Id;
   double ?Price;
  String? Address;
  int ?IdUser;
  User? user;
  int? IdLibrary;
   Library? library ;
Buybook( {
    this.Id,
    this.Price,
    this. Address,
    this.IdUser,
    this.user,
    this.IdLibrary,
    this.library
  });

Buybook.fromJson(Map<String, dynamic> json) {
   Id = json['id'];
   Price=json['Price'];
  Address=json['address'];
 IdUser=json[' idUser'];
 user=json[' user'];
  IdLibrary = json['idLibrary'];
  library = json['library'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
  json['Price']=Price;
    json['address']=Address;
    json[' idUser']=IdUser;
    json[' user']=user;
    json['idLibrary']=IdLibrary;
    json['library']=library;
    return json;
  }
}
