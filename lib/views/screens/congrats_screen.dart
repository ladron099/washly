import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:washly/utils/buttons.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/views/screens/home_screen.dart';

class CongratsScreen extends StatelessWidget {
  const CongratsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 66.h,
              child: Center(
                child: Image(image: AssetImage('assets/images/rlogo.png')),
              )),
          41.verticalSpace,
          Center(
            child: Image(image: AssetImage('assets/images/waitingback.png')),
          ),
          38.verticalSpace,
          Center( 
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.w),
              child: Text(
                'wearehappy',
                textAlign: TextAlign.center ,
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ).tr(),
            ),
          ),
          31.verticalSpace,
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.w),
              child: PrimaryButton(
                  text: "next",
                  onpress: () {
                    Get.to(() => HomeScreen(), transition: Transition.rightToLeft);
                            })),
          23.verticalSpace,
        ],
      ),
    );
  }
}
