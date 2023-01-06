import 'package:get/get.dart';
import 'package:washly/utils/models/order.dart';
import 'package:washly/utils/static_orders.dart';

class OrdersController extends GetxController {
  int currIndex = 0;
  List filtredOrders = orders;

  switchIndex(index) {
    currIndex = index;
    if (currIndex == 0) {
      filtredOrders = orders;
    }else if(currIndex == 1){
      filtredOrders = orders.where((element) => element.orderStatus == 1).toList();
    }
    else if(currIndex == 2){
      filtredOrders = orders.where((element) => element.orderStatus == 2).toList();
    }
    else{
      filtredOrders = orders.where((element) => element.orderStatus == 0).toList();
    }
    update();
  }
}
