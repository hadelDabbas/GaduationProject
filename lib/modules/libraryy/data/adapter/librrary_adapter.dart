import 'package:graduationproject/app/model/book_type.dart';
import 'package:graduationproject/app/model/buy_book.dart';
import 'package:graduationproject/app/model/library.dart';

import '../../../../app/model/book.dart';
import '../../../../app/model/writter.dart';

abstract class ILibraryRepository {
  Future<List<Book>> getAllbook(int idlibrary);
  Future<List<Library>> getAllLibrary();
  Future<bool> AddBook(int idlibrary, Book book);
  Future<bool> DeleteBook(int idlibrary, int idbook);
  Future<bool> BascketBook(Buybook buybook);
  Future<bool> AddLibrary(Library library);
  Future<bool> DeleteLibrary(int idlibrary);
  Future<bool> UpdateBook(int idbook, int idlibrsry, Book book);
  Future<bool> UpdateLibrary(int idlibrsry, Library library);
  Future<List<Writer>> GetAllAuthourlibrary(int idlibrary);
  Future<List<BookType>> GetAllTypeBooklibrary(int library);
  Future<List<Book>> GetAllBookByType(int idlibrary, int idBooktype);
  Future<List<Book>> GetAllBookByWitter(int library, int idwriter);
  // Future<List<invoice>> GetAllUserInvoic(int iduser);
   // Future<List<invoice>> GetAllLibraryInvoic(int iduser);
}
