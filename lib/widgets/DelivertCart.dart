
import 'package:deliverymaster/assests/consts/fileconsts.dart';
import 'package:deliverymaster/controller/mapController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

Widget DeliveryCart({required BuildContext context,
  String? img,String? price,String? qty,String? name,
  required Timestamp time,
  String? address,
  String? landmark,
  String? pincode,
  String? city,
  String? state,
  String? country,
String? orderId}){
  var mapControler = Get.put(MapController());
  String userAddress = "$address ,$landmark ,$city - $pincode ,$state ,$country";
  var date = DateTime.fromMicrosecondsSinceEpoch(time.microsecondsSinceEpoch);
  var orderdate = DateFormat("dd-MM-yyyy, hh:mm a").format(date);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      ListTile(
        leading: Image.network(img!,width: 100,height: 100,),
        title: "Order by : $name".text.bold.make(),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "order id : $orderId".text.bold.make(),
            "$orderdate".text.make(),
          ],
        ),
        trailing: "2000".text.make(),
      ),
      Divider(),
      Row(
        children: [
          Icon(Icons.location_on_outlined).box.roundedFull.gray400.p4.border(color: Colors.grey).make(),
          10.widthBox,
          "$address , $landmark , $pincode".text.make(),
        ],
      ),
      Align(
          alignment: Alignment.center,
          child: TextButton(onPressed: () async{
            mapControler.launchGoogleMaps(userAddress);
          }, child: "click here for navigation".text.make(),)
      )


    ],
  ).box.roundedSM.margin(const EdgeInsets.all(12)).make();
}