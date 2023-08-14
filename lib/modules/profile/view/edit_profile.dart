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
            child:            Text('EditProfile'.tr,
                              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
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
                'EditYourAccount'.tr,
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
                    prefixIcon: Icon(Icons.person_outline,color: Color.fromARGB(255, 42, 42, 114),),
                    labelText: 'ent'.tr,labelStyle: TextStyle(color: Color.fromARGB(255, 42, 42, 114),fontWeight: FontWeight.bold),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                      borderRadius: BorderRadius.circular(15),
                    )),
                validator: (value) {
                  if (value!.isEmpty||!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "EnterCorrectName".tr;
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
                    prefixIcon: Icon(Icons.person_outline,color: Color.fromARGB(255, 42, 42, 114),),
                    labelText: 'EnterNewUserName'.tr, labelStyle: TextStyle(color: Color.fromARGB(255, 42, 42, 114),fontWeight: FontWeight.bold),
                    
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                      borderRadius: BorderRadius.circular(15),
                    )),
                       validator: (value) {
                  if (value!.isEmpty ||!RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "EnterCorrectUserName".tr;
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
                    prefixIcon: Icon(Icons.numbers,color: Color.fromARGB(255, 42, 42, 114),),
                    labelText: 'EnterYourNewAge'.tr,labelStyle: TextStyle(color: Color.fromARGB(255, 42, 42, 114),fontWeight: FontWeight.bold),
                 
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                      borderRadius: BorderRadius.circular(15),
                    )),
                       validator: (value) {
                  if (value!.isEmpty 
                     || !RegExp(r'^[1-9]{1}+$').hasMatch(value)) {
                    return 'EnterYourNewAge'.tr;
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
                    prefixIcon: Icon(Icons.email,color: Color.fromARGB(255, 42, 42, 114),),
                    labelText: 'EnterNewEmail'.tr,labelStyle: TextStyle(color: Color.fromARGB(255, 42, 42, 114),fontWeight: FontWeight.bold),
                   
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                      borderRadius: BorderRadius.circular(15),
                    )),
                validator: (value) {
                  bool emailvalue = RegExp(
                          r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!);
                  if (value.isEmpty) {
                    return 'EnterNewEmail'.tr;
                  } else if (!emailvalue) {
                    return "EnterCorrectEmail".tr;
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
                        prefixIcon: Icon(Icons.lock,color: Color.fromARGB(255, 42, 42, 114),),
                        suffixIcon: InkWell(
                          onTap: () {
                         
                         controller.passtoggle .value=! controller.passtoggle.value;
                            
                          },
                          child:  Icon(
                        controller.passtoggle .value   ? Icons.visibility : Icons.visibility_off,color: Color.fromARGB(255, 246, 123, 127),),
                            ),
                        labelText: 'EnterNewPassword'.tr,labelStyle: TextStyle(color: Color.fromARGB(255, 42, 42, 114),fontWeight: FontWeight.bold),
                        
                     
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "EnterPassword".tr;
                      } else if (passcontroller.text.length < 6) {
                        return "PasswordLengthShouldBeMoreThan6Charachters".tr;
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
                    prefixIcon: Icon(Icons.cast_for_education,color: Color.fromARGB(255, 42, 42, 114),),
                    labelText: 'EnterNewEducation'.tr,labelStyle: TextStyle(color: Color.fromARGB(255, 42, 42, 114),fontWeight: FontWeight.bold),
                  
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                      borderRadius: BorderRadius.circular(15),
                    )),
                       validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "EnterCorrectEducation".tr;
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
                    prefixIcon: Icon(Icons.location_city,color: Color.fromARGB(255, 42, 42, 114),),
                    labelText: 'EnterNewAdress'.tr,labelStyle: TextStyle(color: Color.fromARGB(255, 42, 42, 114),fontWeight: FontWeight.bold),
                  
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                      borderRadius: BorderRadius.circular(15),
                    )),
                       validator: (value) {
                  if (value!.isEmpty 
                   ||   !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "EnterCorrectAdress".tr;
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
                    prefixIcon: Icon(Icons.money,color: Color.fromARGB(255, 42, 42, 114),),
                    labelText: 'EnterNewPayBal'.tr,labelStyle: TextStyle(color: Color.fromARGB(255, 42, 42, 114),fontWeight: FontWeight.bold),
                   
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                      borderRadius: BorderRadius.circular(15),
                    )),
                       validator: (value) {
                  if (value!.isEmpty 
                 ||     !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]").hasMatch(value)) {
                    return "EnterCorrectPaybal".tr;
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
                                                             Get.snackbar(
        'Finish'.tr,
        "UpdatingValues".tr,
        icon: const Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(255, 246, 123, 127),
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
                  Get.to(Profileview());
                // if (_formfield.currentState!.validate()) {
                //   print("Data Added Successfully");
                
                //   Get.to(HomePage());
                // }
              },
              style: ElevatedButton.styleFrom(shadowColor: Color.fromARGB(255, 42, 42, 114),
              backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 50))
                      ,
              child:  Text(
                'UpdateProfile'.tr,
                style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 246, 123, 127),fontWeight: FontWeight.bold),
              ),
            ),
          ),
               Tooltip(
              message: 'HelpAboutPage'.tr,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(onPressed: (){
              Get.dialog(Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                            alignment: Alignment.center,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.blueAccent)),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:  Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              "Help".tr,
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Pacifico",
                                                  color: Color.fromARGB(255, 42, 42, 114),
                                                  decoration: TextDecoration.none),
                                            ),
                                          )),
                                    ),
                                             Padding(
                                               padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                                               child: Column(
                                                           children: <Widget>[
                                                             new Text(
                                                               controller. texteditprofile,
                                                               textAlign: TextAlign.left,
                                                               style: TextStyle(
                                                                   fontSize: 18,
                                                                   decoration: TextDecoration.none,
                                                                   fontWeight: FontWeight.bold,
                                                                   color: Colors.black87),
                                                             ),
                                                           ],
                                                         ),
                                             ),
                                  ],
                                ),
                              ),
                            ),
                          ),
              ));
                  }, icon: Icon(Icons.help_outline_outlined,
                  size: 30,
                  color:Color.fromARGB(255, 246, 123, 127) ,)),
                ),
              ),
            )
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
           Center(
            child: Text(
              'ChoosePhoto'.tr,
              style: TextStyle(fontSize: 18),
            ),
          ),
           SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            
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
                 Text('Gallery'.tr),
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