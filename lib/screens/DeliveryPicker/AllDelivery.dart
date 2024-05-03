import 'package:deliverymaster/service/FirebaseService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deliverymaster/assests/consts/fileconsts.dart';

import '../../orderDetails/orderDetails.dart';
import '../../widgets/detailsCart.dart';
class AllDeliveryScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Container(
          width: 330,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(Icons.search),
              TextField(
                decoration: InputDecoration(
                    hintText: "Search for Order"
                ),
              ).box.width(200).make(),
            ],
          ),
        ),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          5.heightBox,
          "All Orders".text.bold.size(20).make().box.margin(const EdgeInsets.only(left: 20)).make(),
          Divider(
            height: 2,
            thickness: 3,
          ),
          FutureBuilder(
            future: FirebaseService.getPickedOrders(),
            builder: (BuildContext context,AsyncSnapshot snapshot) {
              if(!snapshot.hasData){
                return Center(child: CircularProgressIndicator(),);
              }else if(snapshot.data!.docs.isEmpty){
                return Center(child: Text("No Data Found"));
              }else{
                var data = snapshot.data.docs;
                return Expanded(child: ListView.separated(
                  itemCount: data.length,
                  itemBuilder: (context,index){
                    return detailsCart(context: context ,
                        img: data[index]["img"],
                        name: data[index]["order_by_name"],
                        price: data[index]["total_price"],
                        qty: data[index]["total_qty"],
                      time: data[index]["picked_time"],
                      address: data[index]["order_by_address"],
                      landmark: data[index]["order_by_landmark"],
                      pincode: data[index]["order_by_pincode"],
                      orderId: data[index].id,
                    ).onTap(() {
                      Get.to(()=>OrderDetailsScreen(data: data[index]));
                    });
                  }, separatorBuilder: (BuildContext context, int index){
                  return  Divider(
                    height: 2,
                    thickness: 5,
                  );
                },));

              }
            }
          )
        ],
      ),
    );
  }

}