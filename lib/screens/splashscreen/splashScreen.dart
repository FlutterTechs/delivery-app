import 'package:deliverymaster/screens/ChoiceScreen/ChoiceScreen.dart';
import 'package:deliverymaster/screens/login/loginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../assests/consts/fileconsts.dart';
import '../../assests/consts/firebase.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _splashScreen();

}

class _splashScreen extends State<SplashScreen>{
  changeScreen(){
    Future.delayed(Duration(seconds: 3),(){
      auth.authStateChanges().listen((user) {
        if(user != null){
          Get.offAll(() => ChoiceScreen());
        }else{
          Get.offAll(() => LoginScreen());
        }
      });

    });
  }
  @override
  void initState() {
    super.initState();
    changeScreen();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Image.asset("assets/images/logo.jpg"),
               "Delivery Master".text.bold.size(30).make(),
            Align(
              alignment: Alignment.bottomCenter,
              child: "version : 1.0.0".text.make(),
            )
          ],
        ),
      ),
    );
  }

}