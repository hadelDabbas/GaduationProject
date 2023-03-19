import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/models/signIn/controller/controller.dart';

class SignIn extends GetResponsiveView<SignInController> { 
  @override
  Widget builder() {
    return Container(
   child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
            height: screen.height * 1.01 / 4,
            fit: BoxFit.fill,
            image:  AssetImage(
              "assets/images/5.png",
            ),
                  ),
          ),
           Container(
          padding: EdgeInsets.only(top: screen.height * 0.1 / 3),
          height: screen.height * 2 / 2.8,
          child: Card(
            color: Colors.grey[200],
            elevation: 15,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Center(
               child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Form(
                    child: Column(
                      children: [
                        //Sign In to your account
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Log In To Account',
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                fontSize: 23, ),
                          ),
                        ),
                        SizedBox(height: 24,),
                       Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: TextField(
                                   decoration: InputDecoration(
                                       labelText: 'Enter Password',
                                       enabledBorder: OutlineInputBorder(
                                         borderSide: const BorderSide(width: 3, color: Colors.blue),
                                         borderRadius: BorderRadius.circular(15),
                                       ),
                                       focusedBorder: OutlineInputBorder(
                                         borderSide: const BorderSide(width: 3, color: Colors.red),
                                         borderRadius: BorderRadius.circular(15),
                                       )),
                                 ),
                       ),

                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                             
                            },
                            child: const Text(
                              'Forgot Your Passeword?',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        //btn Sign In
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue),
                              fixedSize: MaterialStateProperty.all(
                                  const Size.fromWidth(150))),
                          onPressed: () {
                          
                          },
                          child: Text(
                            "Login",
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                        
                          },
                          // ignore: sort_child_properties_last
                          child: Text('CreateYourAccount?'.tr),
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

            )
          )
           )
        //  Wrap(
        //         children: controller.game.map((e) => Container(
        //                   child: Padding(
        //                     padding: const EdgeInsets.all(8.0),
        //                     child: Text(''),
        //                   ),
        //                 ))
        //             .toList(),
        //       ),
    ) ],
   ),
    );}}