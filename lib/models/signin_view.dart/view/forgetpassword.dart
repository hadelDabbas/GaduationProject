import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/signin_controller.dart';
//import 'package:getwidget/getwidget.dart';

class ForgetViewPage extends GetResponsiveView<SignIncontroller>{
 SignIncontroller controller=Get.put(SignIncontroller());
   @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Column(children: [
           InkWell(
                      onTap: () => Get.back(),
                      child: Align(alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_back_ios,
                                       size: 20, 
                                     color: Colors.grey
                                      ),
                        ),
                      ),
                    ),
        SizedBox(height: 30,),
       Center(child: Text('Forget Password',style: TextStyle(
        color:Colors.blue,
        fontWeight: FontWeight.bold,fontSize: 35),),),
       SizedBox(height: 10,),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container( width:  350,height: 200,
          child: Image.asset('assets/images/forget.png' )),
       ),
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: Container( width:  450,
           child: TextField( 
                                       decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.lock),
                                           labelText: 'New Password', 
                                           enabledBorder: OutlineInputBorder(
                                             borderSide: const BorderSide(width: 3, color: Color.fromARGB(255, 36, 36, 36)),
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
                                            prefixIcon: Icon(Icons.check),
                                           labelText: 'Confirm Password',
                                           enabledBorder: OutlineInputBorder(
                                             borderSide:  BorderSide(width: 3, color: Color.fromARGB(255, 36, 36, 36)),
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
           child:  ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 50)),
              child: const Text(
                'Confirm',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),)
    ],),
   );}}