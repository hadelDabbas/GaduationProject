import 'package:get/get.dart';
import 'package:graduationproject/app/model/Answer.dart';
import 'package:graduationproject/modules/groups/data/group_repository.dart';

import '../../../app/model/content.dart';
import '../../../app/model/test.dart';
import '../../../app/model/testDto.dart';
import '../data/test_repositry.dart';
import '../view/question.dart';

class TestController extends GetxController {
  var selectedvalue = "".obs;
  var object = Question('', '', '', '', '');
  var AllQustion = <Question>[].obs;
  var correctvalue = ''.obs;
  var result = 0.obs;
  final idtest = 0.obs;
  final textadd =
      'yyy'.tr;
  final text =
      'zzz'.tr;
  final testRepo = TestRepository();
  final Addtest = Test().obs;
  final ListTestContent = <Content>[];
  final contents = <Content>[];
  final ListTestByContent = <TestDto>[];
  final ListCorrectvalue = <String>[];
  final nowTest = Test().obs;
  final numberQustion = 0.obs;

  final answer1 = Answer().obs;
  final answer2 = Answer().obs;
  final answer3 = Answer().obs;
  final answer4 = Answer().obs;
  final idTest = 0.obs;
final Listtsst=['It Test ','Arabic Test','History Test','Sport Test'];
  @override
  void onInit() {
    super.onInit();
    getContent();
    getAllTestKind();
    // fullInfo();
    // getUser();
  }

  void fullInfo() {
    AllQustion.add(
      Question('which Mwmory is the basic in java ?', "Heap", "Immortal", "LTM",
          "Heap"),
    );
    AllQustion.add(
      Question('What Is A Nibble ?', "Is A 4bits", "Is A 4bits", "Is A 16bits",
          "Is A 12bits"),
    );
    AllQustion.add(
      Question('What Is Temporary Memory ?', "Buffer", "RAM", "Buffer", "DROM"),
    );
    AllQustion.add(
      Question('Wireless Communication Technologies ?', "ZigBee", "IEEE", "LAN",
          "ZigBee"),
    );
  }

  Future<void> getContent() async {
    var data = await GroupRepository().GetAllContent();
    contents.assignAll(data);
  }

  void onChangevalue(var select, var correct) {
    selectedvalue.value = select;
    if (correctvalue.value == true) {
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
    numberQustion.value = ListTestByContent.length;
    //nowTest.value=data!;
  }

  Future<void> addQution(Test t) async {
    if (t.IdContent == null || t.IdContent == 0) t.IdContent = 1;
    var res = await testRepo.AddQution(t);
    if (res) {
      Get.back();
    }
  }

  Future<void> addAnswer(Answer a) async {
    var res = await testRepo.AddAnswer(a);
  }

  Future<int> GetId(String test) async {
    var res = await testRepo.GetIdTest(test);
    return res ?? 0;
  }
}
