import 'package:deliverymaster/assests/consts/fileconsts.dart';
class  PickOrderController extends GetxController{
  var order_id;


  getOrder(order_id) async{
    await FirebaseFirestore.instance.collection(orderCollection).doc(order_id).get().then((value) {
      if(value != null){
        return true;
      }
    });
  }
  var OrderID;
  showOrder(orderId) async{
    await FirebaseFirestore.instance.collection(orderCollection).doc(order_id).get();
  }



}