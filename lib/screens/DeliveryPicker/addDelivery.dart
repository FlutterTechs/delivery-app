import 'package:deliverymaster/assests/consts/fileconsts.dart';
import 'package:deliverymaster/controller/dashBoardController.dart';
import 'package:deliverymaster/widgets/OrderCart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../orderDetails/orderDetails.dart';
class AddDeliverySreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _addDeliveryScreen();

}

class _addDeliveryScreen extends State<AddDeliverySreen>{
  var _scanBarcode;
  @override
  Widget build(BuildContext context) {
    var dashController = Get.put(DashBoardController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
            ),
            automaticallyImplyLeading: false,
            title: "Today's Parcel".text.bold.make(),
            backgroundColor: Color.fromRGBO(143, 148, 251, 1),
            actions: <Widget>[
              CircleAvatar(backgroundColor: Colors.green,child: Icon(Icons.person),),
              20.widthBox
            ],
            expandedHeight: 350,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: const EdgeInsets.all(30),
                color: Color.fromRGBO(143, 148, 251, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  100.heightBox,
                  Align(
                    alignment: Alignment.centerLeft,
                    child:"Enter the order id or Scan QR".text.bold.make(),
                  ),
                10.heightBox,
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      height: 50,
                      color: Colors.white,
                      width: context.screenWidth - 130,
                      child: TextField(
                        controller: dashController.orderController,
                        decoration: InputDecoration(
                          border: InputBorder.none
                        ),
                      ),
                    ),
                    10.widthBox,
                    Container(
                      height: 50,
                      color: Colors.white,
                      width: 50,
                      child: IconButton(onPressed: (){
                        dashController.scanQR();
                      }, icon: Icon(Icons.qr_code_scanner_outlined)),
                    )
                  ],
                ),
                40.heightBox,
                InkWell(
                  onTap: (){
                    if(dashController.orderController.text.isNotEmpty){
                      dashController.findOrder(orderId: dashController.orderController.text);
                      dashController.orderController.clear();
                    }else{
                      Fluttertoast.showToast(msg: "Please enter order id");
                    }
                    setState(() {
                    });
                  },
                  child: Container(
                    height: 40,
                    color: Colors.black,
                    alignment: Alignment.center,
                    width: context.screenWidth-60,
                    child: "Add Order".text.bold.white.make(),
                  ),
                )
                ],
              ),),

            ),
          ),
          FutureBuilder<DocumentSnapshot>(
            future: dashController.order,
            builder: (BuildContext context,AsyncSnapshot snapshot) {
              
              if(dashController.order != null){
               if(!snapshot.hasData){
                 return SliverToBoxAdapter(
                   child: CircularProgressIndicator(),
                 );
               }else{
                if(snapshot.data["is_order_dispatched"]){
                  return SliverToBoxAdapter(
                    child: Text("Already  picked"),
                  );
                }else{
                  return SliverList.separated(
                    itemCount: 1,
                    itemBuilder: (context,index){
                      return OrderCart(context: context ,
                          img:  snapshot.data["img"].toString(),
                          name: snapshot.data["order_name"].toString(),
                          price: snapshot.data["total_price"].toString(),
                          qty: snapshot.data["total_qty"].toString(),
                          time: snapshot.data["booking_date"],
                          address: snapshot.data["total_qty"].toString(),
                          landmark: snapshot.data["order_by_landmark"].toString(),
                          orderId: snapshot.data.id.toString(),
                          pincode: snapshot.data["order_by_pincode"].toString(),
                          onpress: (){
                            print(snapshot.data.id);
                            dashController.shipped(snapshot.data.id.toString());
                            dashController.order = null;
                            setState(() {
                            });
                          }
                      ).onTap(() {
                        Get.to(()=>OrderDetailsScreen(data: snapshot.data));

                      });
                    }, separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      height: 2,
                      thickness: 5,
                    );
                  },);

                }
               }
              }else{
                return SliverList.separated(
                  itemCount: 1,
                  itemBuilder: (context,index){
                    return Text("no data");
                  }, separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 2,
                    thickness: 5,
                  );
                },);
              }
              }

          )
        ],
      ),
    );
  }
}