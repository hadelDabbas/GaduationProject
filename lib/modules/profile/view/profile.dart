import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:graduationproject/app/model/user.dart';
import 'package:graduationproject/modules/profile/controller/profile_controller.dart';
import 'package:graduationproject/modules/profile/view/editpost.dart';
import 'package:graduationproject/routes/app_pages.dart';

import '../../../app/model/group.dart';
import '../../../app/model/post.dart';
import '../../genereted/sheard/util.dart';
import '../../icons/Icon.dart';

class Profileview extends GetResponsiveView<ProfileController> {
  Profileview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 20, 8, 8),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2)),
                height: 150,
                width: 150,
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/boy.gif'),
                    radius: 110,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        controller.userprofile.value.Name.toString(),
                        // 'Mohammad Ahmmad',
                        style: const TextStyle(
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 42, 42, 114),
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          controller.userprofile.value.UserName.toString(),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 42, 42, 114),
                            fontSize: 16,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.rootDelegate.toNamed(Routes.editProfile);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: Color.fromARGB(255, 42, 42, 114),
                            shape: const CircleBorder(),
                          ),
                          child: const Icon(
                            Icons.edit,
                            size: 14,
                            color: Color.fromARGB(255, 42, 42, 114),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            controller.GetuserGroup();
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
                                            'Groups',
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
                                          children: controller.userfollowGroups
                                              .map((e) => shapFolloword(
                                                  e.groupName.toString(),
                                                  e.Image!,
                                                  controller.user.value,
                                                  e))
                                              .toList(),
                                        )
                                      ],
                                    ),
                                  )),
                            ));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: Color.fromARGB(255, 42, 42, 114),
                            shape: const CircleBorder(),
                          ),
                          child: const Icon(
                            Icons.group,
                            size: 14,
                            color: Color.fromARGB(255, 42, 42, 114),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shadowColor: Color.fromARGB(255, 42, 42, 114),
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {
                              controller.GetUserFollow();
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
                                              'Follow',
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
                                            children: controller.UserFollow.map(
                                                (e) => shapFolloword(
                                                    e.Name.toString(),
                                                    e.Image!,
                                                    e,
                                                    controller.currentGroup
                                                        .value)).toList(),
                                          )
                                        ],
                                      ),
                                    )),
                              ));
                            },
                            child: const Text(
                              'Follow',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 246, 123, 127),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(width: 3),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shadowColor: Color.fromARGB(255, 42, 42, 114),
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {
                              controller.GetFollowuser();
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
                                              'Followed',
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
                                            children: controller.FollowUser.map(
                                                (e) => shapFolloword(
                                                    e.Name.toString(),
                                                    e.Image!,
                                                    e,
                                                    controller.currentGroup
                                                        .value)).toList(),
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
                              'Followed',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 246, 123, 127),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox()
          ],
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'About :',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Color.fromARGB(255, 42, 42, 114),
                    fontSize: 20),
              )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 1),
          child: Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.email,
                  color: Color.fromARGB(255, 246, 123, 127),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  controller.userprofile.value.Email.toString(),
                  //'MohmmadAhmad@gmail.com',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 42, 42, 114),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      decoration: TextDecoration.none),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 1, 8, 8),
          child: Row(
            children: [
              const SizedBox(
                width: 16,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.cast_for_education,
                  color: Color.fromARGB(255, 246, 123, 127),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  controller.userprofile.value.Study.toString(),
                  //  'Information Tecnology',
                  style: const TextStyle(
                      color: Color.fromARGB(255, 42, 42, 114),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      decoration: TextDecoration.none),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Card(
            elevation: 6.0,
            color: const Color.fromARGB(255, 246, 123, 127),
            clipBehavior: Clip.hardEdge,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height / 2.14,
              width: 500,
              margin: const EdgeInsets.only(top: 5),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  )),
              child: SingleChildScrollView(
                child: Column(
                    children:
                        //  [
                        //   postprofile('asia','' , "GroupName", "imageGroup", "DescriptionGroup", "imagpost", true, 'It')
                        // ]
                        controller.Listuserpost.map((element) => postprofile(
                            element.UserName.toString(),
                            element.UserImage!,
                            element.GroupName.toString(),
                            element.GroupImage!,
                            element.post!.Description.toString(),
                            element.post!.Image!,
                            element.Interaction!,
                            element.post!.content!.typeName.toString(),
                            element.post!)).toList()),
              ),
            ),
          ),
        ),
      ]),
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
                              color: Color.fromARGB(255, 42, 42, 114)),
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
                  const SizedBox(
                    width: 100,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              controller.postidnew.value.Id = post.Id!;
                              Get.dialog(Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: 500,
                                  height: 370,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.blueAccent)),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "Edit post : ",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "Pacifico",
                                                    color: Color.fromARGB(255, 42, 42, 114),
                                                    decoration:
                                                        TextDecoration.none),
                                              ),
                                            )),
                                        Container(
                                          child: EditPostview(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                            },
                            icon: const Icon(
                              Icons.edit,
                              size: 20,
                              color: Color.fromARGB(255, 42, 42, 114),
                            )),
                        IconButton(
                            onPressed: () {
                              Get.dialog(Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  color: Colors.white,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: Color.fromARGB(255, 42, 42, 114), width: 2)),
                                  child: Column(
                                    children: [
                                      const Center(
                                        child: Text(
                                          'Are You Sure ?',
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 42, 42, 114),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              decoration: TextDecoration.none),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextButton(
                                              onPressed: () {
                                                controller.DeletPost(post.Id!);
                                              },
                                              child: const Text(
                                                'Yes',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none),
                                              )),
                                          TextButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: const Text(
                                                'No',
                                                style: TextStyle(
                                                    decoration:
                                                        TextDecoration.none),
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ));
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 20,
                            )),
                      ],
                    ),
                  )
                ],
              ),
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
                        controller.postidnew.value.Id = post.Id!;
                        controller.GetAllComments(post.Id!);
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
                        controller.userpost.value.IdUser =
                            controller.userprofile.value.Id;
                        if (interaction) {
                          controller.userpost.value.Interaction = false;
                          controller.GetInterActionUser(post.Id!);
                        } else {
                          controller.userpost.value.Interaction = true;
                          controller.GetInterActionUser(post.Id!);
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
              ),
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
                                                               controller.textprofile,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget shapFolloword(String name, Uint8List image, User user, Group group) {
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
            SizedBox(
              width: 80,
              height: 80,
              child: image == null
                  ? Image.asset(
                      'assets/images/angryimg.png',
                      width: screen.width,
                      fit: BoxFit.fill,
                    )
                  : Utility.imageFromBase64String(
                      Utility.base64String(image), 80, 80),
            ),
            const SizedBox(
              width: 30,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 27,
                ),
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 18,
                      decoration: TextDecoration.none,
                      color: Color.fromARGB(255, 42, 42, 114)),
                ),
                const SizedBox(
                  width: 130,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GFButton(
                    onPressed: () {
                      ////sure here
                    // controller.followdelete.value.followId=controller.user.value.Id;
                    // controller.followdelete.value.followedId=user.Id;
                    controller.Delefolloewd(user.Id!);
                    },
                    text: "remove",
                    textStyle: const TextStyle(color: Colors.black54),
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    type: GFButtonType.transparent,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
