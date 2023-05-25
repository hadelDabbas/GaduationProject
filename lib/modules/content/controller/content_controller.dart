import 'package:get/get.dart';

import '../../../api/storage/storge_service.dart';
import '../../../app/model/content.dart';
import '../data/content_repositry.dart';

class ContentController extends GetxController{
  var show=false.obs;
    static const  String KeyData="AuthData";
      final stroge = Get.find<StorageService>();
        final contents = <Content>[].obs;
        final contRepo=ContentRepository();
  final addcontent = Content().obs;
  Future <void> getAllContent() async{
    var data = await contRepo.GetContent();
    contents.assignAll(data);

  }
   Future<void> delcontentelement(Content content) async {
    var res = await contRepo.DelContent(content.Id!);
    if (res) {
      getAllContent();
    }
  }

  Future<void> addcontentelement(Content content) async {
    var res = await contRepo.AddContent(content);
    if (res) {
      //for refresh
      getAllContent();
      Get.back();
    }
  }
}