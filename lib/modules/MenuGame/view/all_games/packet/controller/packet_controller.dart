import 'package:get/get.dart';

class PacketController extends GetxController {
  var reminning = 0.obs;
  final isMessage = false.obs;
  final cardsSucc = <Packet>[].obs;
  final openCards = <Packet>[].obs;
  final listpacket = <Packet>[
    Packet(
      photo: 'assets/images/1.png',
      hidd: 'assets/images/8.png',
      index: 1,
    ),
    Packet(
      photo: 'assets/images/2.png',
      hidd: 'assets/images/8.png',
      index: 2,
    ),
    Packet(
      photo: 'assets/images/1.png',
      hidd: 'assets/images/8.png',
      index: 1,
    ),
    Packet(
      photo: 'assets/images/2.png',
      hidd: 'assets/images/8.png',
      index: 2,
    ),
  ].obs;
}

class Packet {
  String? photo;
  String? hidd;
  int? index;
  Packet({this.photo, this.hidd, this.index});
}
