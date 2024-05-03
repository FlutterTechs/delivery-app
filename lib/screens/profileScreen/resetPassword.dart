
import 'package:deliverymaster/assests/consts/fileconsts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/customTextFeild.dart';
import '../../widgets/ourBUtton.dart';

class ResetPasswordScreen extends StatelessWidget{
  String email;
  String password;
  ResetPasswordScreen(this.password,this.email);
  var OldPwd = TextEditingController();
  var NewPwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(password);
    var authController = Get.put(AuthController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:  Color.fromRGBO(143, 148, 251, 1),
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_rounded,color: Colors.white,)),
        title: "Reset Password".text.bold.white.make(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            customTextFeild(
                controller: OldPwd,
                title: "Old Password",
                hint: "Enter Old Password"
            ),
            customTextFeild(
                controller: NewPwd,
                title: "New Password",
                hint: "Enter New Password"
            ),
            20.heightBox,
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                  onTap: (){

                  },
                  child: "Using email".text.color( Color.fromRGBO(143, 148, 251, 1)).make().onTap(() {
                    authController.sendPasswordResetEmail(email);
                  })),
            ),
            10.heightBox,
            ourButton(
                title: "Reset Password",
                color:  Color.fromRGBO(143, 148, 251, 1),
                onpress: (){
                  authController.changeAuthPassword(
                      oldPassword: OldPwd.text,
                      newPassword: NewPwd.text,
                      confirmPassword: password
                  );
                },
                textColor: Colors.white
            ).box.width(context.screenWidth -70).make()
          ],
        ),
      ),
    );
  }

}