import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:washly/views/screens/home_screen.dart';
import 'package:washly/views/screens/welcome_screen.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

Future<Widget> initWidget(Widget? main) async{
  final isFirstTime = await GetStorage().read("isFirstTime");
  if(isFirstTime != null){
    return HomeScreen();
  }
  else{
    return WelcomeScreen();
  }
}


goTo(Widget widget) {
  Get.to(()=>widget, transition: Transition.leftToRight);
}

goOff(Widget widget) {
  Get.offAll(()=>widget, transition: Transition.leftToRight);
}


handlerPermission() async {
  var permission = await Permission.sensors.status;
  if (permission.isDenied) {
    await Permission.phone.request();
    await Permission.location.request();
  }
  if (permission.isRestricted) {
    await Permission.phone.request();
    await Permission.location.request();
  }
  if (permission.isPermanentlyDenied) {
    await Permission.phone.request();
    await Permission.location.request();
  }
  if (permission.isLimited) {
    await Permission.phone.request();
    await Permission.location.request();
  }
}