import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:washly/utils/buttons.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/views/components/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../utils/services.dart';

class ChangeProfilePictureScreen extends StatelessWidget {
  const ChangeProfilePictureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
            hasTitle: true,
            title: 'profilechange'.tr(),
            subTitle: "profilechange".tr()),
        body: Container(
            width: 375.w,
            height: 812.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    62.verticalSpace,
                    ClipRRect(
                      child: Image.asset(
                        "assets/images/profile.png",
                        fit: BoxFit.cover,
                        width: 190.w,
                        height: 190.w,
                      ),
                    ),
                    31.verticalSpace,
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "uploadyourself",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: primaryColor),
                      ).tr(),
                    ),
                    300.verticalSpace,
                    PrimaryButton(text: 'save'.tr(), onpress: () {})
                  ],
                )))));
  }
}