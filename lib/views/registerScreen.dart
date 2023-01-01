import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
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
import 'package:washly/views/phoneScreen.dart';

import '../components/input.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
          mainAxisAlignment: MainAxisAlignment.start,
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
                  'Please enter your information below to create a new account to use the app.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.sp,
                     color: Colors.black,
                  ),
                ),
              ),
            ),
            30.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: TextFieldPrimary(
                visible: false,
                hint: "First name",
                inputIcon: Icon(Boxicons.bx_user),
              ),
            ),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: TextFieldPrimary(
                visible: false,
                hint: "Last name",
                inputIcon: const Icon(Boxicons.bx_user),
              ),
            ),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: TextFieldPrimary(
                visible: false,
                hint: "E-mail address",
                inputIcon: Icon(Boxicons.bx_envelope),
              ),
            ),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: TextFieldPrimary(
                visible: true,
                hint: "Password",
                inputIcon: const Icon(Boxicons.bx_lock_alt),
              ),
            ),
            15.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Text(
                "By clicking on Register, you agree to our privacy policy, our terms of use",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp, 
                  color: Colors.black,
                ),
              ),
            ),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: PrimaryButton(
                onpress: () {
                  Get.to(
                    () => const PhoneScreen(),

                  );
                },
                text: 'Register',
              ),
            ),
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You already have an account ?",
                  style: TextStyle(
                    fontSize: 15.sp,  
                    color: Colors.black,
                  ),
                ),
                5.horizontalSpace,
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: primary,
                    ),
                  ),
                ),
              ],
            ), 
          ],
        ),
      ),
    );
  }
}
