import 'package:get/get.dart';
import 'package:washly/utils/models/order.dart';

import '../utils/models/car.dart';

class ReviewCheckOutController extends GetxController{
  Order? order;
  getOrder(){
   order = Order(
      clientFullName: 'Mohamed Ali',
      distance: 2.5,
      clientAvatar: 'assets/images/profile.png',
      orderType: 'Car',
      orderStatus: 1,
      orderCar: Car(
          carName:"Bmw",
   carType:"Grande",
   carMark:"Nark",
   carModel:4584,
   carColor:"red",
   carMatricule:"35q3eef",
   carPicture:"assets/images/car.png",
      ),

      );
  }


  @override
  void onInit() {
    super.onInit(); 
    getOrder();
  }
}