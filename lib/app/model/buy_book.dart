import 'package:graduationproject/app/model/library.dart';
import 'package:graduationproject/app/model/user.dart';

class Buybook {
  int? id;
  double? price;
  String? address;
  int? idUser;
  User? user;
  int? idLibrary;
  Library? library;
  Buybook(
      {this.id,
      this.price,
      this.address,
      this.idUser,
      this.user,
      this.idLibrary,
      this.library});

  Buybook.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['Price'];
    address = json['address'];
    idUser = json[' idUser'];
    user = json[' user'];
    idLibrary = json['idLibrary'];
    library = json['library'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['Price'] = price;
    json['address'] = address;
    json[' idUser'] = idUser;
    json[' user'] = user;
    json['idLibrary'] = idLibrary;
    json['library'] = library;
    return json;
  }
}
