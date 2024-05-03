import 'dart:async';
import 'package:deliverymaster/assests/consts/fileconsts.dart';
import 'package:deliverymaster/screens/DeliveryAtCustomer/AllCustomersOrder.dart';
import 'package:deliverymaster/screens/DeliveryAtCustomer/pickFromHubScreen.dart';
import 'package:deliverymaster/screens/DeliveryPicker/AllDelivery.dart';
import 'package:deliverymaster/screens/DeliveryPicker/addDelivery.dart';
import 'package:deliverymaster/screens/profileScreen/profileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
class DashBoardController extends GetxController{

  var orderController = TextEditingController();
  var navItems = [
    const BottomNavigationBarItem(icon: Icon(CupertinoIcons.cube_box_fill),label: "Today Orders"),
    const BottomNavigationBarItem(icon: Icon(CupertinoIcons.cube_box),label: "All Orders"),
    const BottomNavigationBarItem(icon: Icon(CupertinoIcons.person),label: "Profile"),
  ];
  var Screens = [
    AddDeliverySreen(),
    AllDeliveryScreen(),
    ProfileScreen()
  ];
  var DeliveryScreens = [
    PickHubOrderScreen(),
    AllCustomersOrder(),
    ProfileScreen()
  ];
  var screenIndex = 0;
  var pageIndex = 0;

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if(barcodeScanRes != null && barcodeScanRes != "" && barcodeScanRes != "-1"){
      orderController.text = barcodeScanRes;
    }


  }
  var isHave = false.obs;


  Future<DocumentSnapshot>? order;
  Future<DocumentSnapshot<Object?>?> findOrder({orderId}) async{
   order = firestore.collection(orderCollection).doc(orderId).get();
   return order;
  }


  shipped(docId) async {
    await FirebaseFirestore.instance.collection(orderCollection).doc(docId).update({
      "picker_id": currentUser!.uid,
      "picked_time":FieldValue.serverTimestamp(),
      "is_order_dispatched": true,
    }).whenComplete(() {
      order = null;
    });
  }



}