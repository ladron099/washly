import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:washly/utils/dialogs.dart';
import 'package:washly/utils/models/tmp_user.dart';
import 'package:washly/utils/models/user.dart';
import 'package:washly/utils/quires.dart';
import 'package:washly/utils/services.dart';
import 'package:washly/views/screens/congrats_screen.dart';
import 'package:washly/views/screens/home_screen.dart';
import 'package:washly/views/screens/phone_screen.dart';
import 'package:washly/views/screens/profile_picture_screen.dart';

class LoginController extends GetxController {
  RxBool loading = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void validate() {
    if (emailController.text.trim().isEmpty) {
      showAlertDialogOneButton(
          Get.context!, "Email vide", "Veuillez entrer votre email", "Ok");
    } else if (passwordController.text.trim().isEmpty) {
      showAlertDialogOneButton(Get.context!, "Mot de passe vide",
          "Veuillez entrer votre mot de passe", "Ok");
    } else if (!EmailValidator.validate(emailController.text.trim())) {
      showAlertDialogOneButton(Get.context!, "Email invalide",
          "Veuillez entrer un email valide", "Ok");
    } else {
      signInWithEmail(emailController.text.trim(), passwordController.text);
    }
  }

  Future<String> userHasMail(email) async {
    String provider = '';
    await FirebaseFirestore.instance
        .collection('users')
        .where('client_email', isEqualTo: email)
        .where('is_deleted_account', isEqualTo: false)
        .snapshots()
        .first
        .then((value) async {
      List<DocumentSnapshot> documentSnapshot = value.docs;
      if (value.size != 0) provider = documentSnapshot[0]['client_auth_type'];
    });

    await FirebaseFirestore.instance
        .collection('washers')
        .where('washer_email', isEqualTo: email)
        .where('is_deleted_account', isEqualTo: false)
        .snapshots()
        .first
        .then((value) async {
      List<DocumentSnapshot> documentSnapshot = value.docs;
      if (value.size != 0) provider = documentSnapshot[0]['washer_type_auth'];
    });

    return provider;
  }

  signInWithEmail(String email, String password) async {
    loading.toggle();
    update();
    await userHasMail(email).then((value) async {
      if (value == "Email" || value == "") {
        try {
          UserCredential authResult = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password);
          User? user = authResult.user;
          await getUser(user!.uid).then((value) async {
            value.client_last_login_date =
                DateFormat("dd-MM-yyyy HH:mm", "Fr_fr").format(DateTime.now());
            Client userBase = value;
            await completeUser(userBase);
            await SessionManager().set(
              'tmpUser',
              TmpUser(
                email: userBase.client_email,
                phoneNo: userBase.client_phone_number,
                password: password,
                is_exist: true,
                type_auth: 'Email',
              ),
            );
            await GetStorage().write('isLoggedIn', true);
            // Get.offAll(() => const HomePage(),
            //     transition: Transition.rightToLeft);
            if (value.is_verified_account == false) {
              Get.offAll(() => ProfilePictureScreen(),
                  transition: Transition.rightToLeft);
            }
            if (value.is_verified_account == true) {
              if (value.is_activated_account == false) {
                Get.offAll(() => CongratsScreen(),
                    transition: Transition.rightToLeft);
              } else {
                Get.offAll(() => const HomeScreen(),
                    transition: Transition.rightToLeft);
              }
            }
          });
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            showAlertDialogOneButton(Get.context!, "User not found",
                "There is no user with this Email.", "Ok");
          } else if (e.code == 'wrong-password') {
            showAlertDialogOneButton(
                Get.context!,
                "incorrect password",
                "Mot de passe erroné, veuillez vérifier votre mot de passe.",
                "Ok");
          }
        }
      } else {
        showAlertDialogOneButton(Get.context!, "User already exists",
            "Please try to login with $value", "Ok");
      }
    });
    loading.toggle();
    update();
  }

  void signInWithGoogle(context) async {
    loading.toggle();
    GoogleSignInAccount? googleAccount =
        await GoogleSignIn(scopes: ['profile', 'email']).signIn();
    if (googleAccount != null) {
      await isUserExist(googleAccount.email.toLowerCase()).then((value) async {
        if (value != "Google" && value != "") {
          await FirebaseAuth.instance.signOut();
          await GoogleSignIn(scopes: ['profile', 'email']).signOut();
          return showAlertDialogOneButton(
              context,
              "L'utilisateur existe déjà",
              "Il existe déjà un compte avec cet e-mail, veuillez essayer de vous connecter avec $value",
              "Ok");
        } else {
          GoogleSignInAuthentication googleSignInAuthentication =
              await googleAccount.authentication;
          AuthCredential credential = GoogleAuthProvider.credential(
              accessToken: googleSignInAuthentication.accessToken,
              idToken: googleSignInAuthentication.idToken);
          UserCredential authResult =
              await FirebaseAuth.instance.signInWithCredential(credential);
          User? user = authResult.user;
          await getUserFrom(user!.email, "Google").then((message) async {
            if (message == "new-account" || message == "is-not-verified") {
              Client userBase = Client(
                  client_uid: user.uid,
                  client_full_name: user.displayName!,
                  client_email: user.email!,
                  client_phone_number: '-',
                  client_picture: user.photoURL!,
                  client_date_naissance: '',
                  client_sexe: '',
                  client_auth_type: 'Google',
                  is_activated_account: false,
                  client_cancelled_delivery: 0,
                  client_succeded_delivery: 0,
                  client_planned_delivery: 0,
                  client_stars_mean: 0,
                  client_note: 0,
                  client_last_order_state: false,
                  client_last_login_date:
                      DateFormat("dd-MM-yyyy HH:mm", "Fr_fr")
                          .format(DateTime.now()),
                  client_registration_date:
                      DateFormat("dd-MM-yyyy HH:mm", "Fr_fr")
                          .format(DateTime.now()),
                  is_deleted_account: false,
                  is_verified_account: false,
                  client_city: '',
                  client_longitude: 0,
                  client_latitude: 0,
                  client_total_orders: 0);
              await SessionManager().set(
                'tmpUser',
                TmpUser(
                  phoneNo: '',
                  password: '',
                  email: user.email!,
                  is_exist: false,
                  type_auth: "Google",
                ),
              );
              await GetStorage().write('user_status', 'new');
              await SessionManager().set('currentUser', userBase);
              await createUser(userBase).then(
                (value) async {
                  print('after creating');
                  // updateFcm(userBase);
                  Get.offAll(() => PhoneScreen(),
                      transition: Transition.rightToLeft);
                },
              );
            }
            if (message == "is-verified") {
              await getUser(user.uid).then((value) async {
                await SessionManager().set(
                  'tmpUser',
                  TmpUser(
                    phoneNo: value.client_phone_number,
                    password: '',
                    email: user.email!,
                    is_exist: true,
                    type_auth: "Google",
                  ),
                );
                value.client_last_login_date =
                    DateFormat("dd-MM-yyyy HH:mm", "Fr_fr")
                        .format(DateTime.now());
                Client userBase = value;
                await completeUser(userBase);
                await GetStorage().write('user_status', 'verified');
                await GetStorage().write('isLoggedIn', true);
                await SessionManager().set('currentUser', userBase);
                // updateFcm(userBase);
                Get.offAll(() => HomeScreen(),
                    transition: Transition.rightToLeft);
              });
            } else {
              await getUser(user.uid).then((value) async {
                await SessionManager().set(
                  'tmpUser',
                  TmpUser(
                    phoneNo: value.client_phone_number,
                    password: '',
                    email: user.email!,
                    is_exist: true,
                    type_auth: "Google",
                  ),
                );
                value.client_last_login_date =
                    DateFormat("dd-MM-yyyy HH:mm", "Fr_fr")
                        .format(DateTime.now());
                Client userBase = value;
                await completeUser(userBase);
                await SessionManager().set('currentUser', userBase);
                await GetStorage().write('isLoggedIn', true);
                // updateFcm(userBase);
                Get.offAll(() => PhoneScreen(),
                    transition: Transition.rightToLeft);
              });
            }
          });
        }
      });
      loading.toggle();
    } else {
      loading.toggle();
    }
  }

  void signInWithFacebook(context) async {
    loading.toggle();
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      UserCredential authResult = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      User? user = authResult.user;
      if (authResult.user != null) {
        await isUserExist(user!.email).then((value) async {
          if (value != 'Facebook' && value != '') {
            await FirebaseAuth.instance.signOut();
            await FacebookAuth.instance.logOut();
            return showAlertDialogOneButton(
                context,
                "L'utilisateur existe déjà",
                "Il existe déjà un compte avec cet e-mail, veuillez essayer de vous connecter avec $value",
                "Ok");
          } else {
            await getUserStatus(user.email).then((value) async {
              if (!value) {
                Client userBase = Client(
                    client_uid: user.uid,
                    client_full_name: user.displayName!,
                    client_email: user.email!,
                    client_phone_number:  '-',
                    client_picture: user.photoURL!,
                    client_date_naissance: '',
                    client_sexe: '',
                    client_auth_type: 'Facebook',
                    is_activated_account: false,
                    client_cancelled_delivery: 0,
                    client_succeded_delivery: 0,
                    client_planned_delivery: 0,
                    client_stars_mean: 0,
                    client_note: 0,
                    client_last_order_state: false,
                    client_last_login_date:
                        DateFormat("dd-MM-yyyy HH:mm", "Fr_fr")
                            .format(DateTime.now()),
                    client_registration_date:
                        DateFormat("dd-MM-yyyy HH:mm", "Fr_fr")
                            .format(DateTime.now()),
                    is_deleted_account: false,
                    is_verified_account: false,
                    client_city: '',
                    client_longitude: 0,
                    client_latitude: 0,
                    client_total_orders: 0);
                await SessionManager().set(
                  'tmpUser',
                  TmpUser(
                    phoneNo: '',
                    password: '',
                    email: user.email!,
                    is_exist: false,
                    type_auth: "Facebook",
                  ),
                );
                await GetStorage().write('user_status', 'new');
                await SessionManager().set('currentUser', userBase);
                await GetStorage().write('isLoggedIn', true);
                await createUser(userBase).then(
                  (value) async {
                    // updateFcm(userBase);
                    Get.offAll(() => PhoneScreen());
                  },
                );
              } else {
                await getUser(user.uid).then((value) async {
                  value.client_last_login_date =
                      DateFormat("dd-MM-yyyy HH:mm", "Fr_fr")
                          .format(DateTime.now());
                  await SessionManager().set(
                    'tmpUser',
                    TmpUser(
                      phoneNo: '',
                      password: '',
                      email: user.email!,
                      is_exist: true,
                      type_auth: "Facebook",
                    ),
                  );
                  Client userBase = value;
                  await completeUser(userBase);
                  await GetStorage().write('user_status', 'verified');
                  await SessionManager().set('currentUser', userBase);
                  await GetStorage().write('isLoggedIn', true);
                  // updateFcm(userBase);
                  Get.offAll(() => const HomeScreen(),
                      transition: Transition.rightToLeft);
                });
              }
            });
          }
        });
        loading.toggle();
      } else {
        loading.toggle();
      }
    } catch (e) {
      print(e.toString());
      loading.toggle();
      return showAlertDialogOneButton(context, "Problème avec Facebook",
          "Il n'y avait pas de compte facebook dans ce telephone", "Ok");
    }
  }
}
