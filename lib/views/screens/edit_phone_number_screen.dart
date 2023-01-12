

import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/views/components/widgets.dart';
import 'package:washly/views/screens/reverify_phone_number.dart';

import '../../utils/buttons.dart';
import '../../utils/services.dart';

class ChangePhoneNumberScreen extends StatelessWidget {
  const ChangePhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
            hasTitle: true,
            title: 'changepassword',
            subTitle: "changepassword"),
        body: Container(
            width: 375.w,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            37.verticalSpace,
             
            
            Center(
              child: Text(
                'enterphonenumber',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 17.sp,
                  color: Colors.black,
                ),
              ).tr(),
            ),
            29.verticalSpace,
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
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: borderGreyColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(color: primaryColor),
                    ),
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
                    hintText: "phone",
                    hintStyle: TextStyle(
                      fontSize: 15.sp,
                      color: borderGreyColor,
                    ),
                    filled: true,
                    fillColor: Colors.transparent,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: borderGreyColor, width: 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ),
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                "washlywillnever",
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
                  Get.to(() => ReverifyPhoneScreen(), transition: Transition.rightToLeft);
                },
                text: 'save',
              ),
            ),
            20.verticalSpace,
                             ],
                          )
                      )));
  }
}