import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/user.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app/model/comment.dart';
import '../../../app/model/content.dart';
import '../../../app/model/group.dart';
import '../../../app/model/post.dart';
import '../../../app/model/postdto.dart';
import '../../../app/model/userPost.dart';
import '../../genereted/sheard/util.dart';
import '../../sheard/auth_service.dart';
import '../data/group_repository.dart';

class  GroupController extends GetxController{
   var page=2.obs;
var click=false.obs;
var press=false.obs;
final nowgroup=0.obs;
 final newpost = Post().obs;
  final contents = <Content>[].obs;
 var dropdownvalue = 'History'.obs;
 final ImagePicker imagepicker=ImagePicker();
 var AllGroups=<Group>[].obs;
 var groupRepo=GroupRepository();
  final addcomment = Comments().obs;
 var currentGroup=Group().obs;
 var Members=<User>[].obs;
 var postsList=<PostDto>[].obs;
 var AddnewGroup=Group().obs;
 final stringPickImage = ''.obs;
  final userpost = UserPost().obs;
  final auth = Get.find<AuthService>();
  final user=User().obs;
    final IdPost = 0;
     final listcomment = <Comments>[].obs;
   PickedFile ?imagefile;
 //List <String> Content=['History ','IT','Culture','Senice','Math','Medical','Global']; 

 @override
  Future<void> onInit() async {
    super.onInit();
    await getAllGroups();
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

    Future <void> getAllGroups() async{
    var data = await groupRepo.GetAllGroup();
 AllGroups.assignAll(data );

  }

    Future<void> delGroup(int idgroup) async {
    var res = await groupRepo.DeleteGroup(idgroup);
    if (res) {
      getAllGroups();
    }
  }
     Future <void> getGroup(int idgroup) async{
    var data = await groupRepo.GetGroup(idgroup);
     currentGroup.value=data!;

  }
    
     Future <void> getMembers() async{
    var data = await groupRepo.GetMembers(currentGroup.value.Id!);
Members.assignAll(data );

  }
    Future <void> getPosts() async{
    var data = await groupRepo.GetAllPost(currentGroup.value.Id!);
postsList.assignAll(data );

  }
 Future<void> AddGroup() async {
  AddnewGroup.value.Image = Utility.dataFromBase64String(stringPickImage.value);
    var res = await groupRepo.AddGroup(AddnewGroup.value);
    if (res) {
      getAllGroups();
    }
  }
   Future <void> getAllContent() async{
    var data = await groupRepo.GetContent();
    contents.assignAll(data );

  }
  Future<void> UpdateGroup() async {
    currentGroup.value.Image = Utility.dataFromBase64String(stringPickImage.value);
    var res = await groupRepo.UpdateGroup(currentGroup.value.Id!, currentGroup.value);
    if (res) {
     
      Get.back();
    }
  }
    Future<void> GetInterActionUser() async {
    await groupRepo.InteractionUser(userpost.value, IdPost );
  }
   Future<void> GetUser() async {
    user.value = auth.getDataFromStorage() as User;
//  print(user.value.Email);
  }
  Future<void> GetComments(int IdPost ) async {
    var data = await  groupRepo.GetComment(IdPost);
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
    contents.assignAll(data );

  }
  Future<void> AddPost() async {
    newpost.value.Image = Utility.dataFromBase64String(stringPickImage.value);
    var data = await groupRepo.AddpostUser(newpost.value, user.value.Id!,currentGroup.value.Id!);
    if (data) {
      Get.snackbar(
        'Good',
        "  Add New Post Succsful ",
        //  icon: Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color.fromARGB(255, 246, 123, 127),
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 4),
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
        backgroundColor: Color.fromARGB(255, 246, 123, 127),
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        colorText: Colors.white,
        duration: Duration(seconds: 4),
        isDismissible: true,
        //  dismissDirection: SnackDismissDirection.HORIZONTAL,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  }
}