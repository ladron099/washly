import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:washly/utils/dialogs.dart';
import 'package:washly/utils/models/user.dart';
import 'package:washly/utils/quires.dart';
import 'package:washly/utils/services.dart';
import 'package:washly/views/screens/verify_phone_number.dart';

class PhoneController extends GetxController{
  RxBool loading = false.obs;
  TextEditingController phone = TextEditingController();
  Client? userBase;


  String indicatif = '+212';

  chnageIndicatif(value) {
    indicatif = value;
    print(value);
  }

  submit(context) async {
    // if(userBase!.customer_phone_number.isNotEmpty){

    // }
    if (phone.text.isEmpty || phone.text.length < 9) {
      showAlertDialogOneButton(context, 'Données requises',
          'Vous devez entrer un numéro de téléphone correct.', 'Ok');
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
                loading.toggle();
                if (e.code == 'too-many-requests') {
                  showAlertDialogOneButton(
                      context,
                      'Trop de demandes',
                      "Nous avons bloqué toutes les demandes de cet appareil en raison d'une activité inhabituelle, réessayez",
                      "Ok");
                }
              },
              codeSent: (verificationId, resendingToken) async {
                loading.toggle();
                update();
                Get.to(() => VerifyPhoneScreen(),
                    arguments: verificationId,
                    transition: Transition.rightToLeft);
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
            showAlertDialogOneButton(
              context,
              'Le numéro de téléphone existe déjà',
              'Veuillez fournir un autre numéro de téléphone',
              'Ok',
            );
          }
        }
      }).catchError((e) {
        print(e.toString());
        loading.toggle();
        update();
        showAlertDialogOneButton(
          context,
          'Erreur',
          'Une erreur s\'est produite, veuillez réessayer',
          'Ok',
        );
      });
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
