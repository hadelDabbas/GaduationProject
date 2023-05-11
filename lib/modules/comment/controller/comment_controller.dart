import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/comment/view/comment.dart';

class CommentController extends GetxController{
 var objcomment=commentt('', '','');
  var allcommentperson=<commentt>[].obs;
  var textfieldd=''.obs;
 void onInit(){
  super.onInit();
  getallcomment();
   
 }
 Future getallcomment()async{
   objcomment.setcomment('Haya Ye', 'Nice ','assets/images/girl.gif');
  objcomment.setcomment('Asia ba', 'Good  Idea ','assets/images/girl.gif');
   objcomment.setcomment('Hadeel da', 'Think You for Information  ','assets/images/boy.gif');
  objcomment.setcomment('Asia Bi', ' I liked ','assets/images/girl.gif');
   objcomment.setcomment('Abd bnu', ' very good ','assets/images/boy.gif');
  allcommentperson.assignAll(objcomment.allcomment);
 }
Future addComment( commentt comm)async{
objcomment.allcomment.add(comm);
allcommentperson.value=objcomment.allcomment;
}
} 
