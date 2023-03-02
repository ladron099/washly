import 'package:boxicons/boxicons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:washly/utils/buttons.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/views/components/widgets.dart';
import 'package:washly/views/screens/phone_screen.dart';

import '../../controllers/registerController.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      extendBodyBehindAppBar: true,
      body: GetBuilder<RegisterController>(
          init: RegisterController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  82.verticalSpace,
                  Container(
                      height: 62.h,
                      child: Center(
                        child:
                            Image(image: AssetImage('assets/images/rlogo.png')),
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
                        'createaccount',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                        ),
                      ).tr(),
                    ),
                  ),
                  30.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: TextFieldPrimary(
                      controller: controller.firstNameController,
                      visible: false,
                      hint: "firstname",
                      inputIcon: Icon(Boxicons.bx_user),
                    ),
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: TextFieldPrimary(
                      
                      controller: controller.lastNameController,
                      visible: false,
                      hint: "lastname",
                      inputIcon: Icon(Boxicons.bx_user),
                    ),
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: TextFieldPrimary(
                      controller: controller.emailController,
                      visible: false,
                      hint: "email",
                      inputIcon: Icon(Boxicons.bx_envelope),
                    ),
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: TextFieldPrimary(
                      controller: controller.passwordController,
                      visible: true,
                      hint: "password",
                      inputIcon: Icon(Boxicons.bx_lock_alt),
                    ),
                  ),
                  15.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      "byclickingprivacy",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black,
                      ),
                    ).tr(),
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: PrimaryButton(
                      onpress: () {
                        controller.submit();
                      },
                      text: 'signup',
                    ),
                  ),
                  20.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                        ),
                      ).tr(),
                      5.horizontalSpace,
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Text(
                          'login',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ).tr(),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
