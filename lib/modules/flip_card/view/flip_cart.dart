
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/flip_cart_contrllor.dart';
import 'flip_score.dart';


class GamePageView extends GetResponsiveView<GamePageController> {
  GamePageController controller= Get.put(GamePageController());
 @override
  Widget builder() {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 214, 171, 185),
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Center(
            child: Text("Memory Game",style: TextStyle(fontSize: 40.0,
            fontWeight: FontWeight.bold,color: Colors.white
            ),),
          ),
          SizedBox(height: 20.0,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Obx(() =>  scoreBoard("Tries", '${controller.tires}')),
        Obx(() =>   scoreBoard("Score", '${controller.score}'))
            ],),
            SizedBox(height: screen.height,width: screen.width,
            child: GridView.builder(
            //  itemCount: 8,
              itemCount: controller.gameIng!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:3,
            crossAxisSpacing: 12.0 ,
            mainAxisSpacing: 12.0,
      
             ),
             padding: EdgeInsets.all(16),
             itemBuilder: ((context, index) {
               return 
               GestureDetector(
                onTap: (() {
                  print(controller.card_list[index]);
                  print('asia   asia   asia');
                 controller.tires.value++;
                   controller.gameIng![index]=controller.card_list[index];
                   controller.matchchet.add({index:controller.card_list[index]});  
                   if(controller.matchchet.length==2){
                    if(controller.matchchet[0].values.first==controller.matchchet[1].values.first){
                      print(true);
                    controller.score.value +=100;
                     controller.matchchet.clear();        
                    }else{
                      print(false);
                      Future.delayed(Duration(milliseconds: 500),(){
                       print(controller.gameIng); 
                       controller.gameIng![controller.matchchet[0].keys.first]=
                       controller.hiddencard;
                        controller.gameIng![controller.matchchet[1].keys.first]=
                       controller.hiddencard;
                       controller.matchchet.clear();
                      });
                    }
                   }
           }),
                child: 
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.amber[200],
            borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(image: 
       AssetImage(controller.gameIng![index]),
            
            fit: BoxFit.cover
            ),
            
                  ),
                ),
                ) ;
             })),
            
            
            ),
            
          ],
        ),
      ),
    );

  }  
}
 