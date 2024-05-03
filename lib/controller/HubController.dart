import 'package:deliverymaster/assests/consts/fileconsts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
class HubController extends GetxController{


  var orderController = TextEditingController();
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

  Future<DocumentSnapshot>? order;
  Future<DocumentSnapshot<Object?>?> findOrder({orderId}) async{
    order = firestore.collection(orderCollection).doc(orderId).get();
    return order;
  }
  outToDelivery(docId) async {
    await FirebaseFirestore.instance.collection(orderCollection).doc(docId).update({
      "delivery_boy_id": currentUser!.uid,
      "out_of_delivery_time":FieldValue.serverTimestamp(),
      "is_order_on_delivery": true,
    }).whenComplete(() {
      order = null;
    });
  }

}