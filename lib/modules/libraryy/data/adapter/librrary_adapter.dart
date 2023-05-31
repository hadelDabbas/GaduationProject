import '../../../../app/model/book.dart';

abstract class ILibraryRepository{
  Future<List<Book>> getAllbook(int idlibrary);
  Future<bool>AddBook(int idlibrary,Book book);
  Future<bool>DeleteBook(int idlibrary,int idbook);

}