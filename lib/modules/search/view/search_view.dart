import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/serach_controller.dart';

class SearchPage extends GetResponsiveView<SearchPageContrller> {
  SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
       Row(children: [
        Padding(
          padding: EdgeInsets.fromLTRB(85, 8, 8, 8),
          child: Center(
            child: Text('Search',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    color: Colors.blueGrey,
                    fontFamily: "Pacifico")),
          ),
        )
      ]),
      Container(
        child: Row(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 450,
                  child: TextField(
                      decoration: InputDecoration(
                          labelText: 'search',
                          labelStyle: const TextStyle(
                              color: Color.fromARGB(255, 184, 183, 183),
                              fontWeight: FontWeight.bold),
                          hintText: 'search',
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color.fromARGB(255, 245, 146, 149),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 245, 146, 149)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 245, 146, 149)),
                            borderRadius: BorderRadius.circular(15),
                          )))),
            ),
          )
        ]),
      ),
    ]));
  }
}
