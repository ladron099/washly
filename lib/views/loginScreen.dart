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
import 'package:washly/views/registerScreen.dart';

import '../components/input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            80.verticalSpace,
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
                  'Please enter your account information to login',
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
                hint: "E-mail address",
                inputIcon: Icon(Boxicons.bx_envelope),
              ),
            ),
            25.verticalSpace,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      print("object");
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 15.sp, 
                        color: primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: PrimaryButton(
                onpress: () {},
                text: 'Login',
              ),
            ),
            20.verticalSpace,
            Container(
              height: 2.h,
              color: borderGrey,
            ),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: PrimaryButton(
                color: Colors.red,
                icon: Icon(
                  FontAwesomeIcons.googlePlusG,
                  color: Colors.white,
                  size: 22.sp,
                ),
                onpress: () {},
                text: 'Login with Google',
              ),
            ),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: PrimaryButton(
                color: Color(0xFF2B468E),
                icon: Icon(
                  FontAwesomeIcons.facebookF,
                  color: Colors.white,
                  size: 22.sp,
                ),
                onpress: () {},
                text: 'Login with Facebook',
              ),
            ),
            30.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 15.sp, 
                    color: Colors.black,
                  ),
                ),
                5.horizontalSpace,
                InkWell(
                  onTap: () {
                    Get.to(
                      () => RegisterScreen(),
                    );
                    
                   
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 15.sp, 
                      color: primary,
                    ),
                  ),
                ),
              ],
            ),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }
}
