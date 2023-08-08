import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/password_controller.dart';

//import 'package:getwidget/getwidget.dart';

class ForgetViewPage extends GetResponsiveView<passwordController> {
  final _formfield = GlobalKey<FormState>();
  final passcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final Confirmpasscontroller = TextEditingController();

  ForgetViewPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formfield,
        child: Column(
          children: [
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
              height: 30,
            ),
            const Center(
              child: Text(
                'Forget Password',
                style: TextStyle(
                    color: Color.fromARGB(255, 42, 42, 114),
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    fontFamily: "Pacifico"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 350,
                  height: 200,
                  child: Image.asset('assets/images/forget.png')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 450,
                child: TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 246, 123, 127),
                      ),
                      labelText: 'Enter Email',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                        borderRadius: BorderRadius.circular(15),
                      )),
                  onChanged: (value) {
                    controller.email.value = value;
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
                    return null;
                  },
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
                                width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 3, color: Color.fromARGB(255, 42, 42, 114)),
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
                        controller.newPassword.value = value;
                      },
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 450,
                child: Obx(
                  () => TextFormField(
                    controller: Confirmpasscontroller,
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
                        labelText: 'Confirm Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                          borderRadius: BorderRadius.circular(15),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Confirm Password";
                      } else if (Confirmpasscontroller.text.length < 6) {
                        return "Password Length Should Be More Than 6 Charachters";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      controller.confirmpassword.value = value;
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (Confirmpasscontroller.text == passcontroller.text) {
                    if (_formfield.currentState!.validate()) {
                      controller.confirmPassword();
                    }
                  } else {
                    diolg('Confirm from fields');
                  }
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 50)),
                child: const Text(
                  'Confirm',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future diolg(String txt) {
    return Get.dialog(Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 240, 230, 230),
          border: Border.all(color: Color.fromARGB(255, 42, 42, 114), width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        width: 200,
        height: 120,
        child: Row(
          children: [
            Center(
              child: Text(txt,
                  style: const TextStyle(
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
