import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:washly/utils/dialogs.dart';
import 'package:washly/utils/models/tmp_user.dart';
import 'package:washly/utils/models/user.dart';
import 'package:washly/utils/services.dart';
import 'package:washly/views/screens/congrats_screen.dart';

class VerifyPhoneController extends GetxController {
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
    if (code.text.isNotEmpty) {
      loading.toggle();
      update();
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationCode, smsCode: code.text);
        // AuthCredential emailCredential = EmailAuthProvider.credential(
        //   email: tmpUser!.email,
        //   password: tmpUser!.password,
        // );
        // UserCredential authResult =
        //     await FirebaseAuth.instance.signInWithCredential(credential);
        // User? user = authResult.user;
        User? user = FirebaseAuth.instance.currentUser; 
        print(user!.uid);
        user.linkWithCredential(credential).then((value) async {
          // Client userBase = Client(
          //     client_uid: user.uid,
          //     client_full_name: user.displayName!,
          //     client_email: tmpUser!.email,
          //     client_phone_number: tmpUser!.phoneNo,
          //     client_picture:
          //         'https://firebasestorage.googleapis.com/v0/b/motopickup-353120.appspot.com/o/user-images%2F150-1503945_transparent-user-png-default-user-image-png-png.png?alt=media&token=46482c39-d266-41b4-ab98-98e7d6521842',
          //     client_date_naissance: '',
          //     client_sexe: '',
          //     client_auth_type: 'Google',
          //     is_activated_account: false,
          //     client_cancelled_delivery: 0,
          //     client_succeded_delivery: 0,
          //     client_planned_delivery: 0,
          //     client_stars_mean: 0,
          //     client_note: 0,
          //     client_last_order_state: false,
          //     client_last_login_date: DateFormat("dd-MM-yyyy HH:mm", "Fr_fr")
          //         .format(DateTime.now()),
          //     client_registration_date: DateFormat("dd-MM-yyyy HH:mm", "Fr_fr")
          //         .format(DateTime.now()),
          //     is_deleted_account: false,
          //     is_verified_account: false,
          //     client_city: '',
          //     client_longitude: 0,
          //     client_latitude: 0,
          //     client_total_orders: 0);
          TmpUser tmpUser = TmpUser.fromJson(await SessionManager().get("tmpUser"));
          Client userBase = Client.fromJson(await SessionManager().get('currentUser'));
          userBase.is_activated_account = true;
          userBase.is_verified_account = true;
          userBase.client_phone_number = tmpUser.phoneNo!;
          GetStorage().write('user_status', 'verified');
          GetStorage().write('isLoggedIn', true);
          await SessionManager().set('currentUser', userBase);
          await createUser(userBase).then(
            (value) async {
              // updateFcm(userBase);
              Get.offAll(() => CongratsScreen());
              loading.toggle();
              update();
            },
          );
        });
        print(tmpUser!.email);
      } catch (e) {
        showAlertDialogOneButton(
            context, "Code requis", "Veuillez entrer le bon code.", "Ok");
        loading.toggle();
        update();
      }
    } else {
      showAlertDialogOneButton(
          context, "Code requis", "Veuillez entrer le bon code.", "Ok");
    }
  }

  @override
  void onInit() async {
    super.onInit();
    tmpUser = TmpUser.fromJson(await SessionManager().get('tmpUser'));
    print(tmpUser!.toJson());
    verificationCode = Get.arguments;
    isTrue = false.obs;
    startTimer();
    update();
  }
}
