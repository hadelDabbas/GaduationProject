import 'dart:html';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/Addpost/view/addpost.dart';
import 'package:graduationproject/modules/groups/view/edit_group.dart';

import '../../../app/model/post.dart';
import '../../comment/view/comment.dart';
import '../../genereted/sheard/util.dart';
import '../../icons/Icon.dart';
import '../controller/group_controller.dart';

class GroupView extends GetResponsiveView<GroupController> {
  GroupController controller = Get.put(GroupController());
  Widget builder() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          InkWell(
            onTap: () => Get.back(),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
              color: Color.fromARGB(255, 236, 236, 243),
              child: Column(
                children: [
                  Center(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 80,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            controller.currentGroup.value.groupName!,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey),
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
                          SizedBox(
                            width: 120,
                          ),
                          Obx(
                            () => Tooltip(
                              message:controller.msg.value ,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.blueGrey,
                                  backgroundColor:
                                      // controller.press.value == false
                                      controller.personExsisting.value==false
                                          ? Color.fromARGB(255, 246, 123, 127)
                                          : Colors.white,
                                ),
                                /////////////////////////dont work
                                onPressed: () {
                                  if (  controller.personExsisting.value==false) {
                               controller.personExsisting.value = true;
                               controller.msg.value='Joning';
                               controller.addMember.value.IdGroup=controller.currentGroup.value.Id;
                                controller.addMember.value.IdUser=controller.user.value.Id;
                                    controller.AddMember();
                                  } else {
                                  controller.personExsisting.value = false;
                                    controller.msg.value='Exit';
                                    controller.addMember.value.IdGroup=controller.currentGroup.value.Id;
                                controller.addMember.value.IdUser=controller.user.value.Id;
                                    controller.RemoveMember();
                                  }
                                },
                                /////////////////////////////////////////
                                child: Text(
                                  'Joining',
                                  style: TextStyle(
                                      color: controller.press.value == false
                                          ? Colors.white
                                          : Color.fromARGB(255, 246, 123, 127),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5),
                          Tooltip(
                            message: 'Members In This Group',
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.blueGrey,
                                backgroundColor:
                                    Color.fromARGB(255, 246, 123, 127),
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
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                              children: controller.Members.map(
                                                  (element) => shapFolloword(
                                                      element.Name.toString(),
                                                      element.Image!)).toList(),
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
                              child: Text(
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        ' Description About Group :',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey,
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
                          child: new Text(
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black54,
                                decoration: TextDecoration.none,
                              ),
                            controller.currentGroup.value.Description.toString())
                        ))
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
                    child: Icon(
                      Icons.edit,
                      size: 18,
                      color: Color.fromARGB(255, 246, 123, 127),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      shape: CircleBorder(),
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
                    child: Icon(
                      Icons.add,
                      size: 18,
                      color: Color.fromARGB(255, 246, 123, 127),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      shape: CircleBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: controller.postsList.map((element) => postprofile(   element.UserName.toString(),
                            element.UserImage!,
                            element.GroupName.toString(),
                            element.GroupImage!,
                            element.post!.Description.toString(),
                            element.post!.Image!,
                            element.Interaction!,
                            element.post!.content!.typeName.toString(),
                            element.post!)).toList(),
          )
          // post('Dr.Abdallah hamwe', 'The loop you can used it in flutter',
          //     'assets/images/loop.png', 'IT', controller),
          // post('Ahmad Ahmad', 'Why Flutter Uses Dart ?',
          //     'assets/images/dart.png', 'IT', controller)
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
            border: Border.all(color: Colors.blueGrey)),
        child: Row(
          children: [
            Container(width: 80, height: 80, child: 
              url == null
                        ? Image.asset(
                            'assets/images/1.png',
                            width: screen.width,
                            fit: BoxFit.fill,
                          )
                        : Utility.imageFromBase64String(
                            Utility.base64String(
                                url),
                            screen.width,
                            null),
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              name,
              style: TextStyle(
                  fontSize: 18,
                  decoration: TextDecoration.none,
                  color: Colors.blueGrey),
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
          child: Column(
            children: [
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
                        color: Colors.blueGrey),
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
                      
                        // controller.postidnew.value.Id = post.Id!;
                        controller.GetComments(post.Id!);
                        Get.to(Comment());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 248, 150, 153),
                        shape: const CircleBorder(),
                      ),
                      child: const Icon(
                        AppIconn.chat,
                        size: 12,
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        controller.userpost.value.IdPost = post.Id;
                        controller.userpost.value.post = post;
                        controller.userpost.value.user = controller.user.value;
                        controller.userpost.value.Id = controller.user.value.Id;
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
                    )
                    // Icon(Icons.add_alert),
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
