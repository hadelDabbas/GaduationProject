import 'package:get/get.dart';

import '../view/packet.dart';

class PacketController extends GetxController{
      var viewpacket = 0.obs;
    var prev=0.obs;
    var last=0.obs;
    var result=0.obs;
    var reminning=0.obs;
    var saveindex=0.obs;
    final listpacket=<Packet>[
      Packet(photo: 'assets/images/1.png', hidd:  'assets/images/8.png', index: 1,rotate: 0),
      // Packet(photo: 'assets/images/3.png', hidd:  'assets/images/8.png', index: 2,rotate: 0),
        Packet(photo: 'assets/images/2.png', hidd:  'assets/images/8.png', index: 2,rotate: 0),
          Packet(photo: 'assets/images/1.png', hidd:  'assets/images/8.png', index: 1,rotate: 0),
            //  Packet(photo: 'assets/images/3.png', hidd:  'assets/images/8.png', index: 1,rotate: 0),
          Packet(photo: 'assets/images/2.png', hidd:  'assets/images/8.png', index: 2,rotate: 0),
    ];
      @override
      void onInit() {
    super.onInit();
  
  }
// void   preperPackets()async{
  
//  }
}