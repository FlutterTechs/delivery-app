import 'package:deliverymaster/assests/consts/fileconsts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget detailsCart({required BuildContext context,
  String? img,
  String? price,String? qty,String? name,
  String? address,
  String? landmark,
  String? pincode,
  required Timestamp time,
  String? orderId
}){
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
        child: TextButton(onPressed: (){

        }, child: "click here for navigation".text.make(),)
    )


  ],
).box.roundedSM.margin(const EdgeInsets.all(12)).make();
}