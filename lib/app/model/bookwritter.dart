
// import 'dart:typed_data';

// import 'bookType.dart';
// import 'bookType.dart';
// class  Book{
//   int? Id;
//   String?IdBookName ;
//    Uint8List? bookImage;
//   int?BookPrice;
//   int?IdBookType;
//   BookType? bookType ;
// Book( {
//     this.Id,
//    this.BookName,
//    this.bookImage,
//    this.BookPrice,
//    this.IdBookType,
//    this.bookType,
//   });

//  Book.fromJson(Map<String, dynamic> json) {
//    Id = json['id'];
//   BookName =json['bookName '];
//      bookImage = json['bookImage'] == null
//         ? null
//         : Uint8List.fromList(List<int>.from(json['image']!));
//     BookPrice =json['bookPrice '];   
//  IdBookType =json['idBookType ']; 
//    bookType =json['bookType ']; 
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> json = new Map<String, dynamic>();
//     json['bookName']=BookName;
//   json['image'] =  bookImage == null ? null : Uint8List.fromList( bookImage!);
//   json[' bookPrice']= BookPrice;
//   json['idBookType']= IdBookType;
//   json[' bookType']= bookType;
//     return json;
//   }
// }
