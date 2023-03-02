import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/utils/quires.dart';
import 'package:washly/views/screens/login_screen.dart';

class ForgetPasswordController extends GetxController {
  RxBool loading = false.obs;
  TextEditingController email = TextEditingController();

  submit(context) async {
    if (email.text.isNotEmpty) {
      loading.toggle();
      update();
      try {
        await isUserExist(email.text).then((value) {
          if (value == 'Facebook' || value == 'Google') {
            Get.snackbar('Error', 'This email is linked with with: $value',
                duration: Duration(seconds: 5));
          } else if (value == 'Email') {
            FirebaseAuth.instance
                .sendPasswordResetEmail(email: email.text)
                .then((value) {
                  Get.offAll(()=>LoginScreen(), transition: Transition.rightToLeft);
              Get.snackbar('Success', 'Please check your email',
                  duration: Duration(seconds: 5),
                  backgroundColor: secondaryColor,
                  colorText: Colors.white);
            });
          } else {
            Get.snackbar('Error', 'This email is not registered',
                duration: Duration(seconds: 5),
                backgroundColor: redColor,
                colorText: Colors.white);
          }
          loading.toggle();
          update();
        });
      } catch (ex) {
        loading.toggle();
        update();
        Get.snackbar('Error', ex.toString(),
            duration: Duration(seconds: 5), backgroundColor: redColor);
      }
    } else {
      Get.snackbar('Error', 'Please enter your email',
          duration: Duration(seconds: 5), backgroundColor: redColor);
    }
  }
}
