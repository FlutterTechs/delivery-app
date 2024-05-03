class OrderModel {
  String? bookingDate;
  String? color;
  String? contactNumber;
  String? img;
  String? invoice;
  bool? isOrderCancel;
  bool? isOrderConfirmed;
  bool? isOrderDelivered;
  bool? isOrderDispatched;
  bool? isOrderOnDelivery;
  bool? isOrderPlaced;
  bool? isOrderReady;
  bool? isOrderRejected;
  String? orderByAddress;
  String? orderByCity;
  String? orderByState;
  String? orderByCountry;
  String? orderById;
  String? orderByLandmark;
  String? orderByName;
  String? orderByPincode;
  String? orderName;
  String? otp;
  String? paymentMethod;
  String? productId;
  String? shipmentType;
  String? totalPrice;
  String? totalQty;
  String? vendorId;
  String? vendorName;
  String? pickerId;
  String? deliveryBoyId;

  OrderModel(
      {this.bookingDate,
        this.color,
        this.contactNumber,
        this.img,
        this.invoice,
        this.isOrderCancel,
        this.isOrderConfirmed,
        this.isOrderDelivered,
        this.isOrderDispatched,
        this.isOrderOnDelivery,
        this.isOrderPlaced,
        this.isOrderReady,
        this.isOrderRejected,
        this.orderByAddress,
        this.orderByCity,
        this.orderByState,
        this.orderByCountry,
        this.orderById,
        this.orderByLandmark,
        this.orderByName,
        this.orderByPincode,
        this.orderName,
        this.otp,
        this.paymentMethod,
        this.productId,
        this.shipmentType,
        this.totalPrice,
        this.totalQty,
        this.vendorId,
        this.vendorName,
        this.pickerId,
        this.deliveryBoyId});

  OrderModel.fromJson(Map<String, dynamic> json) {
    bookingDate = json['booking_date'];
    color = json['color'];
    contactNumber = json['contact_number'];
    img = json['img'];
    invoice = json['invoice'];
    isOrderCancel = json['is_order_cancel'];
    isOrderConfirmed = json['is_order_confirmed'];
    isOrderDelivered = json['is_order_delivered'];
    isOrderDispatched = json['is_order_dispatched'];
    isOrderOnDelivery = json['is_order_on_delivery'];
    isOrderPlaced = json['is_order_placed'];
    isOrderReady = json['is_order_ready'];
    isOrderRejected = json['is_order_rejected'];
    orderByAddress = json['order_by_address'];
    orderByCity = json['order_by_city'];
    orderByState = json['order_by_state'];
    orderByCountry = json['order_by_country'];
    orderById = json['order_by_id'];
    orderByLandmark = json['order_by_landmark'];
    orderByName = json['order_by_name'];
    orderByPincode = json['order_by_pincode'];
    orderName = json['order_name'];
    otp = json['otp'];
    paymentMethod = json['payment_method'];
    productId = json['product_id'];
    shipmentType = json['shipment_type'];
    totalPrice = json['total_price'];
    totalQty = json['total_qty'];
    vendorId = json['vendor_id'];
    vendorName = json['vendor_name'];
    pickerId = json['picker_id'];
    deliveryBoyId = json['delivery_boy_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_date'] = this.bookingDate;
    data['color'] = this.color;
    data['contact_number'] = this.contactNumber;
    data['img'] = this.img;
    data['invoice'] = this.invoice;
    data['is_order_cancel'] = this.isOrderCancel;
    data['is_order_confirmed'] = this.isOrderConfirmed;
    data['is_order_delivered'] = this.isOrderDelivered;
    data['is_order_dispatched'] = this.isOrderDispatched;
    data['is_order_on_delivery'] = this.isOrderOnDelivery;
    data['is_order_placed'] = this.isOrderPlaced;
    data['is_order_ready'] = this.isOrderReady;
    data['is_order_rejected'] = this.isOrderRejected;
    data['order_by_address'] = this.orderByAddress;
    data['order_by_city'] = this.orderByCity;
    data['order_by_state'] = this.orderByState;
    data['order_by_country'] = this.orderByCountry;
    data['order_by_id'] = this.orderById;
    data['order_by_landmark'] = this.orderByLandmark;
    data['order_by_name'] = this.orderByName;
    data['order_by_pincode'] = this.orderByPincode;
    data['order_name'] = this.orderName;
    data['otp'] = this.otp;
    data['payment_method'] = this.paymentMethod;
    data['product_id'] = this.productId;
    data['shipment_type'] = this.shipmentType;
    data['total_price'] = this.totalPrice;
    data['total_qty'] = this.totalQty;
    data['vendor_id'] = this.vendorId;
    data['vendor_name'] = this.vendorName;
    data['picker_id'] = this.pickerId;
    data['delivery_boy_id'] = this.deliveryBoyId;
    return data;
  }
}
