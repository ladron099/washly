import 'dart:ui';

import 'package:boxicons/boxicons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:washly/utils/services.dart';
import 'package:washly/views/components/widgets.dart';
import 'package:washly/views/screens/edit_password_screen.dart';
import 'package:washly/views/screens/edit_phone_number_screen.dart';
import 'package:washly/views/screens/edit_profile_picture_screen.dart';
import 'package:washly/views/screens/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          hasTitle: true, title: "profile", subTitle: "personalinfo"),
      body: Container(
        width: 375.w,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                60.verticalSpace,
                ClipRRect(
                  child: Image.asset(
                    "assets/images/profile.png",
                    fit: BoxFit.cover,
                    width: 210.w,
                    height: 210.w,
                  ),
                ),
                21.verticalSpace,
                Text(
                  "Abdessamad Berahhou",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
                ),
                35.verticalSpace,
                ProfileWidget(
                  text: "editpersonalinfo",
                  icon: Boxicons.bx_user,
                  onPress: () {
                    Get.to(() => EditInfoScreen());
                  
                  },
                ),
                22.verticalSpace,
                ProfileWidget(
                  text: "changepassword",
                  icon: Boxicons.bx_lock,
                  onPress: () {
                    Get.to(() => ChangePasswordScreen());
                  },
                ),
                22.verticalSpace,
                ProfileWidget(
                  text: "changeppicture",
                  icon: Boxicons.bx_image_alt,
                  onPress: () {
                    Get.to(() => ChangeProfilePictureScreen());
                  },
                ),
                22.verticalSpace,
                ProfileWidget(
                  text: "changephone",
                  icon: Boxicons.bx_phone_call,
                  onPress: () {
                    Get.to(() => ChangePhoneNumberScreen());
                  
                  },
                ),
                40.verticalSpace,
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "needhelp",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ).tr())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
