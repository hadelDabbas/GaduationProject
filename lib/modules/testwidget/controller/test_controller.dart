
import 'package:get/get.dart';

import '../view/question.dart';

class TestController extends GetxController{
  var selectedvalue="".obs;
 var object= new Question('','','','','');
 var AllQustion= <Question>[].obs;
 var correctvalue=''.obs;
  var result=0.obs;
 

    @override
    void onInit(){
     
      super.onInit();
      fullInfo();
      // getUser();
    }
     void fullInfo(){
             AllQustion.add(new Question('which Mwmory is the basic in java ?', "Heap", "Immortal", "LTM", "Heap"),);
               AllQustion.add(new Question('What Is A Nibble ?', "Is A 4bits", "Is A 4bits", "Is A 16bits", "Is A 12bits"),);
               AllQustion.add(new Question('What Is Temporary Memory ?', "Buffer", "RAM", "Buffer", "DROM"),);
                AllQustion.add(new Question('Wireless Communication Technologies ?', "ZigBee", "IEEE", "LAN", "ZigBee"),);
     }
      void onChangevalue(var select,var correct){
         selectedvalue.value=select;
       
         if(select==correct){
          result.value++;
            print('succses');
         }
        
      }
    }