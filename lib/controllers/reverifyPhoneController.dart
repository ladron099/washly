import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:washly/utils/dialogs.dart';
import 'package:washly/utils/models/tmp_user.dart';
import 'package:washly/views/screens/home_screen.dart';

import '../utils/models/user.dart';
import '../utils/services.dart';
import '../views/screens/congrats_screen.dart';

class ReverifyPhoneController extends GetxController {
  TextEditingController code = TextEditingController();
  RxBool loading = false.obs, isTrue = true.obs;
  TmpUser tmpUser = TmpUser.fromClient();
  int second = 30;
  String message = '', verificationCode = '';

  Timer? countdownTimer;
  Duration myDuration = const Duration(seconds: 30);
  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    final seconds = myDuration.inSeconds - reduceSecondsBy;
    second = seconds;
    if (seconds <= 0) {
      countdownTimer!.cancel();
    } else {
      myDuration = Duration(seconds: seconds);
    }
    update();
  }

  reSendCode() async {
    code.clear();
    update();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: tmpUser!.phoneNo,
      verificationCompleted: (phonesAuthCredentials) async {},
      verificationFailed: (verificationFailed) async {},
      codeSent: (verificationId, resendingToken) async {
        verificationCode = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) async {},
    );
    second = 30;
    myDuration = const Duration(seconds: 30);
    startTimer();
    update();
  }

  submit(context) async {
    print(code.text);
    if (code.text.isNotEmpty) {
      print(5555);
      loading.toggle();
      update();
      try {
        print(9999);
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationCode, smsCode: code.text);
        print("this is how i treat ${credential.token}");
        User? user = FirebaseAuth.instance.currentUser;
        print(user!.uid);
        user.updatePhoneNumber(credential).then((value) async {
          TmpUser tmpUser =
              TmpUser.fromJson(await SessionManager().get("tmpUser"));
          Client userBase =
              Client.fromJson(await SessionManager().get('currentUser'));
          userBase.is_activated_account = true;
          userBase.is_verified_account = true;
          userBase.client_phone_number = tmpUser.phoneNo!;
          GetStorage().write('user_status', 'verified');
          GetStorage().write('isLoggedIn', true);
          await SessionManager().set('currentUser', userBase);
          await createUser(userBase).then(
            (value) async {
              // updateFcm(userBase);
              Get.offAll(() => HomeScreen());

              loading.toggle();
              update();
            },
          );
        });
        print(tmpUser!.email);
      } catch (e) {
        print(e.toString() + "ehhhhh");
        Get.snackbar("Error", "Code incorrect",
            backgroundColor: Colors.red, colorText: Colors.white);
        loading.toggle();
        update();
      }
    } else {
      Get.snackbar("Error", "Please enter the given code",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
    loading.toggle();
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    GetStorage().write('user_status', 'verified');
    tmpUser = TmpUser.fromJson(await SessionManager().get('tmpUser'));
    print(tmpUser!.toJson());
    verificationCode = Get.arguments;
    isTrue = false.obs;
    startTimer();
    update();
  }
}
