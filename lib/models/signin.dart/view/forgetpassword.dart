import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/models/signin.dart/view/signin.dart';

import '../controller/signin_controller.dart';
//import 'package:getwidget/getwidget.dart';

class ForgetViewPage extends GetResponsiveView<SignIncontroller>{
  SignIncontroller controllerr=Get.put(SignIncontroller());
    final _formfield = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
    final Confirmpasscontroller = TextEditingController();
   @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: Form(
        key: _formfield,
      child: Column(children: [
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
          Obx(()=>  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 450,
                  child: TextFormField(
                    controller: passcontroller,
                    obscureText: controller.passtoggle,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: () {
                         
                         controller.passtoggle = !controller.passtoggle;
                            
                          },
                          child:    Icon(
                        controllerr.passtoggle    ? Icons.visibility : Icons.visibility_off),
                            ),
                        labelText: 'Enter Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.blue),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Password";
                      } else if (passcontroller.text.length < 6) {
                        return "Password Length Should Be More Than 6 Charachters";
                      }
                    },
                  ),
                ),
             )   ),
             Obx(()=>  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 450,
                  child: TextFormField(
                    controller:Confirmpasscontroller,
                    obscureText: controller.passtoggle,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: () {
                         
                         controller.passtoggle = !controller.passtoggle;
                            
                          },
                          child:    Icon(
                        controllerr.passtoggle    ? Icons.visibility : Icons.visibility_off),
                            ),
                        labelText: 'Confirm Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.blue),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Confirm Password";
                      } else if (Confirmpasscontroller.text.length < 6) {
                        return "Password Length Should Be More Than 6 Charachters";
                      }
                    },
                  ),
                ),
               )  ),
                Padding(
             padding: const EdgeInsets.all(8.0),
             child:  ElevatedButton(
                onPressed: () {
             if(Confirmpasscontroller.text==passcontroller.text){
                if (_formfield.currentState!.validate()) {
                    print("Data Added Successfully");
                  Confirmpasscontroller.clear();
                    passcontroller.clear();
                    Get.to(SignInViewPage());}
             }else
                  diolg('Confirm from fields');
                      
                  
                  
                },
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
    ),
   );}
   
   Future diolg(String txt) {
    return Get.dialog(Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 240, 230, 230),
          border: Border.all(color: Colors.blue, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        width: 200,
        height: 120,
        child: Row(
          children: [
            
            Center(
              child: Text(txt,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black54,
                      decoration: TextDecoration.none)),
            ),
          ],
        ),
      ),
    ));
  }
   }