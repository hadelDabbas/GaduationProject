import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/menu/controller/menu.dart';
import 'package:graduationproject/modules/menu/view/post.dart';
import 'package:graduationproject/modules/profile/controller/profile_controller.dart';
import 'package:graduationproject/modules/profile/view/edit_profile.dart';

import '../../icons/Icon.dart';

class Profileview extends GetResponsiveView<ProfileController>{
  ProfileController controller=Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
        Row(children: [
          SizedBox(width: 10,),
      Padding(
       padding: const EdgeInsets.fromLTRB(6, 20, 8, 8),
       child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 2)),
        height:150,width: 150,
         child: Align(alignment: Alignment.topLeft,
           child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/boy.gif'),radius: 110,
           ),
          
         ),
       ),
     ),
     Row(children: [
       Column(children: [

         Padding(
       padding: const EdgeInsets.all(8.0),
       child: Text('Mohammad Ahmmad',style: TextStyle(decoration: TextDecoration.none,
        fontWeight: FontWeight.bold,color: Colors.blueGrey,fontSize: 20,),),
     ),
       Row(children: [
         Text('(Mohammad)',style: TextStyle(color: Colors.blueGrey,fontSize: 16,
       decoration: TextDecoration.none,
       ),),
      ElevatedButton(
  onPressed: () {
    Get.to(EditProfileview());
  },
  child: Icon(Icons.edit,size: 14,color: Colors.blueGrey,),
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white,shadowColor: Colors.blueGrey,
    shape: CircleBorder(),
   
  ),
),
       ],),
      
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: [
            ElevatedButton(style: ElevatedButton.styleFrom(shadowColor: Colors.blueGrey,
                       backgroundColor: Colors.white, ),
              onPressed: () {  },
      child:Text('Follow',style: TextStyle(color:Color.fromARGB(255, 246, 123, 127),
      fontWeight: FontWeight.bold ),) ,),
       SizedBox(width:3),
          ElevatedButton(style: ElevatedButton.styleFrom(shadowColor: Colors.blueGrey,
                       backgroundColor: Colors.white, ),
              onPressed: () {
               Get.dialog( Align(alignment: Alignment.topRight,
      child: Container(
         width: 300,
        height: 700,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Followed',style: TextStyle(fontSize: 24,fontFamily:"Pacifico",color: Color.fromARGB(255, 246, 123, 127),decoration: TextDecoration.none ),),
            ),
 shapFolloword('ASIA Badnjki', 'assets/images/girl.gif'),
 shapFolloword('HADEEL Dabbas', 'assets/images/girl.gif'),
 shapFolloword('HAYA Ysoufi', 'assets/images/girl.gif')
          ],),
        )
      ),
    ));
                },
      child:Text('Followed',style: TextStyle(color:Color.fromARGB(255, 246, 123, 127),
      fontWeight: FontWeight.bold ),) ,),
      ],),
    ),

   
         ],),
       ],)
     ],),
     Padding(
       padding: const EdgeInsets.fromLTRB(20, 8, 8,8),
       child: Align(alignment: Alignment.topLeft,
        child: Text('About :',style: TextStyle(decoration: TextDecoration.none
        ,color: Colors.blueGrey,fontSize: 20),)),
     ) ,
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8,1),
          child: Row(children: [
            SizedBox(width: 16,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.email,color:Color.fromARGB(255, 246, 123, 127) ,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('MohmmadAhmad@gmail.com',style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,
              fontSize: 18,decoration: TextDecoration.none),),
            )
          ],),
        ),
         Padding(
          padding: const EdgeInsets.fromLTRB(8, 1, 8,8),
          child: Row(children: [
            SizedBox(width: 16,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.cast_for_education,color:Color.fromARGB(255, 246, 123, 127) ,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Information Tecnology',style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold,
              fontSize: 18,decoration: TextDecoration.none),),
            )
          ],),
        ),
     Padding(
       padding: const EdgeInsets.all(0.0),
         child: Card(
                    elevation: 6.0,
                    color: Color.fromARGB(255, 246, 123, 127) ,
                    clipBehavior: Clip.hardEdge,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      height:  MediaQuery.of(context).size.height/2.4,
                      width:500,
                      margin: const EdgeInsets.only(top: 5),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          )),
                          child: SingleChildScrollView(
      child: Column(children: [
       postprofile(' Hamza Hamza','Forest Is The tallest in the world   8848 mater',
      'assets/images/gabal.png',"History",controller),
     postprofile('Aya Hamm','How Number Square IN This Photo? ','assets/images/19.png','Global',controller),
      postprofile('Aya Hamm','How Number Square IN This Photo? ','assets/images/19.png','Global',controller)
      ],),
    ),
                    ),
                  ),
       
     ),
        
      ]
      ),
    );
  }
 Widget postprofile(String title ,String txt,String url, String post,ProfileController controller){
  return Padding(
    padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
    child: Center(
      child: Container(width: 500 , height: 200,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
        width: 1.3,
      ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
          child: Column(children: [
          Row(children: [
            Icon(Icons.person,color: Colors.blueGrey,),
               Padding(
              padding: const EdgeInsets.all(5.0),
              child: Align(alignment: Alignment.topLeft,
                child: Text(title,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,
                color: Colors.blueGrey),)),
            ),
         Text("("+post+")",style: TextStyle(color: Colors.grey,)),
          ],),
          
            ClipRRect(
      borderRadius: BorderRadius.circular(20), // Image border
      child: Container(width: 200,height: 100,
      child: SizedBox.fromSize( 
        size: Size.fromRadius(48), // Image radius
        child: Image.asset( url, fit: BoxFit.cover),
      ),
      ),
    ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(txt,style: TextStyle(fontSize: 12),),
            ),

         SizedBox(height:3,),
    Align(alignment: Alignment.bottomRight,
    
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(width:350,),
       ElevatedButton(
  onPressed: () {},
  child: Icon(AppIconn.chat,size: 12,),
  style: ElevatedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 248, 150, 153),
    shape: CircleBorder(),
   
  ),
),
        
         ElevatedButton(
  onPressed: () {
    if(controller.click==false){
      controller.click.value=true;
    }else{
      controller.click.value=false;
    }
  },
  child: 
        Obx(() =>   Icon(AppIconn.favorite,size: 12,
   color: controller.click.value==true?Colors.red:Colors.white,
  ),),
  style: ElevatedButton.styleFrom(
    backgroundColor: Color.fromARGB(255, 248, 150, 153),
    shape: CircleBorder(),
   
  ),
)
        // Icon(Icons.add_alert),
      ],),
    )
          ],),
        ),
    ),
  );
 }
  Widget shapFolloword(String name,String url){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(width: 250,height: 100,
         decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border:Border.all(color: Colors.blueGrey)),
         child: Row(
          children: [
            Container(width: 80,height: 80,
              child: Image.asset(url)),
              SizedBox(width: 30,),
            Text(name,style: TextStyle(fontSize: 18,decoration: TextDecoration.none,color:Colors.blueGrey),)
          ],
         ),
      ),
    );
  }
  }
        