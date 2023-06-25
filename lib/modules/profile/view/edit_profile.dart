import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/menu/view/HomePage.dart';
import 'package:graduationproject/modules/profile/controller/profile_controller.dart';
import 'package:graduationproject/modules/profile/view/profile.dart';

import '../../genereted/sheard/util.dart';

class EditProfileview extends GetResponsiveView<ProfileController>{
ProfileController controller=Get.put(ProfileController());
   final _formfield = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
   Uint8List? image;
   @override
  Widget build(BuildContext context) {
 
 return Scaffold(
        body: SingleChildScrollView(
          
      child: Form(
        key: _formfield,
        child: Column(children: [
          Row(children: [
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
         
          Align(
            alignment: Alignment.centerLeft,
            child:            Text('Edit Profile ',
                              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,decoration: TextDecoration.none,
                               color:Color.fromARGB(255, 246, 123, 127),fontFamily: "Pacifico")),
          ),
          ],),
        
          SizedBox(
            width: 10,
            height: 30,
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
              child: Text(
                'Edit Your Account',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey[400],fontWeight: FontWeight.bold),
              )),
                 Center(
          child: Column(
        children: [
          SizedBox(width: 170),
            Material(child: Imageprofile(controller)),
        ],
      )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 450,
              child: TextFormField(
               initialValue: controller.user.value.Name,
              onChanged: (val){
          controller.user.value.Name=val;
              },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline,color: Colors.blueGrey,),
                    labelText: 'Enter Your New Name',labelStyle: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(15),
                    )),
                validator: (value) {
                  if (value!.isEmpty||!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "Enter Correct Name";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 450,
              child: TextFormField(
                 initialValue: controller.user.value.UserName,
                    onChanged: (val){
          controller.user.value.UserName=val;
              },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline,color: Colors.blueGrey,),
                    labelText: 'Enter New UserName', labelStyle: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),
                    
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(15),
                    )),
                       validator: (value) {
                  if (value!.isEmpty ||!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "Enter Correct UserName";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 450,
              child: TextFormField(
                 initialValue: controller.user.value.Age,
                    onChanged: (val){
          controller.user.value.Age=val;
              },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.numbers,color: Colors.blueGrey,),
                    labelText: 'Enter Your New Age',labelStyle: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),
                 
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    )),
                       validator: (value) {
                  if (value!.isEmpty 
                     || !RegExp(r'^[1-9]{1}+$').hasMatch(value)) {
                    return "Enter Correct Age";
                  } else {
                    return null;
                  }
                },

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 450,
              child: TextFormField(
                 initialValue: controller.user.value.Email,
                    onChanged: (val){
          controller.user.value.Email=val;
              },
                controller: emailcontroller,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email,color: Colors.blueGrey,),
                    labelText: 'Enter New Email',labelStyle: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),
                   
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
                     initialValue: controller.user.value.Password,
                        onChanged: (val){
          controller.user.value.Password=passcontroller.text;
              },
                    controller:passcontroller,
                    obscureText: controller.passtoggle.value,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock,color: Colors.blueGrey,),
                        suffixIcon: InkWell(
                          onTap: () {
                         
                         controller.passtoggle .value=! controller.passtoggle.value;
                            
                          },
                          child:  Icon(
                        controller.passtoggle .value   ? Icons.visibility : Icons.visibility_off,color: Color.fromARGB(255, 246, 123, 127),),
                            ),
                        labelText: 'Enter New Password',labelStyle: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),
                        
                     
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
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 450,
              child: TextFormField(
                 initialValue: controller.user.value.Study,
                    onChanged: (val){
          controller.user.value.Study=val;
              },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.cast_for_education,color: Colors.blueGrey,),
                    labelText: 'Enter New Education',labelStyle: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),
                  
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    )),
                       validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "Enter Correct Education";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 450,
              child: TextFormField(
                 initialValue: controller.user.value.Address,
                    onChanged: (val){
          controller.user.value.Address=val;
              },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_city,color: Colors.blueGrey,),
                    labelText: 'Enter New Adress',labelStyle: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),
                  
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    )),
                       validator: (value) {
                  if (value!.isEmpty 
                   ||   !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "Enter Correct Adress";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 450,
              child: TextFormField(
                 initialValue: controller.user.value.Paypal,
                    onChanged: (val){
          controller.user.value.Paypal=val;
              },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.money,color: Colors.blueGrey,),
                    labelText: 'Enter New PayBal',labelStyle: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.bold),
                   
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    )),
                       validator: (value) {
                  if (value!.isEmpty 
                 ||     !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]").hasMatch(value)) {
                    return "Enter Correct Paybal";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                  emailcontroller.clear();
                  passcontroller.clear();
                  controller.Updateprofile();
                  Get.to(Profileview());
                // if (_formfield.currentState!.validate()) {
                //   print("Data Added Successfully");
                
                //   Get.to(HomePage());
                // }
              },
              style: ElevatedButton.styleFrom(shadowColor: Colors.blueGrey,
              backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 50))
                      ,
              child: const Text(
                'Update Profile',
                style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 246, 123, 127),fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ]),
      ),
    ));

  }
  
  Widget Imageprofile(ProfileController controller) {
    return Center(
      child: Stack(
        children: <Widget>[
           Obx(() =>  CircleAvatar(
            radius: 80.0,
                    //  borderRadius: BorderRadius.circular(100),
                      child: controller.stringPickImage.value.isNotEmpty
                          ? Utility.imageFromBase64String(
                              controller.stringPickImage.value, 200, 200)
                          : controller.user.value.Image == null
                              ? Image.asset(
                                  'assets/images/boy.gif',
                                  width: 200,
                                  height: 200,
                                )
                              : Utility.imageFromBase64String(
                                  Utility.base64String(controller.user.value.Image!), 200, 200),
                    )
                    ),
          Positioned(
              bottom: 20.0,
              right: 20.0,
              child: InkWell(
                onTap: ()async {
             openBottomSheet(controller);
                },
                child: Icon(
                  Icons.camera_alt,
                  color: Color.fromARGB(255, 245, 146, 149),
                  size: 28.0,
                ),
              ))
        ],
      ),
    );
  }
}


void openBottomSheet( ProfileController controller) {
  Get.bottomSheet(
    Container(height: 120.0,
    width: 500,
    margin: EdgeInsets.symmetric(
      vertical: 20,
      horizontal: 20
    ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Center(
            child: Text(
              'Choose Post Photo',
              style: TextStyle(fontSize: 18),
            ),
          ),
           SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
               FloatingActionButton(
                backgroundColor: Color.fromARGB(255, 246, 123, 127),
                foregroundColor: Colors.white,
                mini: true,
                onPressed: () {
               controller.pickImageFun();
                },
                child: Icon(Icons.camera),
              ),
              Text('  Camera'),
                ],
              ),
             
                SizedBox(
            width: 10,
          ),
          Row(children: [
               FloatingActionButton(
                backgroundColor: Color.fromARGB(255, 246, 123, 127),
                foregroundColor: Colors.white,
                mini: true,
                onPressed: () {
                   controller.pickImageFun();
                },
                child: Icon(Icons.image),
              ),
                 Text('  Gallery'),
          ],)
              
            ],
          ),
        ],
      ),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}