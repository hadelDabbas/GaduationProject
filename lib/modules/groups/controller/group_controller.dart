import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/user.dart';
import 'package:graduationproject/app/model/user_Group.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app/model/accessiblity_logIn.dart';
import '../../../app/model/comment.dart';
import '../../../app/model/content.dart';
import '../../../app/model/group.dart';
import '../../../app/model/post.dart';
import '../../../app/model/postdto.dart';
import '../../../app/model/userPost.dart';
import '../../genereted/sheard/util.dart';
import '../../sheard/auth_service.dart';
import '../data/group_repository.dart';

class GroupController extends GetxController {
  var page = 2.obs;
  var click = false.obs;
  var press = false.obs;
  final nowgroup = 0.obs;
  final newpost = Post().obs;
  final contents = <Content>[].obs;
  var dropdownvalue = 'History'.obs;
  final ImagePicker imagepicker = ImagePicker();
  var allGroups = <Group>[].obs;
  var groupRepo = GroupRepository();
  final addcomment = Comments().obs;
  var currentGroup = Group().obs;
  final msg = ''.obs;
  var members = <User>[].obs;
  var postsList = <PostDto>[].obs;
  var addnewGroup = Group().obs;
  final stringPickImage = ''.obs;
  final userpost = UserPost().obs;
  final auth = Get.find<AuthService>();
  final user = User().obs;
  final personExsisting = false.obs;
  final IdPost = 0;
  final addMember = UserGroup().obs;
  final removeMember = UserGroup().obs;
  final editpost = Post().obs;
  final listcomment = <Comments>[].obs;
  final access = <AccessiblityLogIn>[].obs;
  PickedFile? imagefile;
  final textshowgroup =
      'In this interface, all existing microbes are displayed';
  final textaddgroup = 'In this interface, a new cherub can be added';
  final texteditg = 'In this interface, the group information can be modified';
  final textgroup =
      'In this interface, all the information of this group is displayed';

  //List <String> Content=['History ','IT','Culture','Senice','Math','Medical','Global'];

  @override
  void onInit() {
    getAllContent();
    getAllGroups();
    user.value = auth.getDataFromStorage()!;
    access.value = auth
        .getUserLogInAccess()
        .where((element) => element.type == 'Group')
        .toList();
    ExsistingMember();
    super.onInit();
  }

  Future pickImageFun() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      stringPickImage.value = Utility.base64String(await image.readAsBytes());
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> getAllGroups() async {
    var data = await groupRepo.GetAllGroup();
    for (var element in data) {
      element.content =
          contents.where((p0) => p0.Id == element.IdContent).first;
    }
    allGroups.assignAll(data);
  }

  Future<void> delGroup(int idgroup) async {
    var res = await groupRepo.DeleteGroup(idgroup);
    if (res) {
      getAllGroups();
    }
  }

  Future<void> getGroup(int idgroup) async {
    var data = await groupRepo.GetGroup(idgroup);
    currentGroup.value = data!;
  }

  Future<void> getMembers() async {
    var data = await groupRepo.GetMembers(currentGroup.value.Id!);
    members.assignAll(data);
  }

  Future<void> getPosts() async {
    var data = await groupRepo.GetAllPost(currentGroup.value.Id!);
    postsList.assignAll(data);
  }

  Future<void> AddGroup() async {
    // addnewGroup.value.Image =
    //     Utility.dataFromBase64String(stringPickImage.value);
    var res = await groupRepo.AddGroup(addnewGroup.value);
    if (res) {
      getAllGroups();
    }
  }

  Future<void> getAllContent() async {
    var data = await groupRepo.GetContent();
    contents.assignAll(data);
  }

  Future<void> UpdateGroup() async {
    // currentGroup.value.Image =
    //     Utility.dataFromBase64String(stringPickImage.value);
    var res =
        await groupRepo.UpdateGroup(currentGroup.value.Id!, currentGroup.value);
    if (res) {
      Get.back();
    }
  }

  Future<void> UpdatePost() async {
    editpost.value.Image = Utility.dataFromBase64String(stringPickImage.value);
    var data = await groupRepo.UpdatePost(editpost.value.Id!, editpost.value);
  }

  Future<void> GetInterActionUser() async {
    await groupRepo.InteractionUser(userpost.value, IdPost);
  }

  Future<void> GetUser() async {
    user.value = auth.getDataFromStorage() as User;
//  print(user.value.Email);
  }

  Future<void> GetComments(int IdPost) async {
    var data = await groupRepo.GetComment(IdPost);
    listcomment.assignAll(data);
  }

  Future<void> AddComment() async {
    var data = await groupRepo.AddComment(addcomment.value, user.value.Id!);
    // GetComments( );
    if (data) {
      print('True');
    } else {
      print('false');
    }
  }

  Future<void> GetContens() async {
    var data = await groupRepo.GetAllContent();
    contents.assignAll(data);
  }

  Future<void> AddPost() async {
    newpost.value.Image = Utility.dataFromBase64String(stringPickImage.value);
    newpost.value.IdGroup = currentGroup.value.Id;
    newpost.value.IdContent = currentGroup.value.IdContent;
    newpost.value.IdUser = user.value.Id;
    newpost.value.dateTime = DateTime.now();
    var data = await groupRepo.AddpostUser(newpost.value);
    if (data) {
      Get.snackbar(
        'Good',
        "  Add New Post Succsful ",
        //  icon: Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(255, 246, 123, 127),
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        //  dismissDirection: SnackDismissDirection.HORIZONTAL,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    } else {
      Get.snackbar(
        'Error ',
        "The new post dont added",
        //  icon: Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(255, 246, 123, 127),
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        //  dismissDirection: SnackDismissDirection.HORIZONTAL,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  }

  Future<void> AddMember() async {
    var res = await groupRepo.AddMember(addMember.value);
  }

  Future<void> RemoveMember() async {
    var res = await groupRepo.RemoveMember(removeMember.value);
  }

  Future<void> ExsistingMember() async {
    var data = await groupRepo.exsitingMember();
    personExsisting.value = data.any((element) =>
        element.IdUser == user.value.Id &&
        element.IdGroup == currentGroup.value.Id);
  }
}
