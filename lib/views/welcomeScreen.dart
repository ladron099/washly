import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:washly/components/buttons.dart';
import 'package:washly/components/vars.dart';

import 'loginScreen.dart';

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
                child:
                    const Image(image: AssetImage('assets/images/rlogo.png')),
              )),
          41.verticalSpace,
          Container(
              child: Center(
            child:
                const Image(image: AssetImage('assets/images/splashback.png')),
          )),
          70.verticalSpace,
          Center(
            child: Text(
              'Clean Your Car',
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          3.verticalSpace,
          Center(
            child: Text(
              'Right Now',
              style: TextStyle(
                fontSize: 30.sp,
                 color: Colors.black,
              ),
            ),
          ),
          23.verticalSpace,
        Padding(
          padding:   EdgeInsets.symmetric(horizontal: 54.w),
          child: PrimaryButton(onpress: (){

            Get.to(()=> const LoginScreen());
          }, text: "Get Started"),
        )
            
        ],
      ),
    );
  }
}
