import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controller/complaints_controller.dart';

class UserComplaintspageView extends GetResponsiveView<ComplaintsController> {
  ComplaintsController controller = Get.put(ComplaintsController());
  final myController = TextEditingController();
  final _formfield = GlobalKey<FormState>();
   @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Form(
        key: _formfield,
        child: Column(
          children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 450,
                      child: Material(
                        child: TextFormField(
                          controller: myController,
                            decoration: InputDecoration(
                             labelText: ' Enter Your Complaints',
                             labelStyle:
                        TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
                             hintText: 'Enter Your Complaints',
                             prefixIcon: Icon(
                                        Icons.read_more_sharp,
                                        color: Color.fromARGB(255, 245, 146, 149),
                             ),
                           ),
                          keyboardType: TextInputType.multiline,
                          minLines: 1,//Normal textInputField will be displayed
                          maxLines: 5,// when user presses enter it will adapt to it
                          onChanged: (value) {
                            
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
                  ),
                     Padding(
            padding:  EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  if (_formfield.currentState!.validate()) {
                    myController.clear();
                  }
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 0)),
                child: const Text(
                  'Send',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ),
          Text(
                                          "Prevouis Complaints",
                                          style: TextStyle(
                                              fontSize: 23,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Pacifico",
                                              color: Colors.blueGrey,
                                              decoration: TextDecoration.none),
                                        ),
                                        Column(
                                          children: [
                                            complaintscard('I want to remove group history ', 'assets/images/4.png',context,'A'),
                                            complaintscard('I want to Be Admain For Post ', 'assets/images/4.png',context,'R')
                                          ],
                                        )
          ],
        ),
      ),
    );}
    
    Widget complaintscard( String complaints, String url,BuildContext context,String type){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: MediaQuery.of(context).size.width / 0.1,
                        decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.3,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0)),
                    child: Column(children: [
                      Row(children: [
                                    Padding(
                padding: const EdgeInsets.all(8.0),
                child: GFImageOverlay(
                  height: 40,
                  width: 40,
                  shape: BoxShape.circle,
                  image: AssetImage(url),
                  boxFit: BoxFit.cover,
                ),
              ),
                                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'name',
                      style: TextStyle(
                        fontFamily: "Pacifico",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        color: Color.fromARGB(255, 246, 123, 127),
                      ),
                    ),
                  ),
                      ],),
                                        new Container(
                    padding: const EdgeInsets.all(10.0),
                    
                    child: new Column(
                      children: <Widget>[
                        new Text(
                          complaints,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  type=='A'?Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                          'Accepted ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            color: Colors.green[400],
                          ),
                        ),
                    ),
                  ):Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                          'Refuses',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            color: Colors.red,
                          ),
                        ),
                    ),
                  ),
                    ]),
        ),
      );
// Padding(
//         padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
//         child: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: GFImageOverlay(
//                 height: 40,
//                 width: 40,
//                 shape: BoxShape.circle,
//                 image: AssetImage(url),
//                 boxFit: BoxFit.cover,
//               ),
//             ),
//             Container(
//              width: MediaQuery.of(context).size.width / 0.1,
//               // height: MediaQuery.of(context).size.height / 4,
//               decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.grey,
//                     width: 1.3,
//                   ),
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(22.0)),
//               child: Card(
//                        shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(22.0)),
//                 child: Column(children: [
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       'name',
//                       style: TextStyle(
//                         fontFamily: "Pacifico",
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromARGB(255, 246, 123, 127),
//                       ),
//                     ),
//                   ),
//                   new Container(
//                     padding: const EdgeInsets.all(16.0),
//                     width: 100,
//                     child: new Column(
//                       children: <Widget>[
//                         new Text(
//                           complaints,
//                           textAlign: TextAlign.left,
//                           style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black54),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           width: 78,
//                         ),
//                         Align(
//                           alignment: Alignment.bottomRight,
//                           child: Tooltip(
//                             message: 'Not Accept',
//                             child: ElevatedButton(
//                               onPressed: () async {},
//                               child: Icon(
//                                 Icons.close,
//                                 size: 18,
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor:
//                                     Color.fromARGB(255, 238, 106, 97),
//                                 shape: CircleBorder(),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Align(
//                           alignment: Alignment.bottomRight,
//                           child: Tooltip(
//                             message: ' Accept',
//                             child: ElevatedButton(
//                               onPressed: () async {},
//                               child: Icon(
//                                 Icons.check,
//                                 size: 18,
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.green,
//                                 shape: CircleBorder(),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                   //   Icon(Icons.abc, color: Color.fromARGB(255, 246, 123, 127)),
//                 ]),
//               ),
//             ),
//           ],
//         ));
    }
    }