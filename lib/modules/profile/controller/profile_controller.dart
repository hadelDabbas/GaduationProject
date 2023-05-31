import 'package:get/get.dart';
import 'package:graduationproject/app/model/post.dart';
import 'package:graduationproject/modules/profile/data/profile_repositry.dart';
import 'package:image_picker/image_picker.dart';

import '../../../api/storage/storge_service.dart';
import '../../../app/model/content.dart';
import '../../../app/model/user.dart';
import '../../genereted/sheard/util.dart';

class ProfileController extends GetxController{
  var click=false.obs;
  var passtoggle = true.obs;
  final newcontent=Content().obs;
  final editpost=Post().obs;
   final stroge = Get.find<StorageService>();
   final profileRepo=ProfileRepository();
   static const  String KeyData="AuthData";
   final userprofile=User().obs;
   var iduser=0.obs;
   final PostList=<Post>[].obs;
   final UpdateUser=User().obs;
     final ImagePicker imagepicker=ImagePicker();
   PickedFile ?imagefile;
      var valuechoice=''.obs;
    var dropdownvalue = 'History'.obs;
      List <String> Contents=['History','Math','Arabic','English','Diversified'];
   final stringPickImage = ''.obs;

 @override
  void onInit() {
    super.onInit();
    }
     Future takePhoto ( ImageSource source) async{
    final PiickedFile=await imagepicker.getImage(source: source);
   imagefile=PiickedFile;
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
    Future <void>ShowProfileUser ()async{
     var iduser=(stroge.getData(KeyData) as User).Id ;
     userprofile.value= (await profileRepo.Getprofileuser(iduser!))!;
     if(userprofile.value!=null){
      print('true');
     }else{
      print('false');
     }
    }
    Future <void>GetPostUser()async{
     PostList.value=await profileRepo.GetUserPost(iduser.value);
     if(  PostList.value!=null){
      print('true');
     }else{
      print('false');
     }

    }
    Future <void>UpduteUserInfo()async{
    UpdateUser.value.Image = Utility.dataFromBase64String(stringPickImage.value);
      var res=await profileRepo.UpdateProfile(UpdateUser.value, iduser.value);
      if(res){
        print('update user');
      }else{
        print('not update user');
      }
    }
    Future <void> UpdatePostUser(int idpost)async{
        var res=await profileRepo.UpdatePost(idpost,editpost.value);
      if(res){
        print('update user');
      }else{
        print('not update user');
      }
    }
    Future <void> DeletPost(int idpost)async{
         var res=await profileRepo.DeletePost(idpost);
      if(res){
        GetPostUser();
        print('update user');
        
      }else{
        print('not update user');
      }
    }
    Future <void>Getpost(int idpost)async{
   var result=await profileRepo.Getpost(idpost);
   editpost.value=result!;
    }
       Future <void>Updatecontentpost(String content)async{
   var result=await profileRepo.GetIdContent(content);
        newcontent.value=result!;
    }
    
}