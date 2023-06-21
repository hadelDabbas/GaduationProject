import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controller/signin_controller.dart';
//import 'package:getwidget/getwidget.dart';

class SignInViewPage extends GetResponsiveView<SignIncontroller> {
  @override
  SignIncontroller controller = Get.put(SignIncontroller());
  final _formfield = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();

  SignInViewPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formfield,
          child: Column(children: [
            InkWell(
              onTap: () => Get.back(),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child:
                      Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Center(
              child: Text(
                'Welcome',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Colors.blueGrey,
                    fontFamily: "Pacifico"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 400,
                  height: 250,
                  child: Image.asset('assets/images/9.png')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 450,
                child: Material(
                  child: TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color.fromARGB(255, 246, 123, 127),
                        ),
                        labelText: 'Enter Email',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Colors.blueGrey),
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
                      return null;
                    },
                    onChanged: (Value) {
                      controller.email.value = Value;
                    },
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 450,
                  child: Obx(
                    () => TextFormField(
                      controller: passcontroller,
                      obscureText: controller.passtoggle.value,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color.fromARGB(255, 246, 123, 127),
                          ),
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
                            borderSide: const BorderSide(
                                width: 3, color: Colors.blueGrey),
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
                        return null;
                      },
                      onChanged: (value) {
                        controller.password.value = value;
                      },
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      onPressed: () {
                        Get.rootDelegate.toNamed(Routes.password);
                      },
                      child: Text(
                        'Forget Your Password ?',
                        style: TextStyle(color: Colors.grey[600]),
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 35, 8, 8),
              child: ElevatedButton(
                onPressed: () {
                  if (_formfield.currentState!.validate()) {
                    controller.SignIn();
                  }
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 50)),
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.rootDelegate.toNamed(Routes.signup);
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 50)),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
