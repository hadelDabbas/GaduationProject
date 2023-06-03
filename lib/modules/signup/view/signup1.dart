import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/menu/view/HomePage.dart';
import 'package:intl/intl.dart';

import '../../genereted/sheard/util.dart';
import '../controller/signup.dart';

class signupage extends GetResponsiveView<SignUpController> {
  SignUpController controller = Get.put(SignUpController());
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
          InkWell(
            onTap: () => Get.back(),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey),
              ),
            ),
          ),
          SizedBox(
            width: 10,
            height: 25,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '   Sign Up',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.blueGrey,fontFamily: "Pacifico"),
            ),
          ),
          SizedBox(
            width: 10,
            height: 30,
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
              child: Text(
                'Create Your Account',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey[600]),
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
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline,color: Color.fromARGB(255, 246, 123, 127),),
                    labelText: 'Enter YourName',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    )),
                onChanged: (value) {
                  controller.user.value.Name = value;
                },
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
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
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline,color: Color.fromARGB(255, 246, 123, 127),),
                    labelText: 'Enter UserName',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    )),
                onChanged: (value) {
                  controller.user.value.UserName = value;
                },
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "Enter Correct UserName";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          Container(
            width: 450,
            height: 55,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueGrey,
                  width: 2.6,
                ),
                borderRadius: BorderRadius.circular(18)),
            child: Row(
              children: [
                SizedBox(
                  width: 3,
                ),
                InkWell(
                    onTap: () {
                      controller.chooseDate();
                
                    },
                    child: Icon(
                      Icons.date_range,
                      color: Color.fromARGB(255, 246, 123, 127),
                    )),
                SizedBox(
                  width: 2,
                ),
                Obx(() => Text(
                      DateFormat("dd.MM.yyyy")
                          .format(controller.selectedDate.value)
                          .toString(),
                      style: TextStyle(fontSize: 18,color: Colors.black54),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 450,
              child: TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email,color: Color.fromARGB(255, 246, 123, 127),),
                    labelText: 'Enter Email',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    )),
                onChanged: (value) {
                  controller.user.value.Email = value;
                },
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
                child: Obx(
                  () => TextFormField(
                    controller: passcontroller,
                    obscureText: controller.passtoggle.value,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock,color: Color.fromARGB(255, 246, 123, 127),),
                        suffixIcon: InkWell(
                          onTap: () {
                            controller.passtoggle.value =
                                !controller.passtoggle.value;
                          },
                          child: Icon(controller.passtoggle.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        labelText: 'Enter Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                        )),
                    onChanged: (value) {
                      controller.user.value.Password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Password";
                      } else if (passcontroller.text.length < 6) {
                        return "Password Length Should Be More Than 6 Charachters";
                      }
                    },
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 450,
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.cast_for_education,color: Color.fromARGB(255, 246, 123, 127),),
                    labelText: 'Enter Education',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    )),
                onChanged: (value) {
                  controller.user.value.Study = value;
                },
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
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_city,color: Color.fromARGB(255, 246, 123, 127),),
                    labelText: 'Enter Adress',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    )),
                onChanged: (value) {
                  controller.user.value.Address = value;
                },
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
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
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.money,color: Color.fromARGB(255, 246, 123, 127),),
                    labelText: 'Enter PayBal',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    )),
                onChanged: (value) {
                  controller.user.value.Paypal = value;
                },
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]")
                          .hasMatch(value)) {
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
                
                if (_formfield.currentState!.validate()) {
                  print("Data Added Successfully");
                  controller.user.value.Age=controller.selectedDate.value.toString();
                  controller.signUpUser();
                  // emailcontroller.clear();
                  // passcontroller.clear();
                  // Get.to(HomePage());
                }
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
            ),
          ),
        ]),
      ),
    ));
  }
  Widget Imageprofile( SignUpController controller) {
    return Center(
      child: Stack(
        children: <Widget>[
           Obx(() =>  CircleAvatar(
            radius: 80.0,
                    //  borderRadius: BorderRadius.circular(100),
                      child: controller.stringPickImage.value.isNotEmpty
                          ? Utility.imageFromBase64String(
                              controller.stringPickImage.value, 200, 200)
                          : image == null
                              ? Image.asset(
                                  'assets/images/boy.gif',
                                  width: 200,
                                  height: 200,
                                )
                              : Utility.imageFromBase64String(
                                  Utility.base64String(image!), 200, 200),
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
void openBottomSheet( SignUpController controller) {
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
          // OutlinedButton(
          //   onPressed: () {
          //     Get.back();
          //   },
          //   child: const Text('Close'),
          // ),
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
