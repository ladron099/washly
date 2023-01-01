import 'package:boxicons/boxicons.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:washly/components/buttons.dart';
import 'package:washly/components/vars.dart';
import 'package:washly/views/requestScreen.dart';

import '../components/input.dart';

class IdentityScreen extends StatelessWidget {
  const IdentityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
         elevation: 0, 
        leading: IconButton(
          icon: Icon(
            Boxicons.bx_left_arrow_alt,
            size: 26.w,
            color: primary,
          ),
          onPressed: () {
            Get.back();
          },
        ),),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
            Container(
                height: 66.h,
                child: Center(
                  child:
                      const Image(image: AssetImage('assets/images/rlogo.png')),
                )),
            40.verticalSpace,
            Center(
              child: Text(
                'Washly',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            34.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 83.w),
              child: Center(
                child: Text(
                  'Upload your identity document (ID card, passport or driver\'s license)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.sp, 
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            15.verticalSpace,
           Container(
                height: 230.h,
                child: Center(
                  child:
                      const Image(image: AssetImage('assets/images/identity.png')),
                )), 
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Text(
                "Download your identity document",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp, 
                  color: primary,
                ),
              ),
            ),
            146.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: PrimaryButton(
                onpress: () {
                  Get.offAll(
                    () => RequestScreen(),
                  );
                },
                text: 'Done',
              ),
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
