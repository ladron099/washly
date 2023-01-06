import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:washly/utils/models/car.dart';

class Order {
  String? clientFullName;
  double? distance;
  String? clientAvatar;
  String? orderType;
  String? orderAddress;
  int? orderStatus;
  int? orderPaymentMethod;
  double? orderSubtotal;
  double? orderDiscount;
  LatLng? clientLocation;
  LatLng? washerLocation;
  Car? orderCar;

  Order(
      {this.clientFullName,
      this.distance,
      this.clientAvatar,
      this.orderType,
      this.orderStatus,
      this.orderCar,
      this.orderAddress,
      this.orderDiscount,
      this.orderPaymentMethod,
      this.orderSubtotal,
      this.clientLocation,
      this.washerLocation});

  Order.fromJson(Map<String, dynamic> json) {
    clientFullName = json['client_full_name'];
    distance = json['distance'];
    clientAvatar = json['client_avatar'];
    orderType = json['order_type'];
    orderStatus = json['order_status'];
    orderCar = Car.fromJson(json['order_car']);
    orderAddress = json['order_address'];
    orderDiscount = json['order_discount'];
    orderPaymentMethod = json['order_payment_method'];
    orderSubtotal = json['order_subtotal'];
    clientLocation = json['client_location'];
    washerLocation = json['washer_location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['client_full_name'] = clientFullName;
    data['distance'] = distance;
    data['client_avatar'] = clientAvatar;
    data['order_type'] = orderType;
    data['order_status'] = orderStatus;
    data['order_car'] = orderCar;
    data['order_address'] = orderAddress;
    data['order_discount'] = orderDiscount;
    data['order_payment_method'] = orderPaymentMethod;
    data['order_subtotal'] = orderSubtotal;
    return data;
  }

  double orderTotal() {
    return (orderSubtotal! - orderDiscount!);
  }
}
