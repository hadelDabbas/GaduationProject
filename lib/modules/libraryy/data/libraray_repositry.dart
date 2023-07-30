import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/book.dart';
import 'package:graduationproject/app/model/book_type.dart';
import 'package:graduationproject/app/model/bookwritter.dart';
import 'package:graduationproject/app/model/buy_book.dart';
import 'package:graduationproject/app/model/library.dart';
import 'package:graduationproject/app/model/writter.dart';

import '../../../app/model/BookDetalites.dart';
import '../../../app/model/booklibrary.dart';
import 'adapter/librrary_adapter.dart';

class LibraryRepository implements ILibraryRepository {
  final _dio = Get.find<Dio>();
//
  @override
  Future<List<BookDetailsDto>> getbookLibrary(int idlibrary) async {
    var result =
        await _dio.get('https://localhost:7192/api/Library/GetLibraryBook',
        queryParameters: {'id':idlibrary});
    var list = <BookDetailsDto>[];
    for (var item in result.data) {
      list.add(BookDetailsDto.fromJson(item));
    }
    return list;
  }
//
  @override
  Future<bool> AddBook(BookLibrary library) async {
    var result = await _dio.post("https://localhost:7192/api/BookLibrary", data: library.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> DeleteBook(int idlibrary, int idbook) async {
    var result = await _dio.delete(
      "path",
    );
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> BascketBook(Buybook buybook) async {
    var result = await _dio.put("", data: buybook.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> AddLibrary(Library library) async {
    var result = await _dio.post('https://localhost:7252/api/Library',
        data: library.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> DeleteLibrary(int idlibrary) async {
    var result = await _dio.delete(
      "https://localhost:7252/api/Library?id=$idlibrary",
    );
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> UpdateBook(BookLibrary bookLibrary) async {
    var result = await _dio.put("", data: bookLibrary.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> UpdateLibrary(int idlibrsry, Library library) async {
    var result = await _dio.put('https://localhost:7252/api/Library/$idlibrsry',
        data: library.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<List<Library>> getAllLibrary() async {
    var result = await _dio.get('https://localhost:7252/api/Library');
    print(result);
    var list = <Library>[];
    for (var item in result.data) {
      list.add(Library.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<Writer>> GetAllAuthourlibrary(int idlibrary) async {
    var result =
        await _dio.get('https://localhost:7192/api/CompanyContent/{1}');
    print(result);
    var list = <Writer>[];
    for (var item in result.data) {
      list.add(Writer.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<BookType>> GetAllTypeBooklibrary(int library) async {
    var result =
        await _dio.get('https://localhost:7192/api/CompanyContent/{1}');
    print(result);
    var list = <BookType>[];
    for (var item in result.data) {
      list.add(BookType.fromJson(item));
    }
    return list;
  }
//
  @override
  Future<List<BookDetailsDto>> GetAllBookByType(int idlibrary, int idBooktype) async {
    var result =
        await _dio.get('https://localhost:7192/api/Library/GetBookType',
          queryParameters: {"idlibrary":idlibrary,'idbooktype':idBooktype});
    print(result);
    var list = <BookDetailsDto>[];
    for (var item in result.data) {
      list.add(BookDetailsDto.fromJson(item));
    }
    return list;
  }
//
  @override
  Future<List<BookDetailsDto>> GetAllBookByWitter(int library, int idwriter) async {
    var result =
        await _dio.get('https://localhost:7192/api/Library/GetBookWriters',
         queryParameters: {"idlibrary":library,'idbooktype':idwriter});
    print(result);
    var list = <BookDetailsDto>[];
    for (var item in result.data) {
      list.add(BookDetailsDto.fromJson(item));
    }
    return list;
  }
  
  @override
  Future<bool> AddBookone(Book book)async {
     var result = await _dio.post('https://localhost:7252/api/Book/AddBook',
        data: book.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  ///////
  @override
  Future<int> BackIdBook(String namebook)async {
      var result = await _dio.get('https://localhost:7252/api/Book/AddBook',
        queryParameters: {'bookName':namebook});
         return int.parse(result as String).toInt();
  }

  @override
  Future<bool> Bookwritter(BookWriter book) async{
      var result = await _dio.post('https://localhost:7252/api/BookWritter',
        data: book.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  
  @override
  Future<bool> UpdateBookjust(int id,Book book)async {
 var result = await _dio.put('https://localhost:7252/api/Book/Put/$id',
        data: book.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  
  @override
  Future<bool> UpdateBookwritter(BookWriter book)async {
   var result = await _dio.put('https://localhost:7252/api/BookWritter',
        data: book.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  
  @override
  Future<BookWriter?> BackIdBookWritter(int idbook) async{
       var result = await _dio.get('https://localhost:7252/api/BookWritter/$idbook',
        queryParameters: {"id": idbook});
    if (result.statusCode == 200) {
      var data = BookWriter.fromJson(result.data as Map<String, dynamic>);
      return data;
    } else {
      return null;
    }
  }
  
  // @override
  // Future<List> GetAllUserInvoic(int iduser)async {
  //      var result =
  //       await _dio.get('https://localhost:7192/api/CompanyContent/{1}');
  //   print(result);
  //   var list = <Invoic>[];
  //   for (var item in result.data) {
  //     list.add(Invoic.fromJson(item));
  //   }
  //   return list;
  // }
}
