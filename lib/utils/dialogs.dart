import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart' as u;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/views/screens/home_screen.dart';
import 'package:washly/views/screens/login_screen.dart';

exitDialog(context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("exit").tr(),
        // titlePadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        // contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        content: Text("areyousureexit").tr(),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: Size(63.w, 28.h),
                  backgroundColor: Colors.grey[350],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(67.r))),
              onPressed: () {
                Get.back();
              },
              child: Text("no").tr()),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: Size(63.w, 28.h),
                  backgroundColor: redColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(67.r))),
              onPressed: () {
                exit(0);
              },
              child: Text("yes").tr()),
        ],
      ),
    );

exitReasonDialog(context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            15.verticalSpace,
            Text(
              "cancelorder",
              style: TextStyle(
                  color: redColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600),
            ).tr(),
            15.verticalSpace,
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: u.tr("telluswhy"),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.r),
                  borderSide: BorderSide(color: borderGreyColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.r),
                  borderSide: BorderSide(color: primaryColor),
                ),
              ),
            )
          ],
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.h),
        actionsPadding: EdgeInsets.symmetric(horizontal: 20.w),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: Size(63.w, 28.h),
                  backgroundColor: Colors.grey[350],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(67.r))),
              onPressed: () {
                Get.back();
              },
              child: Text("no").tr()),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: Size(63.w, 28.h),
                  backgroundColor: redColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(67.r))),
              onPressed: () {
                Get.offAll(() => HomeScreen(),
                    transition: Transition.rightToLeft);
              },
              child: Text("yes").tr()),
        ],
      ),
    );

logoutDialog(context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("logout").tr(),
        content: Text("areyousureyouwantlogout").tr(),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: Size(63.w, 28.h),
                  backgroundColor: Colors.grey[350],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(67.r))),
              onPressed: () {
                Get.back();
              },
              child: Text("no").tr()),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: Size(63.w, 28.h),
                  backgroundColor: redColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(67.r))),
              onPressed: () async {
                // String fcm = await SessionManager().get('client_fcm');
                await FirebaseAuth.instance.signOut();
                await FacebookAuth.instance.logOut();
                await GoogleSignIn(scopes: ['profile', 'email']).signOut();
                await SessionManager().remove("currentUser");
                await SessionManager().destroy();
                await GetStorage().erase();
                // SessionManager().set('client_fcm', fcm);
                Get.offAll(() => LoginScreen(),
                    transition: Transition.rightToLeft);
                await GetStorage().write("isFirstTime", false);
              },
              child: Text("yes").tr()),
        ],
      ),
    );

deletCarDialog(context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("deletecar").tr(),
        // titlePadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        // contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        content: Text("areyousurewantdelete").tr(),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: Size(63.w, 28.h),
                  backgroundColor: Colors.grey[350],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(67.r))),
              onPressed: () {
                Get.back();
              },
              child: Text("no").tr()),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  minimumSize: Size(63.w, 28.h),
                  backgroundColor: redColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(67.r))),
              onPressed: () {
                Get.back();
              },
              child: Text("yes").tr()),
        ],
      ),
    );

showAlertDialogOneButton(BuildContext context, title, text, btnText) {
  // set up the button
  Widget okButton = TextButton(
    child: Text(
      btnText,
      style: TextStyle(
        fontSize: 14.sp,
        color: dark,
        height: 1.4,
        fontFamily: "LatoRegular",
      ),
    ),
    onPressed: () {
      Get.back();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        color: primaryColor,
        fontFamily: "LatoSemiBold",
      ),
    ),
    content: Text(
      text,
      style: TextStyle(
        fontSize: 14.sp,
        color: dark,
        height: 1.4,
        fontFamily: "LatoRegular",
      ),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
