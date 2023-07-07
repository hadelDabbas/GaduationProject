import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/book.dart';
import 'package:graduationproject/app/model/book_type.dart';
import 'package:graduationproject/app/model/library.dart';
import 'package:image_picker/image_picker.dart';

import '../../../api/storage/storge_service.dart';
import '../../../app/model/writter.dart';
import '../../genereted/sheard/util.dart';
import '../data/libraray_repositry.dart';

class LibraryContrller extends GetxController {
  var valuepice = 0.obs;
  late AnimationController controller;
  late Animation<double> animation;
  final stroge = Get.find<StorageService>();
  final Booklist = <Book>[].obs;
  final libraryRepo = LibraryRepository();
  final ImagePicker imagepicker = ImagePicker();
  final stringPickImage = ''.obs;
  PickedFile? imagefile;
  final listLibrary = <Library>[].obs;
  final Addlibrary = Library().obs;
  final updatelibrary = Library().obs;
  final IdLibrary = 0.obs;
  final Newlibrary = Library().obs;
  final Booktype = <BookType>[];
  final AllAutour = <Writer>[];
  final addBook = Book().obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    getAllLibrary();
  }

  Future pickImageFun() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      stringPickImage.value = Utility.base64String(await image.readAsBytes());
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> getAllLibrary() async {
    var data = await libraryRepo.getAllLibrary();
    listLibrary.assignAll(data);
  }

  Future<void> dellibrary(int idlibrary) async {
    var res = await libraryRepo.DeleteLibrary(idlibrary);
    if (res) {
      getAllLibrary();
    }
  }

  Future<void> addLibrary(Library newlibrart) async {
    var res = await libraryRepo.AddLibrary(newlibrart);
    if (res) {
      //for refresh
      getAllLibrary();
      Get.back();
    }
  }

  Future<void> UpdateLibrary(int idlibrary) async {
    var res = libraryRepo..UpdateLibrary(idlibrary, updatelibrary.value);
    if (res == true) {
      getAllLibrary();
      Get.back();
    }
  }

  Future<void> getAllBook() async {
    var data = await libraryRepo.getAllbook(IdLibrary.value);
    Booklist.assignAll(data);
    getAllBookType();
    getAllWriter();
  }

  Future<void> addBooktolibrary() async {
    var res = await libraryRepo.AddBook(IdLibrary.value, addBook.value);
  }

  Future<void> getAllWriter() async {
    var data = await libraryRepo.GetAllAuthourlibrary(IdLibrary.value);
    AllAutour.assignAll(data);
  }

  Future<void> getAllBookType() async {
    var data = await libraryRepo.GetAllTypeBooklibrary(IdLibrary.value);
    Booktype.assignAll(data);
  }

  Future<void> getAllBookByType(int idBooktype) async {
    var data = await libraryRepo.GetAllBookByType(IdLibrary.value, idBooktype);
    Booklist.assignAll(data);
  }

  Future<void> getAllBookByWritter(int idwriter) async {
    var data = await libraryRepo.GetAllBookByWitter(IdLibrary.value, idwriter);
    Booklist.assignAll(data);
  }
}
