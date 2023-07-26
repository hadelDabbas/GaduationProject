import 'package:get/get.dart';

import '../../../app/model/refrence.dart';
import '../data/refrence_repositry.dart';

class RerenceController extends GetxController{
   final refrenceRepo=RefrenceRepository();
   final ListRefrence=< Reference >[].obs;
   final refrence=Reference().obs;
  final refrences=['IT Reference','Arabic Reference','Math Reference',
  'Medical Reference','Chamistry  Reference','Phaysis  Reference'];
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
    var data = await refrenceRepo.GetRefrence(id);
       refrence.value=data!;

  }
}