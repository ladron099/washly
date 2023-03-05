import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:washly/views/screens/login_screen.dart';

class ChangePasswordController extends GetxController {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool loading = false.obs;

  changePassword() async {
    await validate().then((value) async {
      if (value) {
        loading.toggle();
        update();
        try {
          var user = await FirebaseAuth.instance.currentUser
              ?.updatePassword(newPasswordController.text);
          Get.snackbar("Success", "Password changed successfully");
          Get.to(LoginScreen());
          print(FirebaseAuth.instance.currentUser!.uid);

          // String fcm = await SessionManager().get('client_fcm');
          await FirebaseAuth.instance.signOut();
          await FacebookAuth.instance.logOut();
          await GoogleSignIn(scopes: ['profile', 'email']).signOut();
          await SessionManager().remove("currentUser");
          await SessionManager().destroy();
          await GetStorage().erase();
          // SessionManager().set('client_fcm', fcm);
          Get.offAll(() => LoginScreen(), transition: Transition.rightToLeft);
          await GetStorage().write("isFirstTime", false);
        } catch (e) {
          Get.snackbar("Error", "Error changing password ");
          print(e.toString());
        }
        loading.toggle();
        update();
      }
    });
  }

  Future<bool> validate() async {
    if (oldPasswordController.text.trim().isEmpty) {
      Get.snackbar("Error", "Please enter your old password");
      return false;
    }
    if (newPasswordController.text.trim().isEmpty) {
      Get.snackbar("Error", "Please enter your new password");
      return false;
    }
    if (confirmPasswordController.text.trim().isEmpty) {
      Get.snackbar("Error", "Please confirm your new password");
      return false;
    }
    if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match");
      return false;
    }

    return true;
  }
}
