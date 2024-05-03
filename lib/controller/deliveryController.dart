import 'dart:math';

import 'package:deliverymaster/assests/consts/fileconsts.dart';
import 'package:flutter/cupertino.dart';

class DeliveryController extends GetxController{

  var isloading = false.obs;
  var otpsending = false.obs;
  var CustomerOtp = TextEditingController();
  String GenerateOtp(){
    var otp = "";
    for(int i =0;i<4;i++){
      otp += Random().nextInt(9).toString();
    }
    return otp;
  }

  sendOtp(orderId) async{
    otpsending(true);
    var otp = GenerateOtp();
    if(otp != ""){
      await firestore.collection(orderCollection).doc(orderId).update({
        "otp":otp.toString()
      });
    }
    otpsending(false);

  }
  orderOnDeliverey(docId) async{
    await FirebaseFirestore.instance.collection(orderCollection).doc(docId).update({
      "delivery_boy_id":currentUser!.uid,
      "on_delivery_time":FieldValue.serverTimestamp(),
      "is_order_on_delivery": true,
    });
  }
  OrderDelivered({orderId,CustomerOtp}) async{
    var Ourotp = await firestore.collection(orderCollection).doc(orderId).get().then((value){
       return value["otp"].toString();
    });
    if(CustomerOtp == Ourotp){
      await firestore.collection(orderCollection).doc(orderId).update({
        "is_order_delivered":true,
        "delivered_time":FieldValue.serverTimestamp(),
        "selles":FieldValue.increment(1)
      });
    }
  }
}