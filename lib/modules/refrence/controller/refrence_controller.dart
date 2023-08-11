import 'package:get/get.dart';

import '../../../app/model/content.dart';
import '../../../app/model/refrence.dart';
import '../../../app/model/refrenceDto.dart';
import '../data/refrence_repositry.dart';

class RerenceController extends GetxController{
   final refrenceRepo=RefrenceRepository();
   final ListRefrence=<Content >[].obs;
   final ListRefrenceLink=<Reference>[].obs;
   final DelRefrence=Reference().obs;
   final Addrefrence=Reference().obs;
   final listAdmainrefrence=<RefrenceDto>[].obs;
   final textuser='';
   final valuetext=''.obs;
    final textallrefrence='refrencehelp'.tr;
  final refrences=['IT Reference','Arabic Reference',
  // 'Math Reference',
  // 'Medical Reference','Chamistry  Reference','Phaysis  Reference'
  ];
  final ItRefrence=['https://www.dataunitconverter.com/blog/bit-nibble-byte',
  'https://www.techtarget.com/searchmobilecomputing/definition/wireless',
  'https://www.baeldung.com/java-stack-heap',
  'https://www.baeldung.com/linux/buffer-vs-cache-memory',
  
  ];
    @override
  Future<void> onInit() async {
    super.onInit();
   getAllRefrence();
  }
    Future<void> getAllRefrence() async {
    var data = await refrenceRepo.GetAllRefrence();
    ListRefrence.assignAll(data);
  }
    Future<void> getRefrence(int id) async {
    var data = await refrenceRepo.GetRefrencelink(id);
    ListRefrenceLink.assignAll(data);

  }
   Future<void> DeleRefrence() async {
    var data = await refrenceRepo.DelRefrence(DelRefrence.value);
  }
    Future<void> AddRefrence() async {
    var data = await refrenceRepo.AddRefrence(Addrefrence.value);
  }
   Future<void> getAllrefreneAdmi() async {
    var data = await refrenceRepo.GeAllrefrenceAdmain();
   listAdmainrefrence.assignAll(data);

  }
}