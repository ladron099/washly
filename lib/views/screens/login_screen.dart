import 'package:boxicons/boxicons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:washly/controllers/loginController.dart';
import 'package:washly/utils/buttons.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/views/components/loading_screen.dart';
import 'package:washly/views/components/widgets.dart';
import 'package:washly/views/screens/home_screen.dart';
import 'package:washly/views/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        return LoadingScreen(
          loading: controller.loading.value,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  83.verticalSpace,
                  Container(
                      height: 62.h,
                      child: Center(
                        child: const Image(
                            image: AssetImage('assets/images/rlogo.png')),
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
                        'enteraccountinfo',
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
                      controller: controller.emailController,
                      visible: false,
                      hint: "email",
                      inputIcon: Icon(Boxicons.bx_envelope),
                      validator: (text) {},
                    ),
                  ),
                  25.verticalSpace,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            print("object");
                          },
                          child: Text(
                            'forgetpassword',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: primaryColor,
                            ),
                          ).tr(),
                        ),
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: PrimaryButton(
                      onpress: () async {
                        if (formKey.currentState!.validate()) {
                          // await GetStorage().write("isLoggedIn", true);
                          // Get.to(() => HomeScreen(),
                          //     transition: Transition.rightToLeft);
                          controller.validate();
                        }
                      },
                      text: 'login',
                    ),
                  ),
                  20.verticalSpace,
                  Container(
                    height: 2.h,
                    color: borderGreyColor,
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: PrimaryButton(
                      color: Colors.red,
                      icon: Icon(
                        FontAwesomeIcons.googlePlusG,
                        color: Colors.white,
                        size: 22.sp,
                      ),
                      onpress: () {
                        controller.signInWithGoogle(context);
                      },
                      text: 'loginggle',
                    ),
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: PrimaryButton(
                      color: Color(0xFF2B468E),
                      icon: Icon(
                        FontAwesomeIcons.facebookF,
                        color: Colors.white,
                        size: 22.sp,
                      ),
                      onpress: () {
                        controller.signInWithFacebook(context);
                      },
                      text: 'loginfb',
                    ),
                  ),
                  30.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "donthaveaccount",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                        ),
                      ).tr(),
                      5.horizontalSpace,
                      InkWell(
                        onTap: () {
                          Get.to(
                            () => RegisterScreen(),
                          );
                        },
                        child: Text(
                          'signup',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: primaryColor,
                          ),
                        ).tr(),
                      ),
                    ],
                  ),
                  30.verticalSpace,
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
