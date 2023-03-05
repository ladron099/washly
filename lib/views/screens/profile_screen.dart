import 'dart:ui';

import 'package:boxicons/boxicons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:washly/controllers/profileScreenController.dart';
import 'package:washly/utils/services.dart';
import 'package:washly/views/components/loading_screen.dart';
import 'package:washly/views/components/waveLoading.dart';
import 'package:washly/views/components/widgets.dart';
import 'package:washly/views/screens/edit_password_screen.dart';
import 'package:washly/views/screens/edit_phone_number_screen.dart';
import 'package:washly/views/screens/edit_profile_picture_screen.dart';
import 'package:washly/views/screens/edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileScreenController>(
        init: ProfileScreenController(),
        builder: (controller) {
          return controller.loading.value
              ? WaveLoadingScreen()
              : Scaffold(
                  appBar: CustomAppBar(
                      hasTitle: true,
                      title: "profile",
                      subTitle: "personalinfo"),
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
                            Container(
                                height: 130.h,
                                width: 130.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(70.r),
                                  child: CachedNetworkImage(
                                      imageUrl:
                                          controller.client!.client_picture,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          ),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                            'assets/images/default.png',
                                            fit: BoxFit.cover,
                                          )),
                                )),
                            21.verticalSpace,
                            Text(
                              controller.client!.client_full_name,
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.w500),
                            ),
                            35.verticalSpace,
                            ProfileWidget(
                              text: "editpersonalinfo",
                              icon: Boxicons.bx_user,
                              onPress: () {
                                Get.to(() => EditInfoScreen());
                              },
                            ),
                            controller.client!.client_auth_type == "Email"
                                ? 22.verticalSpace
                                : 0.verticalSpace,
                            controller.client!.client_auth_type == "Email"
                                ? ProfileWidget(
                                    text: "changepassword",
                                    icon: Boxicons.bx_lock,
                                    onPress: () {
                                      Get.to(() => ChangePasswordScreen());
                                    },
                                  )
                                : Container(),
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
        });
  }
}
