import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:washly/utils/buttons.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/views/components/widgets.dart';
import 'package:washly/views/screens/home_screen.dart';

class IdentityScreen extends StatelessWidget {
  const IdentityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            82.verticalSpace,
            Image(image: AssetImage('assets/images/rlogo.png'), height: 66.h,),
            40.verticalSpace,
            Text(
              'Washly',
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            34.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 83.w),
              child: Center(
                child: Text(
                  'uploadyouridentity',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                  ),
                ).tr(),
              ),
            ),
            15.verticalSpace,
            Container(
                height: 230.h,
                child: Image(image: AssetImage('assets/images/identity.png'))),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Text(
                "uploaddoc",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: primaryColor,
                ),
              ).tr(),
            ),
            146.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: PrimaryButton(
                onpress: () {
                  Get.offAll(
                    () => HomeScreen(),
                  );
                },
                text: 'done',
              ),
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
