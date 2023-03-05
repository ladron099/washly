import 'package:boxicons/boxicons.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/easy_localization.dart' as u;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:washly/controllers/phoneController.dart';
import 'package:washly/utils/buttons.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/views/components/loading_screen.dart';
import 'package:washly/views/components/waveLoading.dart';

class PhoneScreen extends StatelessWidget {
  PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhoneController>(
        init: PhoneController(),
        builder: (controller) {
          return controller.loading.value
              ? WaveLoadingScreen()
              : Scaffold(
                  backgroundColor: Colors.white,
                  extendBodyBehindAppBar: true,
                  appBar: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    leading: IconButton(
                      icon: Icon(
                        Boxicons.bx_left_arrow_alt,
                        size: 26.w,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        82.verticalSpace,
                        Container(
                            height: 66.h,
                            child: Center(
                              child: Image(
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
                              'enterphonenumber',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black,
                              ),
                            ).tr(),
                          ),
                        ),
                        29.verticalSpace,
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: SizedBox(
                            height: 70.h,
                            child: TextField(
                              controller: controller.phone,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.phone,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                                LengthLimitingTextInputFormatter(9),
                              ],
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide:
                                      BorderSide(color: borderGreyColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.r),
                                  borderSide: BorderSide(color: primaryColor),
                                ),
                                prefixIcon: CountryCodePicker(
                                  onChanged: (CountryCode countryCode) {
                                    controller.indicatif =
                                        countryCode.toString();
                                    print(controller.indicatif);
                                  },
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
                                hintText: u.tr("phone"),
                                hintStyle: TextStyle(
                                  fontSize: 15.sp,
                                  color: borderGreyColor,
                                ),
                                filled: true,
                                fillColor: Colors.transparent,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: borderGreyColor, width: 2),
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
                              controller.submit(context);
                            },
                            text: 'next',
                          ),
                        ),
                        20.verticalSpace,
                      ],
                    ),
                  ),
                );
        });
  }
}
