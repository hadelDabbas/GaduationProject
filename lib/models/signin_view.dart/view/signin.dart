import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/models/signIn/controller/controller.dart';
//import 'package:getwidget/getwidget.dart';

class SignInViewPage extends GetResponsiveView<SignInController>{
  SignInController controller=Get.put(SignInController());
   @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Color.fromARGB(255, 231, 229, 229),
    body: 
    Column(
      children: [
      SizedBox(height: 30,),
       Center(child: Text('Welcome',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),),),
       SizedBox(height: 10,),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container( width:  350,height: 250,
          child: Image.asset('assets/images/signin.png' )),
       ),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container( width:  400,
           child: TextField( 
                                       decoration: InputDecoration(
                                           labelText: 'Enter Email', icon: Icon(Icons.email),
                                           enabledBorder: OutlineInputBorder(
                                             borderSide: const BorderSide(width: 3, color: Colors.blue),
                                             borderRadius: BorderRadius.circular(15),
                                           ),
                                           focusedBorder: OutlineInputBorder(
                                             borderSide: const BorderSide(width: 3, color: Colors.red),
                                             borderRadius: BorderRadius.circular(15),
                                           )),
                                     ),
         ),
       ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container( width:  400,
           child: TextField( 
                                       decoration: InputDecoration(
                                           labelText: 'Enter Password',icon: Icon(Icons.password),
                                           enabledBorder: OutlineInputBorder(
                                             borderSide: const BorderSide(width: 3, color: Colors.blue),
                                             borderRadius: BorderRadius.circular(15),
                                           ),
                                           focusedBorder: OutlineInputBorder(
                                             borderSide: const BorderSide(width: 3, color: Colors.red),
                                             borderRadius: BorderRadius.circular(15),
                                           )),
                                     ),
                ),
         ),
    ]),
   );}}
 
