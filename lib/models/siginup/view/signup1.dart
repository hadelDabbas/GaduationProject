import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/models/siginup/controller/signup.dart';

class signupage  extends GetResponsiveView<signup>{
  signup controller=Get.put(signup());
   final _formfield = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  
   @override
  Widget build(BuildContext context) {
 
 return Scaffold(
        body: SingleChildScrollView(
          
      child: Form(
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
                  color: Colors.blue),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 450,
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    labelText: 'Enter YourName',
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
                  if (value!.isEmpty||!RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
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
                    prefixIcon: Icon(Icons.person_outline),
                    labelText: 'Enter UserName',
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
                  if (value!.isEmpty ||!RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
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
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.numbers),
                    labelText: 'Enter Your Age',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.blue),borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    )),
                       validator: (value) {
                  if (value!.isEmpty 
                     || !RegExp(r'^[1-9]{1}+$').hasMatch(value!)) {
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
              child: TextFormField(
                controller: passcontroller,
                obscureText: controller.passtoggle,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                     
                     controller.passtoggle = !controller.passtoggle;
                        
                      },
                      child:  Obx(() =>    Icon(
                        controller.passtoggle ? Icons.visibility : Icons.visibility_off),
                      )  ),
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
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 450,
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.cast_for_education),
                    labelText: 'Enter Education',
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
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
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
                    prefixIcon: Icon(Icons.location_city),
                    labelText: 'Enter Adress',
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
                  if (value!.isEmpty 
                   ||   !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)) {
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
                    prefixIcon: Icon(Icons.money),
                    labelText: 'Enter PayBal',
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
                  if (value!.isEmpty 
                 ||     !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]").hasMatch(value!)) {
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
                  emailcontroller.clear();
                  passcontroller.clear();
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
}