import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/packet_controller.dart';

class PacketPageView extends GetResponsiveView<PacketController> {
  PacketPageView({super.key});

  @override
  Widget builder() {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 35,
              width: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blueGrey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    ' Remiming :',
                    style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 18),
                  ),
                  Obx(
                    () => Text(
                      controller.reminning.value.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                          fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          ),
          Obx(() => controller.isMessage.value
              ? Container(
                  color: Colors.green.shade300,
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Congratulations, ',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink()),
          Center(
            child: Obx(
              () => Wrap(
                children: controller.listpacket
                    .map((packet) => Material(
                          child: InkWell(
                            onTap: () async {
                              if (controller.openCards.isEmpty) {
                                controller.openCards.add(packet);
                              } else if (controller.openCards.isNotEmpty &&
                                  controller.openCards.length == 1) {
                                controller.openCards.add(packet);
                                await Future.delayed(
                                    const Duration(milliseconds: 50));
                                if (controller.openCards.first.index ==
                                    controller.openCards.last.index) {
                                  controller.cardsSucc
                                      .add(controller.openCards.first);
                                  controller.cardsSucc
                                      .add(controller.openCards.last);
                                  controller.isMessage(true);
                                  await Future.delayed(
                                      const Duration(seconds: 1));
                                  controller.isMessage(false);
                                }
                                controller.openCards.clear();
                              }
                            },
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: Colors.blueGrey, width: 3)),
                                  child: controller.cardsSucc
                                              .contains(packet) ||
                                          controller.openCards.contains(packet)
                                      ? Image.asset(packet.photo!)
                                      : Image.asset(packet.hidd!),
                                )),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
