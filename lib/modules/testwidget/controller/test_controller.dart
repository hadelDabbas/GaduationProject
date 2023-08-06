
import 'package:get/get.dart';

import '../../../app/model/test.dart';
import '../data/test_repositry.dart';
import '../view/question.dart';

class TestController extends GetxController{
  var selectedvalue="".obs;
 var object= new Question('','','','','');
 var AllQustion= <Question>[].obs;
 var correctvalue=''.obs;
  var result=0.obs;
  final idtest=0.obs;
  final testRepo=TestRepository();
  final ListTestContent=<Test>[];
  final nowTest=Test().obs;

    @override
    void onInit(){
     
      super.onInit();
       getAllTestKind();
      // fullInfo();
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
        Future<void> getAllTestKind() async {
    var data = await testRepo.GetAllTypeTest();
  ListTestContent.assignAll(data);
  }
       Future<void> getTest() async {
    var data = await testRepo.GetTest(idtest.value);
   nowTest.value=data!;
  }
    }