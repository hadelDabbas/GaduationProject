import 'package:get/get.dart';
import 'package:graduationproject/app/model/book_type.dart';

import '../data/booktype_repository.dart';

class BookTypeController extends GetxController {
  final bookRepo = BookTypeRepository();
  final AllBookType = <BookType>[].obs;
  final text = 'tanc'.tr;
  final addBookType = BookType().obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    await getAllBookType();
  }

  Future<void> getAllBookType() async {
    var data = await bookRepo.GetAllBookType();
    AllBookType.assignAll(data);
  }

  Future<void> delBookType(BookType book) async {
    var res = await bookRepo.DelBookType(book);
    if (res) {
      getAllBookType();
      Get.back();
    }
  }

  Future<void> AddBookType(BookType bookType) async {
    var res = await bookRepo.AddBookType(bookType);
    if (res) {
      //for refresh
      getAllBookType();
      Get.back();
    }
  }
}
