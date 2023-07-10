import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/book.dart';
import 'package:graduationproject/app/model/book_type.dart';
import 'package:graduationproject/app/model/buy_book.dart';
import 'package:graduationproject/app/model/library.dart';
import 'package:graduationproject/app/model/writter.dart';

import 'adapter/librrary_adapter.dart';

class LibraryRepository implements ILibraryRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<List<Book>> getAllbook(int idlibrary) async {
    var result =
        await _dio.get('https://localhost:7192/api/CompanyContent/$idlibrary');
    var list = <Book>[];
    for (var item in result.data) {
      list.add(Book.fromJson(item));
    }
    return list;
  }

  @override
  Future<bool> AddBook(int idlibrary, Book book) async {
    var result = await _dio.post("path", data: book.toJson());
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
  Future<bool> UpdateBook(int idbook, int idlibrsry, Book book) async {
    var result = await _dio.post("", data: book.toJson());
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

  @override
  Future<List<Book>> GetAllBookByType(int idlibrary, int idBooktype) async {
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
  Future<List<Book>> GetAllBookByWitter(int library, int idwriter) async {
    var result =
        await _dio.get('https://localhost:7192/api/CompanyContent/{1}');
    print(result);
    var list = <Book>[];
    for (var item in result.data) {
      list.add(Book.fromJson(item));
    }
    return list;
  }
}
