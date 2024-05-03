import 'package:deliverymaster/assests/consts/fileconsts.dart';
import 'package:deliverymaster/controller/otpController.dart';
import 'package:deliverymaster/screens/otpverifyScreen/otpVerifyScreen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:get/get.dart';
class OrderDetailsScreen extends StatelessWidget{
  dynamic data;
  OrderDetailsScreen({super.key,required this.data});
  @override
  Widget build(BuildContext context) {
    var otpController = Get.put(OtpController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: "Order Details".text.make(),
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      ),
      body: ListView(
        children: [
          ListTile(
              title: "Order Status:".text.make(),
              trailing:( data["is_order_dispatched"] && data["is_order_on_delivery"] && !data["is_order_delivered"] )? ("Out of Delivery".text.orange700.make()) : (data["is_order_delivered"] ? "Order Delivered".text.green700.make() : (data["is_order_dispatched"] ?"Order At Hub".text.yellow700.make() : "Order At Sellers".text.yellow700.make()) )
          ),

          ListTile(
            title: "Order image:".text.make(),
            trailing: Image.network(data["img"]),
          ),
          ListTile(
            title: "Customer :".text.make(),
            trailing: Text(data["order_by_name"]),
          ),
          ListTile(
            title: "Order Name".text.make(),
            trailing: data["order_name"].toString().text.wrapWords(true).make().box.width(context.screenWidth /3 ).make(),
          ),
          ListTile(
            title: "QTY:".text.make(),
            trailing: data["total_qty"].toString().text.make(),
          ),
          ListTile(
            title: "Price:".text.make(),
            trailing: data["total_price"].toString().text.make(),
          ),
          ListTile(
            title: "Address:".text.make(),
            trailing: Text(
                " Cutomer Name : ${data["order_by_name"]} \n${data["order_by_address"]} ${data["order_by_landmark"]} \n ${data["order_by_city"]}"
                    " ${data["order_by_pincode"]} ${data["order_by_state"]} ${data["contact_number"]}"
            ),
          ),
          ListTile(
              title: "Color:".text.make(),
              trailing: Container(
                width: 50,
                height: 50,
                color: Color(int.parse(data['color'].toString())),
              )
          ),
          ListTile(
            title: "Payment Type:".text.make(),
            trailing: data["payment_method"].toString().text.make(),
          ),
          ListTile(
            title: "Delivery At:".text.make(),
            trailing: data["shipment_type"].toString().text.make(),
          ),
          ListTile(
            title: "Order Id:".text.make(),
            trailing: data.id.toString().text.make(),
          ),
          ListTile(
            title: "Product Barcode:".text.make(),
          ),
          BarcodeWidget(
            barcode: Barcode.aztec(), // Barcode type and settings
            data: data.id.toString(), // Content
            width: 200,
            height: 200,
          ),

          data["is_order_on_delivery"] ? ElevatedButton(onPressed: () async{
            String otp = await otpController.sendOtp(data.id);
            Get.to(()=>OtpVerificationScreen(otp,data.id));
            otpController.myOtp = "";
          }, child: Text("Send Otp")): Container(),
          40.heightBox
        ],
      ),
    );
  }

}