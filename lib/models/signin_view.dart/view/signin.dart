import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/models/signIn/controller/controller.dart';
import 'package:graduationproject/models/signin_view.dart/view/forgetpassword.dart';
//import 'package:getwidget/getwidget.dart';

class SignInViewPage extends GetResponsiveView<SignInController>{
  SignInController controller=Get.put(SignInController());
   @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Color.fromARGB(255, 231, 229, 229),
    body: 
    SingleChildScrollView(
      child: Column(
        children: [
        SizedBox(height: 15,),
         Center(child: Text('Welcome',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,
         color: Colors.blue),),),
         SizedBox(height: 10,),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container( width:  400,height: 250,
            child: Image.asset('assets/images/signin.png' )),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container( width:  450,
             child: TextField( 
                                         decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.email),
                                             labelText: 'Enter Email', 
                                             enabledBorder: OutlineInputBorder(
                                               borderSide: const BorderSide(width: 3, color: Colors.blue),
                                               borderRadius: BorderRadius.circular(15),
                                             ),
                                             focusedBorder: OutlineInputBorder(
                                               borderSide: const BorderSide(width: 3, color: Colors.grey),
                                               borderRadius: BorderRadius.circular(15),
                                             )),
                                       ),
           ),
         ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container( width:  450,
             child: TextField( 
                                         decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.lock),
                                             labelText: 'Enter Password',
                                             enabledBorder: OutlineInputBorder(
                                               borderSide: const BorderSide(width: 3, color: Colors.blue),
                                               borderRadius: BorderRadius.circular(15),
                                             ),
                                             focusedBorder: OutlineInputBorder(
                                               borderSide: const BorderSide(width: 3, color: Colors.grey),
                                               borderRadius: BorderRadius.circular(15),
                                             )),
                                       ),
                  ),
           ),
           Padding(
             padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
             child: Align( alignment: Alignment.bottomRight,
              child: TextButton(onPressed: (){
                Get.to(ForgetViewPage());
              }, child: Text('Forget Your Password ?',
              style: TextStyle(color: Colors.grey[600]),))),
           ),
             Padding(
             padding: const EdgeInsets.fromLTRB(8, 35, 8, 8),
             child:  ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                   
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 50)),
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              ),
                 Padding(
             padding: const EdgeInsets.all(8.0),
             child:  ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 50)),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),)
            
      ]),
    ),
   );}}
 
