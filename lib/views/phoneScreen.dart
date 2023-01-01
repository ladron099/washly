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
import 'package:washly/views/verifyPhoneScreen.dart';

import '../components/input.dart';

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({super.key});

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
                  'Enter your phone number to send you a verification code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.sp, 
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            15.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                height: 70.h,
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.phone,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    LengthLimitingTextInputFormatter(9),
                  ],
                  style: TextStyle(
                    fontSize: 15.sp, 
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: CountryCodePicker(
                      onChanged: (CountryCode countryCode) {},
                      initialSelection: 'MA',
                      favorite: const ['+212', 'MA'],
                      showCountryOnly: false,
                      showOnlyCountryWhenClosed: false,
                      alignLeft: false,
                      textStyle: TextStyle(
                        fontSize: 15.sp, 
                        color: Colors.black,
                      ),
                      flagWidth: 25.w,
                    ),
                    hintText: 'Phone number',
                    hintStyle: TextStyle(
                      fontSize: 15.sp, 
                      color: borderGrey,
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: primary, width: 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: borderGrey, width: 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35.w),
              child: Text(
                "Washly will never share your number with other companies or use it for marketing purposes.",
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
                    () => const VerifyPhoneScreen(),
                  );
                },
                text: 'Next',
              ),
            ),
            20.verticalSpace,
             
          ],
        ),
      ),
    );
  }
}
