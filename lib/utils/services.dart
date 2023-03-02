import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:washly/utils/models/user.dart';
import 'package:washly/views/screens/home_screen.dart';
import 'package:washly/views/screens/login_screen.dart';
import 'package:washly/views/screens/phone_screen.dart';
import 'package:washly/views/screens/welcome_screen.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

Future<Widget> initWidget() async {
  Widget? main;
  final isFirstTime = await GetStorage().read("isFirstTime");
  final isLogedIn = await GetStorage().read("isLogedIn");
  final userStatus = await GetStorage().read('user_status');
  if (isFirstTime != null) {
    if (isLogedIn != null) {
      switch (userStatus) {
        case 'verified':
          main = HomeScreen();
          break;
        case 'new':
          main = PhoneScreen();
          break;
      }
    } else {
      main = LoginScreen();
    }
  } else {
    main = WelcomeScreen();
  }
  return main!;
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

Future createUser(Client user) async {
  final docUser =
      FirebaseFirestore.instance.collection('users').doc(user.client_uid);
  await docUser.set(user.toJson());
}

Future<String> getUserFrom(email, type) async {
  String message = "new-account";
  await FirebaseFirestore.instance
      .collection('washers')
      .where('washer_email', isEqualTo: email)
      .where('washer_type_auth', isEqualTo: type)
      .where('is_deleted_account', isEqualTo: false)
      .snapshots()
      .first
      .then((value) async {
    if (value.size != 0) {
      if (value.docs.first.get('is_verified_account')) {
        message = "is-verified";
      } else {
        message = "is-not-verified";
      }
    }
  });
  await FirebaseFirestore.instance
      .collection('users')
      .where('client_email', isEqualTo: email)
      .where('client_auth_type', isEqualTo: type)
      .where('is_deleted_account', isEqualTo: false)
      .snapshots()
      .first
      .then((value) async {
    if (value.size != 0) {
      if (value.docs.first.get('is_verified_account')) {
        message = "is-verified";
      } else {
        message = "is-not-verified";
      }
    } else {
      message == "new-account";
    }
  });
  return message;
}

Future<bool> saveCurrentUser(Client userBase) async {
  bool done = false;
  await SessionManager()
      .set('currentUser', userBase)
      .then((value) => done = true);

  return done;
}

Future<Client?> getUserFromMemory() async {
  Client? user = Client.fromJson(await SessionManager().get("currentUser"));
  
  return user;
}
