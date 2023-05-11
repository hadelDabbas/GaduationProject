import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/menu/view/HomePage.dart';
import '../../signup/view/signup1.dart';
import '../controller/signin_controller.dart';
import 'forgetpassword.dart';
//import 'package:getwidget/getwidget.dart';

class SignInViewPage extends GetResponsiveView<SignIncontroller>{
 SignIncontroller controller=Get.put(SignIncontroller());
    final _formfield = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();

  SignInViewPage({super.key});
   @override
  Widget build(BuildContext context) {
   return Scaffold(
    backgroundColor: Colors.white,
    body: 
    SingleChildScrollView(
      child: Form(
        key: _formfield,
        child: Column(
          children: [
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
          SizedBox(height: 15,),
           Center(child: Text('Welcome',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40,
           color: Colors.blue),),),
           SizedBox(height: 10,),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container( width:  400,height: 250,
              child: Image.asset('assets/images/9.png' )),
           ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 450,
                child: TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Enter Email',
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
                    bool emailvalue = RegExp(
                            r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!);
                    if (value.isEmpty) {
                      return " Enter Email";
                    } else if (!emailvalue) {
                      return " Enter Correct Email";
                    }
                  },
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 450,
                  child: Obx(() => TextFormField(
                    controller:passcontroller,
                    obscureText: controller.passtoggle.value,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                          onTap: () {
                         
                         controller.passtoggle .value=! controller.passtoggle.value;
                            
                          },
                          child:  Icon(
                        controller.passtoggle .value   ? Icons.visibility : Icons.visibility_off),
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
      ) ),
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
                  onPressed: () {
                     if (_formfield.currentState!.validate()) {
                  print("Data Added Successfully");
                  emailcontroller.clear();
                  passcontroller.clear();
                  Get.to(HomePage());}
                  },
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
                  onPressed: () {
                   // Get.to(signupage());
                  },
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
    ),
   );}}
 
