import 'package:deliverymaster/assests/consts/fileconsts.dart';
import 'package:deliverymaster/screens/DeliveryAtCustomer/MainPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../DeliveryPicker/home.dart';

class ChoiceScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _choiceScreen();


}

class _choiceScreen extends State<ChoiceScreen>{
  bool seller = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:  Color.fromRGBO(143, 148, 251, 1),
        title: Text("Delivery Partner",style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            "pick up From".text.bold.size(25).make(),
            30.heightBox,
            InkWell(
              onTap: (){
                seller = true;
                setState(() {

                });
              },
              child: Container(
                width: 150,
                height: 150,
                child: CircleAvatar(
                  backgroundColor: seller ? Colors.green : Colors.white,
                  child: Container(
                    width: 120,
                    height: 120,
                    child: CircleAvatar(
                      backgroundColor: Colors.cyan,
                      child: "Seller".text.white.make(),
                    ),
                  ),
                ),
              )
            ),
            50.heightBox,
            InkWell(
              onTap: (){
                seller = false;
                setState(() {

                });
              },
                child: Container(
                  width: 150,
                  height: 150,
                  child: CircleAvatar(
                    backgroundColor: seller ? Colors.white : Colors.green,
                    child: Container(
                      width: 120,
                      height: 120,
                      child: CircleAvatar(
                        backgroundColor: Colors.brown,
                        child: "Hub".text.white.make(),
                      ),
                    ),
                  ),
                )
            )

          ],
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: (){
          if(seller){
           Get.to(()=>DashBoardScreen());
          }else{
           Get.to(()=>MainPage());
          }
        },
        child: Container(
          alignment: Alignment.center,
          height: 50,
          width: double.infinity,
          color: Color.fromRGBO(143, 148, 251, 1),
          child: Text("Continue"),
        ),
      ),
    );
  }
}