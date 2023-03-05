import 'package:boxicons/boxicons.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:washly/utils/constants.dart';
import 'package:washly/views/components/widgets.dart';
import 'package:washly/views/screens/on_road_order_screen.dart';

import '../../controllers/completeOrderController.dart';
import '../../controllers/reviewCheckoutController.dart';
import '../../utils/buttons.dart';
import '../../utils/services.dart';
import 'searching_scrubber_screen.dart';

class ReviewCheckOutScreen extends StatelessWidget {
  const ReviewCheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
          hasTitle: true, title: "payment", subTitle: "reviewandchekout"),
      body: GetBuilder<ReviewCheckOutController>(
          init: ReviewCheckOutController(),
          builder: (controller) {
            return ScrollConfiguration(
              behavior: MyBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    22.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: CarWidget(
                        order: controller.order,
                      ),
                    ),
                    20.verticalSpace,
                    Container(
                      width: double.infinity,
                      height: 2.h,
                      color: primaryColor,
                    ),
                    15.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Boxicons.bx_current_location,
                            color: primaryColor,
                          ),
                          10.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "address",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                ),
                              ).tr(),
                              12.verticalSpace,
                              Text(
                                "Rue de far 12, Casablanca, Morocco",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    15.verticalSpace,
                    Container(
                      width: double.infinity,
                      height: 2.h,
                      color: primaryColor,
                    ),
                    16.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Boxicons.bx_help_circle,
                            color: primaryColor,
                          ),
                          10.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "service",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                ),
                              ).tr(),
                              18.verticalSpace,
                              Text(
                                "Standard",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    15.verticalSpace,
                    Container(
                      width: double.infinity,
                      height: 2.h,
                      color: primaryColor,
                    ),
                    16.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Boxicons.bx_gift,
                            color: primaryColor,
                          ),
                          10.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "coupon",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                ),
                              ).tr(),
                              18.verticalSpace,
                              Text(
                                "15.00 MAD Discount",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15.sp, color: secondaryColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    15.verticalSpace,
                    Container(
                      width: double.infinity,
                      height: 2.h,
                      color: primaryColor,
                    ),
                    21.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Boxicons.bx_dollar,
                            color: primaryColor,
                          ),
                          10.horizontalSpace,
                          SizedBox(
                            width: 280.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "payment",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).tr(),
                                  ],
                                ),
                                18.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "paymentmethod",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).tr(),
                                    Text(
                                      "cash",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).tr(),
                                  ],
                                ),
                                10.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "subtotal",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).tr(),
                                    Text(
                                      "70.00 MAD",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).tr(),
                                  ],
                                ),
                                10.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "fees",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).tr(),
                                    Text(
                                      "5.00 MAD",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).tr(),
                                  ],
                                ),
                                10.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "discount",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).tr(),
                                    Text(
                                      "0.00 MAD",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).tr(),
                                  ],
                                ),
                                10.verticalSpace,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "total",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).tr(),
                                    Text(
                                      "75.00 MAD",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ).tr(),
                                  ],
                                ),
                                100.verticalSpace,
                                SizedBox(
                                    width: 300.w,
                                    height: 49.h,
                                    child: PrimaryButton(
                                        text: "done",
                                        color: secondaryColor,
                                        onpress: () {
                                          Get.to(
                                              () => SearchingScrubberScreen(),
                                              transition:
                                                  Transition.rightToLeft);
                                        })),
                                26.verticalSpace,
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
