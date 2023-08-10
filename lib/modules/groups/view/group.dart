import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/Addpost/view/addpost.dart';
import 'package:graduationproject/modules/groups/view/edit_group.dart';

import '../../../app/model/post.dart';
import '../../genereted/sheard/util.dart';
import '../../icons/Icon.dart';
import '../controller/group_controller.dart';

class GroupView extends GetResponsiveView<GroupController> {
  @override
  GroupController controller = Get.put(GroupController());

  GroupView({super.key});
  @override
  Widget builder() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          InkWell(
            onTap: () => Get.back(),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey),
              ),
            ),
          ),
          controller.currentGroup.value.Image == null
              ? Image.asset(
                  'assets/images/It.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.fill,
                )
              : Utility.imageFromBase64String(
                  Utility.base64String(controller.currentGroup.value.Image!),
                  double.infinity,
                  null),
          // Container(
          //   height: 200,
          //   child: Image.asset(
          //       width: double.infinity,
          //       fit: BoxFit.fill,

          //       ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              //  shadowColor: Colors.white60,
              color: const Color.fromARGB(255, 236, 236, 243),
              child: Column(
                children: [
                  Center(
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 80,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            controller.currentGroup.value.groupName!,
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 42, 42, 114)),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Text(
                        //     '(IT)',
                        //     style: TextStyle(
                        //         fontSize: 20,
                        //         fontWeight: FontWeight.bold,
                        //         color: Colors.grey),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 120,
                          ),
                          Obx(
                            () => Tooltip(
                              message: controller.msg.value,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.blueGrey,
                                  backgroundColor:
                                      // controller.press.value == false
                                      controller.personExsisting.value == false
                                          ? const Color.fromARGB(
                                              255, 246, 123, 127)
                                          : Colors.white,
                                ),
                                /////////////////////////dont work
                                onPressed: () {
                                  if (controller.personExsisting.value ==
                                      false) {
                                    controller.personExsisting.value = true;
                                    controller.msg.value = 'Joning';
                                    controller.addMember.value.IdGroup =
                                        controller.currentGroup.value.Id;
                                    controller.addMember.value.IdUser =
                                        controller.user.value.Id;
                                    controller.AddMember();
                                  } else {
                                    controller.personExsisting.value = false;
                                    controller.msg.value = 'Exit';
                                    controller.addMember.value.IdGroup =
                                        controller.currentGroup.value.Id;
                                    controller.addMember.value.IdUser =
                                        controller.user.value.Id;
                                    controller.RemoveMember();
                                  }
                                },
                                /////////////////////////////////////////
                                child: Text(
                                  'Joining',
                                  style: TextStyle(
                                      color: controller.press.value == false
                                          ? Colors.white
                                          : const Color.fromARGB(
                                              255, 246, 123, 127),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Tooltip(
                            message: 'Members In This Group',
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shadowColor: Color.fromARGB(255, 42, 42, 114),
                                backgroundColor:
                                    const Color.fromARGB(255, 246, 123, 127),
                              ),
                              onPressed: () {
                                Get.dialog(Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                      width: 300,
                                      height: 700,
                                      color: Colors.white,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                'Members',
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontFamily: "Pacifico",
                                                    color: Color.fromARGB(
                                                        255, 246, 123, 127),
                                                    decoration:
                                                        TextDecoration.none),
                                              ),
                                            ),
                                            Column(
                                              children: controller.members
                                                  .map((element) =>
                                                      shapFolloword(
                                                          element.Name
                                                              .toString(),
                                                          element.Image!))
                                                  .toList(),
                                            )
                                            // shapFolloword('ASIA Badnjki',
                                            //     'assets/images/girl.gif'),
                                            // shapFolloword('HADEEL Dabbas',
                                            //     'assets/images/girl.gif'),
                                            // shapFolloword('HAYA Ysoufi',
                                            //     'assets/images/girl.gif')
                                          ],
                                        ),
                                      )),
                                ));
                              },
                              child: const Text(
                                'Members',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        ' Description About Group :',
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 42, 42, 114),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Row(
                      children: <Widget>[
                        Flexible(
                            child: Center(
                                child: Text(
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black54,
                                      decoration: TextDecoration.none,
                                    ),
                                    controller.currentGroup.value.Description
                                        .toString())))
                      ],
                    )),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Tooltip(
                  message: 'Edit Group ',
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(EditGrpoup());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 18,
                      color: Color.fromARGB(255, 246, 123, 127),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Tooltip(
                  message: 'Add Post ',
                  child: ElevatedButton(
                    onPressed: () {
                      Addpostview();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      shape: const CircleBorder(),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 18,
                      color: Color.fromARGB(255, 246, 123, 127),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: controller.postsList
                .map((element) => postprofile(
                    element.UserName.toString(),
                    element.UserImage!,
                    element.GroupName.toString(),
                    element.GroupImage!,
                    element.post!.Description.toString(),
                    element.post!.Image!,
                    element.Interaction!,
                    element.post!.content!.typeName.toString(),
                    element.post!))
                .toList(),
          ),

          // post('Dr.Abdallah hamwe', 'The loop you can used it in flutter',
          //     'assets/images/loop.png', 'IT', controller),
          // post('Ahmad Ahmad', 'Why Flutter Uses Dart ?',
          //     'assets/images/dart.png', 'IT', controller)
           Tooltip(
              message: 'Help About Page',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(onPressed: (){
              Get.dialog(Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blueAccent)),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              "Help",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Pacifico",
                                                  color: Color.fromARGB(255, 42, 42, 114),
                                                  decoration: TextDecoration.none),
                                            ),
                                          )),
                                    ),
                                             Padding(
                                               padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                                               child: Column(
                                                           children: <Widget>[
                                                             new Text(
                                                               controller.textgroup,
                                                               textAlign: TextAlign.left,
                                                               style: TextStyle(
                                                                   fontSize: 18,
                                                                   decoration: TextDecoration.none,
                                                                   fontWeight: FontWeight.bold,
                                                                   color: Colors.black87),
                                                             ),
                                                           ],
                                                         ),
                                             ),
                                  ],
                                ),
                              ),
                            ),
                          ),
              ));
                  }, icon: Icon(Icons.help_outline_outlined,
                  size: 30,
                  color:Color.fromARGB(255, 246, 123, 127) ,)),
                ),
              ),
            )
        ]),
      ),
    );
  }

  Widget shapFolloword(String name, Uint8List url) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color.fromARGB(255, 42, 42, 114))),
        child: Row(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: url == null
                  ? Image.asset(
                      'assets/images/1.png',
                      width: screen.width,
                      fit: BoxFit.fill,
                    )
                  : Utility.imageFromBase64String(
                      Utility.base64String(url), screen.width, null),
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              name,
              style: const TextStyle(
                  fontSize: 18,
                  decoration: TextDecoration.none,
                  color: Color.fromARGB(255, 42, 42, 114)),
            )
          ],
        ),
      ),
    );
  }

  Widget postprofile(
      String nameuser,
      Uint8List imageuser,
      String GroupName,
      Uint8List imageGroup,
      String Descriptionpost,
      Uint8List imagpost,
      bool interaction,
      String postType,
      Post post) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
        child: Center(
          child: Container(
            width: 500,
            height: 210,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.3,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)),
            child: Column(children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: imageuser == null
                          ? Image.asset(
                              'assets/images/angryimg.png',
                              width: screen.width,
                              fit: BoxFit.fill,
                            )
                          : Utility.imageFromBase64String(
                              Utility.base64String(imageuser), 50, 50),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          // 'Asia',
                          nameuser,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.blueGrey),
                        )),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 12,
                    color: Colors.black87,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: imageGroup == null
                          ? Image.asset(
                              'assets/images/angryimg.png',
                              width: screen.width,
                              fit: BoxFit.fill,
                            )
                          : Utility.imageFromBase64String(
                              Utility.base64String(imageGroup), 50, 50),
                    ),
                  ),
                  Text(
                    GroupName,
                    //  nameuser,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color.fromARGB(255, 42, 42, 114)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text("($postType)",
                      style: const TextStyle(
                        color: Colors.grey,
                      )),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Image border
                    child: SizedBox(
                      width: 450,
                      height: 120,
                      child: SizedBox.fromSize(
                          size: const Size.fromRadius(48), // Image radius
                          child: imagpost == null
                              ? Image.asset(
                                  'assets/images/1.png',
                                  width: screen.width,
                                  fit: BoxFit.fill,
                                )
                              : Utility.imageFromBase64String(
                                  Utility.base64String(imagpost),
                                  screen.width,
                                  null)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      Descriptionpost,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(
                          width: 350,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.userpost.value.IdPost = post.Id;
                            controller.userpost.value.post = post;
                            controller.userpost.value.user =
                                controller.user.value;
                            controller.userpost.value.Id =
                                controller.user.value.Id;
                            if (interaction) {
                              controller.userpost.value.Interaction = false;
                              controller.GetInterActionUser();
                            } else {
                              controller.userpost.value.Interaction = false;
                              controller.GetInterActionUser();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 248, 150, 153),
                            shape: const CircleBorder(),
                          ),
                          child: Obx(
                            () => Icon(
                              AppIconn.favorite,
                              size: 12,
                              color: controller.click.value == true
                                  ? Colors.red
                                  : Colors.white,
                            ),
                          ),

                          // ElevatedButton(
                          //   onPressed: () {
                          //     // controller.userpost.value.IdUser =
                          //     //     controller.userprofile.value.Id;
                          //     // if (interaction) {
                          //     //   controller.userpost.value.Interaction = false;
                          //     //   controller.GetInterActionUser(post.Id!);
                          //     // } else {
                          //     //   controller.userpost.value.Interaction = true;
                          //     //   controller.GetInterActionUser(post.Id!);
                          //     // }
                          //   },
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor:
                          //         const Color.fromARGB(255, 248, 150, 153),
                          //     shape: const CircleBorder(),
                          //   ),
                          //   child: Obx(
                          //     () => Icon(
                          //       AppIconn.favorite,
                          //       size: 12,
                          //       color: controller.click.value == true
                          //           ? Colors.red
                          //           : Colors.white,
                          //     ),
                          //   ),
                          // )
                          // Icon(Icons.add_alert),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ]),
          ),
        ));
  }
}
