import 'package:get/get.dart';
import 'package:graduationproject/app/model/user.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app/model/content.dart';
import '../../../app/model/group.dart';
import '../../../app/model/postdto.dart';
import '../../genereted/sheard/util.dart';
import '../data/group_repository.dart';

class GroupController extends GetxController {
  var page = 2.obs;
  var click = false.obs;
  var press = false.obs;
  var dropdownvalue = 'History'.obs;
  final ImagePicker imagepicker = ImagePicker();
  final allGroups = <Group>[].obs;
  var groupRepo = GroupRepository();
  var currentGroup = Group().obs;
  final members = <User>[].obs;
  var postsList = <PostDto>[].obs;
  final addnewGroup = Group().obs;
  final stringPickImage = ''.obs;
  var contents = <Content>[].obs;
  PickedFile? imagefile;
  //List <String> Content=['History ','IT','Culture','Senice','Math','Medical','Global'];

  @override
  Future<void> onInit() async {
    await getAllGroups();
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
}
