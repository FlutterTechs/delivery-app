import 'package:deliverymaster/assests/consts/fileconsts.dart';

class FirebaseService {

  static getPickedOrders(){
    return firestore.collection(orderCollection).where(Filter.and(Filter("picker_id",isEqualTo: currentUser!.uid),Filter("is_order_delivered",isEqualTo: false),Filter("is_order_on_delivery",isEqualTo: false),Filter("is_order_dispatched",isEqualTo: true))).get();
  }
  static outOfDelivery(){
    return firestore.collection(orderCollection).where(Filter.and(Filter("delivery_boy_id",isEqualTo: currentUser!.uid),Filter("is_order_delivered",isEqualTo: false),Filter("is_order_on_delivery",isEqualTo: true))).get();
  }
  static getCancelofPickerOrder(){
    return firestore.collection(orderCollection).where(Filter.and(Filter("picker_id",isEqualTo: currentUser!.uid),Filter("is_order_cancel",isEqualTo: true))).snapshots();
  }
  static getCancelofDeliveryBoyOrder(){
    return firestore.collection(orderCollection).where(Filter.and(Filter("delivery_boy_id",isEqualTo: currentUser!.uid),Filter("is_order_cancel",isEqualTo: true))).snapshots();
  }
  static getCount() async{
    var res = await Future.wait([
      firestore.collection(orderCollection).where(Filter.and(Filter("picker_id",isEqualTo: currentUser!.uid),Filter("is_order_dispatched",isEqualTo: true),Filter("is_order_on_delivery",isEqualTo: false))).get().then((value) {
        return value.docs.length;
      }),
      firestore.collection(orderCollection).where(Filter.and(Filter("delivery_boy_id",isEqualTo: currentUser!.uid),Filter("is_order_delivered",isEqualTo: false),Filter("is_order_on_delivery",isEqualTo: true))).get().then((value){
        return value.docs.length;
      }),
      firestore.collection(orderCollection).where(Filter.and(Filter("delivery_boy_id",isEqualTo: currentUser!.uid),Filter("is_order_delivered",isEqualTo: true),Filter("is_order_on_delivery",isEqualTo: true))).get().then((value) {
        return value.docs.length;
      })
    ]);
    return res;
  }
}