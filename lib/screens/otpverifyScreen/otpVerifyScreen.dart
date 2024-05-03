import 'package:deliverymaster/assests/consts/fileconsts.dart';
import 'package:deliverymaster/controller/otpController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
class OtpVerificationScreen extends StatelessWidget{
  String otp;
  String orderId;
  String? checkOtp ;
  OtpVerificationScreen(this.otp,this.orderId, {super.key});
  @override
  Widget build(BuildContext context) {
    checkOtp = otp;
    var otpController = Get.put(OtpController());
    print(orderId);
    print(checkOtp);
    print(otp);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.heightBox,
           Text("Verification Code",style: TextStyle(
             fontSize: 30,color: Colors.grey.shade700
           ),),
            Container(
              width: 230,
              child: Text("We have been sent you the  verification code on order track"
                  " please enter it below",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17
              ),),
            ),
            30.heightBox,
            OtpTextField(
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              showFieldAsBox: true,
              clearText: true,
              onCodeChanged: (String code) {
              },
              onSubmit: (String verificationCode){
                verificationCode == checkOtp ?
                     otpController.orderDelivered(orderId)
                    :
                showDialog(
                    context: context,
                    builder: (context){
                      print("otp code");
                      return AlertDialog(
                        title: Text("Verification Code"),
                        content: Text('Invalid otp please try again'),
                      );
                    }
                );
              }, // end onSubmit
            ),
            TextButton(onPressed: (){
              otpController.myOtp = "";
              otpController.sendOtp(orderId);
              checkOtp = otpController.myOtp;
            }, child: Text("Resend otp"))
          ],
        ).box.p12.make(),
      ),
    );
  }

}