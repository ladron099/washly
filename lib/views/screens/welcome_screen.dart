import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:washly/utils/buttons.dart';
import 'package:washly/views/screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
            child:
                const Image(image: AssetImage('assets/images/splashback.png')),
          ),
          70.verticalSpace,
          Center(
            child: Text(
              'cleanyourcar',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ).tr(),
          ),
          23.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 54.w),
            child: PrimaryButton(
                onpress: () async {
                  await GetStorage().write("isFirstTime", true);
                  Get.to(() => LoginScreen());
                },
                text: "getstarted"),
          )
        ],
      ),
    );
  }
}
