import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:washly/utils/models/user.dart';

import '../utils/services.dart';

class HomeController extends GetxController {
  RxBool loading = false.obs;
  Client? client;
  String? greeting;
  checkGreetingTime() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      greeting = 'goodmorning';
    }
    if (hour < 17) {
      greeting = 'goodafternoon';
    }
    greeting = 'goodevening';
    update();
  }

  @override
  void onInit() {
    loading.toggle();
    update();
    super.onInit();
    getUserFromMemory().then((value) {
      client = value;
      update();
    });
    checkGreetingTime();
    loading.toggle();
    update();
  }
}
