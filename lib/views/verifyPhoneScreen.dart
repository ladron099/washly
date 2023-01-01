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
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:washly/components/buttons.dart';
import 'package:washly/components/vars.dart';
import 'package:washly/views/identityScreen.dart';
import 'package:washly/views/joinUs.dart';

import '../components/input.dart';

class VerifyPhoneScreen extends StatelessWidget {
  const VerifyPhoneScreen({super.key});

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
                  'Enter the code we send you +212 695 999 333',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.sp, 
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            30.verticalSpace,
           PinCodeTextField(
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
             defaultBorderColor: borderGrey,
             
            
            
             
           ),  35.verticalSpace,
           20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: PrimaryButton(
                onpress: () {
                  Get.to(
                    () => JoinUsScreen(),
                  );
                },
                text: 'Verify',
              ),
            ),
            
            20.verticalSpace,
               Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Didn\'t receive the code ? ',
                    style: TextStyle(
                      fontSize: 18.sp, 
                      color: Colors.black,
                    ),
                  ),
                 InkWell(
                    onTap: (){},
                    child:  Text(
                    'Send again',
                    style: TextStyle(
                      fontSize: 18.sp, 
                      color: primary,
                    ),
                  ),
                 )
                ],
              )
            ),
           
          ],
        ),
      ),
    );
  }
}
