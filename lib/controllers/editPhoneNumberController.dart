import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:washly/utils/services.dart';
import 'package:washly/views/screens/home_screen.dart';
import 'package:washly/views/screens/reverify_phone_number.dart';

import '../utils/models/tmp_user.dart';
import '../utils/models/user.dart';
import '../utils/quires.dart';

class ChangePhoneNumberController extends GetxController {
  RxBool loading = false.obs;
  TextEditingController phone = TextEditingController();
  Client? userBase;
  String indicatif = '+212';

  Future<bool> validate() async {
    if (phone.text.trim().isEmpty) {
      Get.snackbar("Error", "Phone number is required");
      return false;
    }
    if (phone.text.trim().length < 9) {
      Get.snackbar("Error", "Phone number is not valid");
      return false;
    }
    return true;
  }

  submit() {
    validate().then((value) async {
      if (value) {
        loading.toggle();
        update();

        loading.toggle();
        update();
        String phoneNumber = indicatif + phone.text;
        await checkPhoneNumber(phoneNumber).then((value) async {
          if (value == "not-found") {
            userBase!.client_phone_number = indicatif + phone.text;
            await saveCurrentUser(userBase!).then((value) async {
              await FirebaseAuth.instance.verifyPhoneNumber(
                phoneNumber: indicatif + phone.text,
                timeout: const Duration(seconds: 60),
                verificationCompleted: (phonesAuthCredentials) async {},
                verificationFailed: (FirebaseAuthException e) async {
                  loading.toggle();
                  if (e.code == 'too-many-requests') {
                    Get.snackbar("Error", "Too many requests");
                  }
                },
                codeSent: (verificationId, resendingToken) async {
                  TmpUser tmpUser =
                      TmpUser.fromJson(await SessionManager().get("tmpUser"));
                  tmpUser.phoneNo = indicatif + phone.text;
                  await SessionManager().set("tmpUser", tmpUser);
                  GetStorage().write('user_status', 'verified');
                  userBase!.client_status = 'verified';
                  Get.to(() => ReverifyPhoneScreen(),
                      arguments: verificationId,
                      transition: Transition.rightToLeft);
                  loading.toggle();
                  update();
                },
                codeAutoRetrievalTimeout: (verificationId) async {},
              );
            });
          } else {
            if (value == "found-in-washers") {
              // userBase!.is_activated_account = true;
              // userBase!.is_verified_account = true;
              // userBase!.client_phone_number = phoneNumber;
              // completeUser(userBase!).then((value) {
              //   Get.offAll(
              //     () => HomeScreen(),
              //     transition: Transition.rightToLeft,
              //   );
              // });
              // loading.toggle();
              // update();
            } else {
              loading.toggle();
              update();
              Get.snackbar("Error", "Phone number already exists");
            }
          }
        }).catchError((e) {
          print(e.toString());
          loading.toggle();
          update();

          Get.snackbar("Error", "Something went wrong");
        });
        loading.toggle();
        update();
      }
    });
  }

  @override
  Future<void> onInit() async {
    GetStorage().write('user_status', 'verified');
    loading.toggle();
    update();
    await getUserFromMemory().then((value) {
      userBase = value;
      userBase!.client_status = 'verified';
      saveCurrentUser(userBase!);
    });
    loading.toggle();
    update();
    super.onInit();
  }
}
