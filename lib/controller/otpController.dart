import 'dart:math';

import 'package:deliverymaster/assests/consts/fileconsts.dart';
import 'package:deliverymaster/screens/DeliveryAtCustomer/MainPage.dart';
import 'package:flutter/cupertino.dart';

class OtpController extends GetxController{

  var verificationCon = TextEditingController();

  var myOtp = "";
  Future<String> sendOtp(OrderId) async{
    for(var i = 0;i<5;i++){
      myOtp += Random().nextInt(9).toString();
    }
   await firestore.collection(orderCollection).doc(OrderId).update({
     "otp":myOtp
   });
    return myOtp;
  }

  orderDelivered(OrderId) async{
    await firestore.collection(orderCollection).doc(OrderId).update({
      "is_order_delivered":true
    }).then((value) {
      Get.offAll(()=>MainPage());
      verificationCon.clear();
    });
  }

}