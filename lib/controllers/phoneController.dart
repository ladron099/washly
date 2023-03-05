import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:washly/utils/dialogs.dart';
import 'package:washly/utils/models/tmp_user.dart';
import 'package:washly/utils/models/user.dart';
import 'package:washly/utils/quires.dart';
import 'package:washly/utils/services.dart';
import 'package:washly/views/screens/verify_phone_number.dart';

class PhoneController extends GetxController {
  RxBool loading = false.obs;
  TextEditingController phone = TextEditingController();
  Client? userBase;

  String indicatif = '+212';

  chnageIndicatif(value) {
    indicatif = value;
    print(value);
  }

  submit(context) async {
    if (userBase!.client_phone_number.isNotEmpty) {}
    if (phone.text.isEmpty || phone.text.length < 9) {
      Get.snackbar("Error", "Please enter a valid phone number");
    } else {
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
                if (e.code == 'too-many-requests') {
                 Get.snackbar("Error", "Too many requests, please try again later",
          backgroundColor: Colors.red, colorText: Colors.white);
                }
              },
              codeSent: (verificationId, resendingToken) async {
                TmpUser tmpUser =
                    TmpUser.fromJson(await SessionManager().get("tmpUser"));
                tmpUser.phoneNo = indicatif + phone.text;
                await SessionManager().set("tmpUser", tmpUser);
                print('userrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr${tmpUser.toJson()}');
                Get.to(() => VerifyPhoneScreen(),
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
            userBase!.is_activated_account = true;
            userBase!.is_verified_account = true;
            userBase!.client_phone_number = phoneNumber;
            completeUser(userBase!).then((value) {
              // goToOff(Congrats());
            });
            loading.toggle();
            update();
          } else {
            loading.toggle();
            update();
           Get.snackbar("Error", "This phone number is already registered",
          backgroundColor: Colors.red, colorText: Colors.white);
          }
        }
      }).catchError((e) {
        print(e.toString());
      Get.snackbar("Error", "Something went wrong, please try again later",
          backgroundColor: Colors.red, colorText: Colors.white);
      });
      loading.toggle();
      update();
    }
  }

  @override
  void onInit() async {
    await getUserFromMemory().then((value) {
      userBase = value;
    });
    super.onInit();
  }
}
