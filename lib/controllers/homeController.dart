import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:washly/utils/models/user.dart';
import 'package:washly/utils/quires.dart';

import '../utils/services.dart';
import '../views/screens/edit_profile_screen.dart';

class HomeController extends GetxController {
  RxBool loading = true.obs;
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
    getUser().then((value) async {
      client = value;
         await GetStorage().write('user_status', 'verified');
          client!.client_status = 'verified';
          
      saveCurrentUser(value);
      if (client!.client_city.isEmpty ||
          client!.client_date_naissance.isEmpty ||
          client!.client_sexe.isEmpty) {
        Get.snackbar(
          "complete profile",
          "Please go to your profile settings to complete your profile or you can click here",
          onTap: (snack) {
            Get.to(
              () => EditInfoScreen(),
              transition: Transition.rightToLeft,
            );
          },
          duration: Duration(seconds: 8),
        );
      }

      update();
    });
    checkGreetingTime();
    Timer(Duration(seconds: 1), () {
      loading.toggle();
      update();
    });

    super.onInit();
  }
}
