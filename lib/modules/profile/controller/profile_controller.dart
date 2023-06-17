import 'package:get/get.dart';
import 'package:graduationproject/app/model/post.dart';
import 'package:graduationproject/modules/profile/data/profile_repositry.dart';
import 'package:image_picker/image_picker.dart';

import '../../../api/storage/storge_service.dart';
import '../../../app/model/content.dart';
import '../../../app/model/postdto.dart';
import '../../../app/model/user.dart';
import '../../../app/model/userPost.dart';
import '../../genereted/sheard/util.dart';
import '../../sheard/auth_service.dart';

class ProfileController extends GetxController{
  var click=false.obs;
  var passtoggle = true.obs;
  final newcontent=Content().obs;
  final editpost=Post().obs;
   final stroge = Get.find<StorageService>();
   final profileRepo=ProfileRepository();
   static const  String KeyData="AuthData";
   final userprofile=User().obs;
    final userpost=<PostDto>[].obs;
   final UpdateUser=User().obs;
     final auth = Get.find<AuthService>();
      final user = User().obs;
     final ImagePicker imagepicker=ImagePicker();
   PickedFile ?imagefile;
      var valuechoice=''.obs;
    var dropdownvalue = 'History'.obs;
      List <String> Contents=['History','Math','Arabic','English','Diversified'];
   final stringPickImage = ''.obs;

 @override
  void onInit() {
    super.onInit();
    GetUser();
    ShowProfileUser ();
    GetPostUser();
    }

 Future<void> GetUser() async {
    user.value = auth.getDataFromStorage() as User;
//  print(user.value.Email);
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
    userprofile.value=user.value;
   // userprofile.value= (await profileRepo.Getprofileuser(user.value.Id!))!;
     if(userprofile.value!=null){
      print('true');
     }else{
      print('false');
     }
    }
    Future <void>GetPostUser()async{
     userpost.value= await profileRepo.GetUserPost(user.value.Id!) ;
     if(    userpost.value!=null){
      print('true');
     }else{
      print('false');
     }

    }
    Future <void>UpduteUserInfo()async{
    UpdateUser.value.Image = Utility.dataFromBase64String(stringPickImage.value);
      var res=await profileRepo.UpdateProfile(UpdateUser.value, user.value.Id!);
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