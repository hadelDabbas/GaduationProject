import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:graduationproject/app/model/book_type.dart';

import '../data/booktype_repository.dart';

class BookTypeController extends GetxController{
  final bookRepo= BookTypeRepository();
  final AllBookType=<BookType>[];
  final addBookType=BookType().obs;
    @override
  Future<void> onInit() async {
    super.onInit();
    await getAllBookType();
  }


  Future <void> getAllBookType() async{
    var data = await bookRepo.GetAllBookType();
    AllBookType.assignAll(data );

  }
   Future<void> delBookType(int id) async {
    var res = await bookRepo.DelBookType(id);
    if (res) {
    getAllBookType();
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