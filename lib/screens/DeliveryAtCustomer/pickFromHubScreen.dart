import 'package:deliverymaster/assests/consts/fileconsts.dart';
import 'package:deliverymaster/controller/HubController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../orderDetails/orderDetails.dart';
import '../../widgets/OrderCart.dart';

class PickHubOrderScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>  _pickHubOrderScreen();

}

class _pickHubOrderScreen extends State<PickHubOrderScreen>{
  var _scanBarcode;
  @override
  Widget build(BuildContext context) {
    var hubController = Get.put(HubController());
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
                            controller: hubController.orderController,
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
                            hubController.scanQR();
                          }, icon: Icon(Icons.qr_code_scanner_outlined)),
                        )
                      ],
                    ),
                    40.heightBox,
                    InkWell(
                      onTap: (){
                        if(hubController.orderController.text.isNotEmpty){
                          hubController.findOrder(orderId: hubController.orderController.text);
                          hubController.orderController.clear();
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
              future: hubController.order,
              builder: (BuildContext context,AsyncSnapshot snapshot) {

                if(hubController.order != null){
                  if(!snapshot.hasData){
                    return SliverToBoxAdapter(
                      child: CircularProgressIndicator(),
                    );
                  }else{
                    if(snapshot.data["is_order_on_delivery"]){
                      return SliverToBoxAdapter(
                        child: Text("Already on delivery"),
                      );
                    }else if(!snapshot.data["is_order_ready"]){
                      return SliverToBoxAdapter(
                        child: Text("Wrong product"),
                      );

                    }else if(!snapshot.data["is_order_dispatched"]){
                      return SliverToBoxAdapter(
                        child: Text("Wrong product"),
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
                              pincode: snapshot.data["order_by_pincode"].toString(),
                              orderId: snapshot.data.id.toString(),
                              landmark: snapshot.data["order_by_landmark"].toString(),
                              address: snapshot.data["order_by_address"].toString(),
                              onpress: (){
                                print(snapshot.data.id);
                                hubController.outToDelivery(snapshot.data.id.toString());
                                hubController.order = null;
                                setState(() {
                                });
                              }
                          ).onTap(() {
                            Get.to(()=>OrderDetailsScreen(data:snapshot.data));
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