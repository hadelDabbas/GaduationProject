import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/book.dart';
import 'package:graduationproject/app/model/buy_book.dart';
import 'package:graduationproject/app/model/library.dart';

import '../../../Utile/utilExpation.dart';
import 'adapter/librrary_adapter.dart';

class LibraryRepository implements ILibraryRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<List<Book>> getAllbook(int idlibrary) async {
    var result =
        await _dio.get('https://localhost:7192/api/CompanyContent/{1}');
    print(result);
    var list = <Book>[];
    for (var item in result.data) {
      list.add(Book.fromJson(item));
    }
    return list;
  }
  
  @override
  Future<bool> AddBook(int idlibrary, Book book) async{
   var result= await _dio.post("path",
   data: book.toJson()
   );
    if(ExpastionStatus(result.statusCode!)){
          return true;
        }else{
          return false;
        }
  }
  
  @override
  Future<bool> DeleteBook(int idlibrary, int idbook) async{
    var result= await _dio.delete("path",
   );
    if(ExpastionStatus(result.statusCode!)){
          return true;
        }else{
          return false;
        }
  }
  
  @override
  Future<bool> BascketBook(Buybook  buybook) async{
  var result= await  _dio.put("",data: buybook.toJson());
   if(ExpastionStatus(result.statusCode!)){
          return true;
        }else{
          return false;
        }
  }

  @override
  Future<bool> AddLibrary(Library library) async {
  var result= await  _dio.put("",data: library.toJson());
   if(ExpastionStatus(result.statusCode!)){
          return true;
        }else{
          return false;
        }
  }
  
  @override
  Future<bool> DeleteLibrary(int idlibrary)async {
   var result= await _dio.delete("path",
   );
    if(ExpastionStatus(result.statusCode!)){
          return true;
        }else{
          return false;
        }
  }
  
  @override
  Future<bool> UpdateBook(int idbook, int idlibrsry, Book book) async{
  var result= await _dio.post("",data:book.toJson());
    if(ExpastionStatus(result.statusCode!)){
          return true;
        }else{
          return false;
        }
  }
  
  @override
  Future<bool> UpdateLibrary(int idlibrsry, Library library)async {
    var result= await _dio.post("",data:library.toJson());
    if(ExpastionStatus(result.statusCode!)){
          return true;
        }else{
          return false;
        }
  }
  
  @override
  Future<List<Library>> getAllLibrary()async {
     var result =
        await _dio.get('https://localhost:7192/api/CompanyContent/{1}');
    print(result);
    var list = <Library>[];
    for (var item in result.data) {
      list.add(Library.fromJson(item));
    }
    return list;
  }
  
  }