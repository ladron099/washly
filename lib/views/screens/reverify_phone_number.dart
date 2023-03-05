import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart' as u;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:washly/controllers/reverifyPhoneController.dart';
import 'package:washly/utils/buttons.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/views/components/widgets.dart';
import 'package:washly/views/screens/congrats_screen.dart';
import 'package:washly/views/screens/home_screen.dart';

class ReverifyPhoneScreen extends StatelessWidget {
  const ReverifyPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReverifyPhoneController>(
        init: ReverifyPhoneController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.white,
            extendBodyBehindAppBar: true,
            appBar: CustomAppBar(
                hasTitle: true,
                title: "verifyyourphone",
                subTitle: "verifyyourphone"),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  82.verticalSpace,
                  Container(
                      height: 66.h,
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
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            'enterthecode',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                            ),
                          ).tr(),
                          Text(
                            controller.tmpUser.phoneNo.toString(),
                          )
                        ],
                      ),
                    ),
                  ),
                  35.verticalSpace,
                  PinCodeTextField(
                    controller: controller.code,
                    maxLength: 6,
                    autofocus: true,
                    keyboardType: TextInputType.phone,
                    pinBoxWidth: 45.w,
                    pinBoxHeight: 45.h,
                    pinBoxRadius: 10.r,
                    pinBoxColor: Colors.white,
                    pinBoxBorderWidth: 1,
                    errorBorderColor: Colors.red,
                    hasTextBorderColor: Colors.green,
                    defaultBorderColor: borderGreyColor,
                  ),
                  35.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: PrimaryButton(
                      onpress: () {
                        controller.submit(context);
                        // Get.offAll(
                        //   () => HomeScreen(),
                        //   transition: Transition.rightToLeft
                        // );
                      },
                      text: u.tr('verify'),
                    ),
                  ),
                  40.verticalSpace,
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'didntrecivecode',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.black,
                            ),
                          ).tr(),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'sendagain',
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: primaryColor,
                              ),
                            ).tr(),
                          )
                        ],
                      )),
                ],
              ),
            ),
          );
        });
  }
}
