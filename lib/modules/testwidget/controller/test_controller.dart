
import 'package:get/get.dart';
import 'package:graduationproject/app/model/Answer.dart';

import '../../../app/model/content.dart';
import '../../../app/model/test.dart';
import '../../../app/model/testDto.dart';
import '../data/test_repositry.dart';
import '../view/question.dart';

class TestController extends GetxController{
  var selectedvalue="".obs;
 var object= new Question('','','','','');
 var AllQustion= <Question>[].obs;
 var correctvalue=''.obs;
  var result=0.obs;
  final idtest=0.obs;
  final textadd='Here, the responsible admin selects a test type and adds a new question attached to the correct answer and the wrong answers';
  final text='This interface displays all the tests that this account can perform';
  final testRepo=TestRepository();
  final Addtest=Test().obs;
  final ListTestContent=<Content>[];
  final ListTestByContent=<TestDto>[];
  final ListCorrectvalue=<String>[];
  final nowTest=Test().obs;
  final  numberQustion=0.obs;
  final answer=Answer().obs;
  final idTest=0.obs;

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
       if(correctvalue.value==true){
        result.value++;
        print('succses');
       }
        //  if(select==correct){
        //   result.value++;
        //     print('succses');
        //  }
        
      }
        Future<void> getAllTestKind() async {
    var data = await testRepo.GetTestsContent();
  ListTestContent.assignAll(data);
  }
       Future<void> getTestForContent(int idcontent) async {
    var data = await testRepo.GetTestsForContent(idcontent);
    ListTestByContent.assignAll(data);
    numberQustion.value= ListTestByContent.length;
   //nowTest.value=data!;
  }
    Future<void> addQution(Test t) async {
    var res = await testRepo.AddQution(t);
    if (res) {
      Get.back();
    }
  }
     Future<void> addAnswer(Answer a) async {
    var res = await testRepo.AddAnswer(a);
    if (res) {
      Get.back();
    }
  }
    Future<void> GetId(String test) async {
    var res = await testRepo.GetIdTest(test);
    idTest.value=res!;
  }
    }